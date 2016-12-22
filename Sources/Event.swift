//
//  Event.swift
//  Perfect-GoogleAnalytics-MeasurementProtocol
//
//  Created by Jonathan Guthrie on 2016-12-21.
//
//


// https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters
public struct PerfectGAEvent {
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



	/**
	==================== USER ====================
	*/

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





	/**
	==================== SESSION ====================
	*/

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






	/**
	==================== TRAFFIC SOURCES ====================
	*/

	/**
	*/

	/**
	*/

	/**
	*/

	/**
	*/

	/**
	*/

	/**
	*/

	/**
	*/

	/**
	*/

	/**
	*/





	/**
	==================== SYSTEM INFO ====================
	*/

	/**
	*/

	/**
	*/

	/**
	*/

	/**
	*/

	/**
	*/

	/**
	*/

	/**
	*/





	/**
	==================== HIT ====================
	*/

	/**
	*/

	/**
	*/





	/**
	==================== CONTENT INFORMATION ====================
	*/

	/**
	*/

	/**
	*/

	/**
	*/

	/**
	*/

	/**
	*/

	/**
	*/

	/**
	*/





	/**
	==================== APP TRACKING ====================
	*/






	/**
	==================== EVENT TRACKING ====================
	*/






	/**
	==================== E-COMMERCE ====================
	*/






	/**
	==================== ENHANCED E-COMMERCE ====================
	*/






	/**
	==================== SOCIAL INTERACTIONS ====================
	*/





	/**
	==================== TIMING ====================
	*/





	/**
	==================== EXCEPTIONS ====================
	*/





	/**
	==================== CUSTOM DIMENSIONS / METRICS ====================
	*/
	
	
	
	
	
	/**
	==================== CONTENT EXPERIMENTS ====================
	*/
	
	
	
	
	
	
	
	
	
	
	
	
	
}
