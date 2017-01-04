//
//  Enums.swift
//  Perfect-GoogleAnalytics-MeasurementProtocol
//
//  Created by Jonathan Guthrie on 2016-12-21.
//
//

public enum PerfectGAEvent_SessionControl: String {
	case start	= "start"
	case end	= "end"
	case none	= "none"
}

public enum PerfectGAEvent_HitType: String {
	case pageview		= "pageview"
	case screenview		= "screenview"
	case event			= "event"
	case transaction	= "transaction"
	case item			= "item"
	case social			= "social"
	case exception		= "exception"
	case timing			= "timing"
}
