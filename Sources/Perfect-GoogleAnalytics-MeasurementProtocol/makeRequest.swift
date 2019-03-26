//
//  makeRequest.swift
//  Perfect-GoogleAnalytics-MeasurementProtocol
//
//  Created by Jonathan Guthrie on 2017-01-04.
//
//

//
//  makeRequest.swift
//  PerfectCouchDB
//
//  Created by Jonathan Guthrie on 2016-10-25.
//
//

import PerfectLib
import PerfectCURL
import cURL
import Foundation


extension PerfectGAEvent {


	/// The function that triggers the specific interaction with the Google Server
	public func makeRequest(
		useragent: String = "PerfectServer2.0",
		body: String = ""
		) -> [String: Any] {

		var url = "https://www.google-analytics.com/collect"

		let curlObject = CURL(url: url)
		curlObject.setOption(CURLOPT_HTTPHEADER, s: "Accept: application/json")
		curlObject.setOption(CURLOPT_HTTPHEADER, s: "Cache-Control: no-cache")
		curlObject.setOption(CURLOPT_USERAGENT, s: useragent)


		if !body.isEmpty {
			let byteArray = [UInt8](body.utf8)
			curlObject.setOption(CURLOPT_POST, int: 1)
			curlObject.setOption(CURLOPT_POSTFIELDSIZE, int: byteArray.count)
			curlObject.setOption(CURLOPT_COPYPOSTFIELDS, v: UnsafeMutablePointer(mutating: byteArray))
			curlObject.setOption(CURLOPT_HTTPHEADER, s: "Content-Type: application/json")
		}



		var header = [UInt8]()
		var bodyIn = [UInt8]()

		var code = 0
		var data = [String: Any]()
		var raw = [String: Any]()

		var perf = curlObject.perform()
		defer { curlObject.close() }

		while perf.0 {
			if let h = perf.2 {
				header.append(contentsOf: h)
			}
			if let b = perf.3 {
				bodyIn.append(contentsOf: b)
			}
			perf = curlObject.perform()
		}
		if let h = perf.2 {
			header.append(contentsOf: h)
		}
		if let b = perf.3 {
			bodyIn.append(contentsOf: b)
		}
		let _ = perf.1

		// Parsing now:

		// assember the header from a binary byte array to a string
		let headerStr = String(bytes: header, encoding: String.Encoding.utf8)

		// parse the header
		let http = HTTPHeaderParser(header:headerStr!)

		// assamble the body from a binary byte array to a string
		let _ = String(bytes:bodyIn, encoding:String.Encoding.utf8)

		// prepare the failsafe content.
		raw = ["status": http.status, "header": headerStr!]
		return raw
	}
}

/// A lightweight HTTP Response Header Parser
/// transform the header into a dictionary with http status code
public class HTTPHeaderParser {

	private var _dic: [String:String] = [:]
	private var _version: String? = nil
	private var _code : Int = -1
	private var _status: String? = nil

	/// HTTPHeaderParser default constructor
	/// - header: the HTTP response header string
	public init(header: String) {

		// parse the header into lines,
		_ = header.components(separatedBy: .newlines)
			// remove all null lines
			.filter{!$0.isEmpty}
			// map each line into the dictionary
			.map{

				// most HTTP header lines have a patter of "variable name: value"
				let range = $0.range(of: ":")

				if (range == nil && $0.hasPrefix("HTTP/")) {
					// except the first line, typically "HTTP/1.0 200 OK", so split it first
					let http = tokenize($0)

					// parse the tokens
					_version = trimmed(http[0])
					_code = Int(http[1]) ?? 0
					_status = trimmed(http[2])
				} else {

					// split the line into a dictionary item expression
					//	let key = $0.left(range)
					//	let val = $0.right(range).trimmed()
					let key = $0.substring(to: (range?.upperBound)!)
					let val = trimmed($0.substring(from: (range?.lowerBound)!))

					// insert or update the dictionary with this item
					_dic.updateValue(val, forKey: key)
				}
		}
	}


	/// split the string into a string array by white spaces
	func tokenize(_ str: String) -> [String] {
		return str.components(separatedBy: .whitespaces)
	}

	func trimmed(_ str: String) -> String {
		return str.trimmingCharacters(in: .whitespacesAndNewlines)
	}

	/// HTTP response header information by keywords
	public var variables: [String:String] {
		get { return _dic }
	}

	/// The HTTP response code, e.g.,, HTTP/1.1 200 OK -> let code = 200
	public var code: Int {
		get { return _code }
	}

	/// The HTTP response code, e.g.,, HTTP/1.1 200 OK -> let status = "OK"
	public var status: String {
		get { return _status! }
	}

	/// The HTTP response code, e.g.,, HTTP/1.1 200 OK -> let version = "HTTP/1.1"
	public var version: String {
		get { return _version! }
	}
}
