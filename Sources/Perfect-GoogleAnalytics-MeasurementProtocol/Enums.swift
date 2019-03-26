//
//  Enums.swift
//  Perfect-GoogleAnalytics-MeasurementProtocol
//
//  Created by Jonathan Guthrie on 2016-12-21.
//
//

/// Session indicators
public enum PerfectGAEvent_SessionControl: String {
	/// Session is starting
	case start	= "start"

	/// Session is ending
	case end	= "end"

	// Default. Neither starting nor ending
	case none	= "none"
}

/// Enum describing Hit Type
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
