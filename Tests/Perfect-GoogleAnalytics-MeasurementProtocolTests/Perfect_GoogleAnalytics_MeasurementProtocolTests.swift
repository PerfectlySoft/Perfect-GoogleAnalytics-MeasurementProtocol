import XCTest
@testable import Perfect_GoogleAnalytics_MeasurementProtocol

class Perfect_GoogleAnalytics_MeasurementProtocolTests: XCTestCase {
	override func setUp() {
		PerfectGAMeasurementProtocol.propertyid = "UA-45349601-5"
	}


	//https://developers.google.com/analytics/devguides/collection/protocol/v1/devguide#commonhits


    func testExample() {
		let gaex = PerfectGAEvent()
		gaex.user.uid = "donkey"
		gaex.user.cid = "kong"
		gaex.session.ua = "aua"
		gaex.traffic.ci = "ci"
		gaex.system.fl = "x"
		gaex.hit.ni = 2


		do {
			let str = try gaex.generate()
			print(str)
			let resp = gaex.makeRequest(useragent: "TestingAPI1.0", body: str)
			print(resp)
		} catch {
			print("\(error)")
		}

    }


    static var allTests : [(String, (Perfect_GoogleAnalytics_MeasurementProtocolTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
