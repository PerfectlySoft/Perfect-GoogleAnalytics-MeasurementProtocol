//
//  Event.swift
//  Perfect-GoogleAnalytics-MeasurementProtocol
//
//  Created by Jonathan Guthrie on 2016-12-21.
//
//


// https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters

/// Base type for a Google Analytics Event
public class PerfectGAEvent {

	/// Sets the property ID from the settings
	public init(){
		tid = PerfectGAMeasurementProtocol.propertyid
	}


	/// generates the URL Encoded string for the body of the request
	public func generate() throws -> String {

		do {
			let _ = try validated()
		} catch {
			throw error
		}

		var strArr = ["v=\(v)"]
		strArr.append("tid=\(tid)")
		if aip == true { strArr.append("aip=1") }
		if !ds.isEmpty { strArr.append("ds=\(ds)") }
		if qt > 0 { strArr.append("qt=\(qt)") }

		strArr += user.toStrings()
		strArr += session.toStrings()
		strArr += traffic.toStrings()
		strArr += system.toStrings()
		strArr += hit.toStrings()
		strArr += content.toStrings()
		strArr += appTracking.toStrings()
		strArr += eventTracking.toStrings()
		strArr += ecomm.toStrings()
		strArr += social.toStrings()
		strArr += timing.toStrings()
		strArr += exeption.toStrings()
		strArr += contentExperiments.toStrings()


		return strArr.joined(separator: "&")
	}

	/**
	Protocol Version.
	Required. Current value is 1
	*/
	let v = 1

	/**
	Tracking ID / Web Property ID
	Required for all hit types.
	The tracking ID / web property ID. The format is UA-XXXX-Y. All collected data is associated by this ID.
	*/
	public var tid = ""

	/**
	Anonymize IP
	Optional.
	When present, the IP address of the sender will be anonymized. For example, the IP will be anonymized if any of the following parameters are present in the payload: &aip=, &aip=0, or &aip=1
	*/
	public var aip = false

	/**
	Data Source
	Optional.
	Indicates the data source of the hit. Hits sent from analytics.js will have data source set to 'web'; hits sent from one of the mobile SDKs will have data source set to 'app'.
	*/
	public var ds = "server"

	/**
	Queue Time
	Optional.
	Used to collect offline / latent hits. The value represents the time delta (in milliseconds) between when the hit being reported occurred and the time the hit was sent. The value must be greater than or equal to 0. Values greater than four hours may lead to hits not being processed.
	*/
	public var qt = 0

	/// The User section of the event
	public var user: UserData = UserData()

	/// The Session section of the event
	public var session: SessionData = SessionData()

	/// The Traffic section of the event
	public var traffic: TrafficData = TrafficData()

	/// The System section of the event
	public var system: SystemData = SystemData()

	/// The Hit section of the event
	public var hit: HitData = HitData()

	/// The Content section of the event
	public var content: ContentData = ContentData()

	/// The App Tracking section of the event
	public var appTracking: AppTrackingData = AppTrackingData()

	/// The Event Tracking section of the event
	public var eventTracking: EventTrackingData = EventTrackingData()

	/// The Ecommerce section of the event
	public var ecomm: EcommData = EcommData()

	/// The Social section of the event
	public var social: SocialData = SocialData()

	/// The Timing section of the event
	public var timing: TimingData = TimingData()

	/// The Exception Handling section of the event
	public var exeption: ExceptionsData = ExceptionsData()

	/// The Content Experiment section of the event
	public var contentExperiments: ContentExperimentData = ContentExperimentData()


	/**
	==================== USER ====================
	*/
	public class UserData: generateString {
		/**
		Client ID
		Required for all hit types.
		This anonymously identifies a particular user, device, or browser instance. For the web, this is generally stored as a first-party cookie with a two-year expiration. For mobile apps, this is randomly generated for each particular instance of an application install. The value of this field should be a random UUID (version 4) as described in http://www.ietf.org/rfc/rfc4122.txt
		*/
		public var cid = ""


		/**
		User ID
		Optional.
		This is intended to be a known identifier for a user provided by the site owner/tracking library user. It must not itself be PII (personally identifiable information). The value should never be persisted in GA cookies or other Analytics provided storage.
		*/
		public var uid = ""

	}




	/**
	==================== SESSION ====================
	*/

	public class SessionData: generateString {
		/**
		Session Control
		Optional.
		Used to control the session duration. A value of 'start' forces a new session to start with this hit and 'end' forces the current session to end with this hit. All other values are ignored.
		*/
		public var sc: PerfectGAEvent_SessionControl = .none

		/**
		IP Override
		Optional.
		The IP address of the user. This should be a valid IP address in IPv4 or IPv6 format. It will always be anonymized just as though &aip (anonymize IP) had been used.
		*/
		public var uip = ""

		/**
		User Agent Override
		Optional.
		The User Agent of the browser. Note that Google has libraries to identify real user agents. Hand crafting your own agent could break at any time.
		*/
		public var ua = ""

		/**
		Geographical Override
		Optional.
		The geographical location of the user. The geographical ID should be a two letter country code or a criteria ID representing a city or region (see http://developers.google.com/analytics/devguides/collection/protocol/v1/geoid). This parameter takes precedent over any location derived from IP address, including the IP Override parameter. An invalid code will result in geographical dimensions to be set to '(not set)'.
		*/
		public var geoid = ""

	}




	/**
	==================== TRAFFIC SOURCES ====================
	*/
	public class TrafficData: generateString {

		/**
		Document Referrer
		Optional.
		Specifies which referral source brought traffic to a website. This value is also used to compute the traffic source. The format of this value is a URL.
		*/
		public var dr = ""

		/**
		Campaign Name
		Optional.
		Specifies the campaign name.
		*/
		public var cn = ""

		/**
		Campaign Source
		Optional.
		Specifies the campaign source.
		*/
		public var cs = ""

		/**
		Campaign Medium
		Optional.
		Specifies the campaign medium.
		*/
		public var cm = ""

		/**
		Campaign Keyword
		Optional.
		Specifies the campaign keyword.
		*/
		public var ck = ""

		/**
		Campaign Content
		Optional.
		Specifies the campaign content.
		*/
		public var cc = ""

		/**
		Campaign ID
		Optional.
		Specifies the campaign ID.
		*/
		public var ci = ""

		/**
		Google AdWords ID
		Optional.
		Specifies the Google AdWords Id.
		*/
		public var gclid = ""

		/**
		Google Display Ads ID
		Optional.
		Specifies the Google Display Ads Id.
		*/
		public var dclid = ""

	}





	/**
	==================== SYSTEM INFO ====================
	*/

	public class SystemData: generateString {
		/**
		Screen Resolution
		Optional.
		Specifies the screen resolution.
		*/
		public var sr = ""

		/**
		Viewport size
		Optional.
		Specifies the viewable area of the browser / device.
		*/
		public var vp = ""

		/**
		Document Encoding
		Optional.
		Specifies the character set used to encode the page / document.
		*/
		public var de = ""

		/**
		Screen Colors
		Optional.
		Specifies the screen color depth.
		*/
		public var sd = ""

		/**
		User Language
		Optional.
		Specifies the language.
		*/
		public var ul = ""

		/**
		Java Enabled
		Optional.
		Specifies whether Java was enabled.
		*/
		public var je = ""

		/**
		Flash Version
		Optional.
		Specifies the flash version.
		*/
		public var fl = ""
	}





	/**
	==================== HIT ====================
	*/

	public class HitData: generateString {
		/**
		Hit type
		Required for all hit types.
		The type of hit. Must be one of 'pageview', 'screenview', 'event', 'transaction', 'item', 'social', 'exception', 'timing'.
		*/
		public var t: PerfectGAEvent_HitType = .pageview

		/**
		Non-Interaction Hit
		Optional. (Boolean, 0 or 1)
		Specifies that a hit be considered non-interactive.
		*/
		public var ni = 0
	}





	/**
	==================== CONTENT INFORMATION ====================
	*/

	public class ContentData: generateString {
		/**
		Document location URL
		Optional.
		Use this parameter to send the full URL (document location) of the page on which content resides. You can use the &dh and &dp parameters to override the hostname and path + query portions of the document location, accordingly. The JavaScript clients determine this parameter using the concatenation of the document.location.origin + document.location.pathname + document.location.search browser parameters. Be sure to remove any user authentication or other private information from the URL if present. For 'pageview' hits, either &dl or both &dh and &dp have to be specified for the hit to be valid.
		*/
		public var dl = ""

		/**
		Document Host Name
		Optional.
		Specifies the hostname from which content was hosted.
		*/
		public var dh = ""

		/**
		Document Path
		Optional.
		The path portion of the page URL. Should begin with '/'. For 'pageview' hits, either &dl or both &dh and &dp have to be specified for the hit to be valid.
		*/
		public var dp = ""

		/**
		Document Title
		Optional.
		The title of the page / document.
		*/
		public var dt = ""

		/**
		Screen Name
		Required for screenview hit type.
		This parameter is optional on web properties, and required on mobile properties for screenview hits, where it is used for the 'Screen Name' of the screenview hit. On web properties this will default to the unique URL of the page by either using the &dl parameter as-is or assembling it from &dh and &dp.
		*/
		public var cd = ""

		/**
		Content Group
		Optional.
		Each content group has an associated index. There is a maximum of 10 contents groups. The group index must be a positive integer between 1 and 10, inclusive. The value of a content group is heirarchichal text delimited by '/" All leading and trailing slashes will be removed and any repeated slashes will be reduced to a single slash. For example, '/a//b/' will be converted to 'a/b'.
		*/
		public var cg1 = ""
		public var cg2 = ""
		public var cg3 = ""
		public var cg4 = ""
		public var cg5 = ""
		public var cg6 = ""
		public var cg7 = ""
		public var cg8 = ""
		public var cg9 = ""
		public var cg10 = ""

		/**
		Link ID
		Optional.
		The ID of a clicked DOM element, used to disambiguate multiple links to the same URL in In-Page Analytics reports when Enhanced Link Attribution is enabled for the property.
		*/
		public var linkid = ""
	}





	/**
	==================== APP TRACKING ====================
	*/
	public class AppTrackingData: generateString {
		/**
		Application Name
		Optional.
		Specifies the application name. This field is required for any hit that has app related data (i.e., app version, app ID, or app installer ID). For hits sent to web properties, this field is optional.
		*/
		public var an = ""

		/**
		Application ID
		Optional.
		Application identifier.
		*/
		public var aid = ""

		/**
		Application Version
		Optional.
		Specifies the application version.
		*/
		public var av = ""

		/**
		Application Installer ID
		Optional.
		Application installer identifier.
		*/
		public var aiid = ""
	}






	/**
	==================== EVENT TRACKING ====================
	*/
	public class EventTrackingData: generateString {
		/**
		Event Category
		Required for event hit type.
		Specifies the event category. Must not be empty.
		*/
		public var ec = ""

		/**
		Event Action
		Required for event hit type.
		Specifies the event action. Must not be empty.
		*/
		public var ea = ""

		/**
		Event Label
		Optional.
		Specifies the event label.
		*/
		public var el = ""

		/**
		Event Value
		Optional.
		Specifies the event value. Values must be non-negative.
		*/
		public var ev = ""
	}






	/**
	==================== E-COMMERCE ====================
	*/
	public class EcommData: generateString {
		/**
		Transaction ID
		Required for transaction hit type.
		Required for item hit type.
		A unique identifier for the transaction. This value should be the same for both the Transaction hit and Items hits associated to the particular transaction.
		*/
		public var ti = ""

		/**
		Transaction Affiliation
		Optional.
		Specifies the affiliation or store name.
		*/
		public var ta = ""

		/**
		Transaction Revenue
		Optional.
		Specifies the total revenue associated with the transaction. This value should include any shipping or tax costs.
		*/
		public var tr = ""

		/**
		Transaction Shipping
		Optional.
		Specifies the total shipping cost of the transaction.
		*/
		public var ts = ""

		/**
		Transaction Tax
		Optional.
		Specifies the total tax of the transaction.
		*/
		public var tt = ""

		/**
		Item Name
		Required for item hit type.
		Specifies the item name.
		NOTE: The specification is uppercase to avoid conflict with Swift syntax.
		*/
		public var IN = ""

		/**
		Item Price
		Optional.
		Specifies the price for a single item / unit.
		*/
		public var ip = ""

		/**
		Item Quantity
		Optional.
		Specifies the number of items purchased.
		*/
		public var iq = ""

		/**
		Item Code
		Optional.
		Specifies the SKU or item code.
		*/
		public var ic = ""

		/**
		Item Category
		Optional.
		Specifies the category that the item belongs to.
		*/
		public var iv = ""

	}




	/**
	==================== SOCIAL INTERACTIONS ====================
	*/
	public class SocialData: generateString {
		/**
		Social Network
		Required for social hit type.
		Specifies the social network, for example Facebook or Google Plus.
		*/
		public var sn = ""

		/**
		Social Action
		Required for social hit type.
		Specifies the social interaction action. For example on Google Plus when a user clicks the +1 button, the social action is 'plus'.
		*/
		public var like = ""

		/**
		Social Action Target
		Required for social hit type.
		Specifies the target of a social interaction. This value is typically a URL but can be any text.
		*/
		public var st = ""

	}





	/**
	==================== TIMING ====================
	*/
	public class TimingData: generateString {
		/**
		User timing category
		Required for timing hit type.
		Specifies the user timing category.		
		*/
		public var utc = ""

		/**
		User timing variable name
		Required for timing hit type.
		Specifies the user timing variable.
		*/
		public var utv = ""

		/**
		User timing time
		Required for timing hit type.
		Specifies the user timing value. The value is in milliseconds.
		*/
		public var utt = ""

		/**
		User timing label
		Optional.
		Specifies the user timing label.
		*/
		public var utl = ""

		/**
		Page Load Time
		Optional.
		Specifies the time it took for a page to load. The value is in milliseconds.
		*/
		public var plt = ""

		/**
		DNS Time
		Optional.
		Specifies the time it took to do a DNS lookup.The value is in milliseconds.
		*/
		public var dns = ""

		/**
		Page Download Time
		Optional.
		Specifies the time it took for the page to be downloaded. The value is in milliseconds.
		*/
		public var pdt = ""

		/**
		Redirect Response Time
		Optional.
		Specifies the time it took for any redirects to happen. The value is in milliseconds.
		*/
		public var rrt = ""

		/**
		TCP Connect Time
		Optional.
		Specifies the time it took for a TCP connection to be made. The value is in milliseconds.
		*/
		public var tcp = ""

		/**
		Server Response Time
		Optional.
		Specifies the time it took for the server to respond after the connect time. The value is in milliseconds.
		*/
		public var srt = ""

		/**
		DOM Interactive Time
		Optional.
		Specifies the time it took for Document.readyState to be 'interactive'. The value is in milliseconds.
		*/
		public var dit = ""

		/**
		Content Load Time
		Optional.
		Specifies the time it took for the DOMContentLoaded Event to fire. The value is in milliseconds
		*/
		public var clt = ""

	}





	/**
	==================== EXCEPTIONS ====================
	*/
	public class ExceptionsData: generateString {
		/**
		Exception Description
		Optional.
		Specifies the description of an exception.
		*/
		public var exd = ""

		/**
		Is Exception Fatal?
		Optional. String as Boolean ("0" or "1")
		Specifies whether the exception was fatal.
		*/
		public var exf = ""

	}





	
	
	/**
	==================== CONTENT EXPERIMENTS ====================
	*/
	public class ContentExperimentData: generateString {
		/**
		Experiment ID
		Optional.
		This parameter specifies that this user has been exposed to an experiment with the given ID. It should be sent in conjunction with the Experiment Variant parameter.
		*/
		public var xid = ""

		/**
		Experiment Variant
		Optional.
		This parameter specifies that this user has been exposed to a particular variation of an experiment. It should be sent in conjunction with the Experiment ID parameter.
		*/
		public var xvar = ""
	}

	
	
	
	
	
	
	
	
	
	
	
	func validated() throws -> Bool {
		if tid.isEmpty { throw GAError.tidEmpty }
		if user.cid.isEmpty { throw GAError.cidEmpty }
		if hit.t == .screenview {
			if content.cd.isEmpty { throw GAError.screenViewError }
		}
		if hit.t == .event {
			if eventTracking.ec.isEmpty { throw GAError.eventTypeError }
			if eventTracking.ea.isEmpty { throw GAError.eventTypeError }
		}
		if hit.t == .transaction {
			if ecomm.ti.isEmpty { throw GAError.eventTypeError }
			if ecomm.IN.isEmpty { throw GAError.eventTypeError }
		}
		if hit.t == .social {
			if social.sn.isEmpty { throw GAError.socialTypeError }
			if social.st.isEmpty { throw GAError.socialTypeError }
			if social.like.isEmpty { throw GAError.socialTypeError }
		}
		if hit.t == .timing {
			if timing.utc.isEmpty { throw GAError.timingTypeError }
			if timing.utv.isEmpty { throw GAError.timingTypeError }
			if timing.utt.isEmpty { throw GAError.timingTypeError }
		}

		return true
	}
	
}

/// Error type
enum GAError: Error {
	case tidEmpty
	case cidEmpty
	case screenViewError
	case eventTypeError
	case transactionTypeError
	case socialTypeError
	case timingTypeError
}


/// Generates the String using introspection.
public class generateString {
	func toStrings() -> [String] {
		var out = [String]()
		let mirror = Mirror(reflecting: self)
		for case let (label?, value) in mirror.children {
			if !("\(value)").isEmpty { out.append("\(label.lowercased())=\(("\(value)").stringByEncodingURL)") }
		}
		return out
	}
	public init(){}

}
