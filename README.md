# Perfect Google Analytics Measurement Protocol

[![Perfect logo](http://www.perfect.org/github/Perfect_GH_header_854.jpg)](http://perfect.org/get-involved.html)

[![Perfect logo](http://www.perfect.org/github/Perfect_GH_button_1_Star.jpg)](https://github.com/PerfectlySoft/Perfect)
[![Perfect logo](http://www.perfect.org/github/Perfect_GH_button_2_Git.jpg)](https://gitter.im/PerfectlySoft/Perfect)
[![Perfect logo](http://www.perfect.org/github/Perfect_GH_button_3_twit.jpg)](https://twitter.com/perfectlysoft)
[![Perfect logo](http://www.perfect.org/github/Perfect_GH_button_4_slack.jpg)](http://perfect.ly)


[![Swift 4.0](https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![Platforms OS X | Linux](https://img.shields.io/badge/Platforms-OS%20X%20%7C%20Linux%20-lightgray.svg?style=flat)](https://developer.apple.com/swift/)
[![License Apache](https://img.shields.io/badge/License-Apache-lightgrey.svg?style=flat)](http://perfect.org/licensing.html)
[![Twitter](https://img.shields.io/badge/Twitter-@PerfectlySoft-blue.svg?style=flat)](http://twitter.com/PerfectlySoft)
[![Join the chat at https://gitter.im/PerfectlySoft/Perfect](https://img.shields.io/badge/Gitter-Join%20Chat-brightgreen.svg)](https://gitter.im/PerfectlySoft/Perfect?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![Slack Status](http://perfect.ly/badge.svg)](http://perfect.ly) [![GitHub version](https://badge.fury.io/gh/PerfectlySoft%2FPerfect-CURL.svg)](https://badge.fury.io/gh/PerfectlySoft%2FPerfect-CURL)

Google Analytics Measurement Protocol support for Perfect

This project provides a Swift interface to the [Google Analytics Measurement Protocol](https://developers.google.com/analytics/devguides/collection/protocol/v1/).

This package builds with Swift Package Manager and is part of the [Perfect](https://github.com/PerfectlySoft/Perfect) project.

Ensure you have installed and activated the latest Swift 4 tool chain.


## Example usage:

```swift
PerfectGAMeasurementProtocol.propertyid = "UA-XXXXXXXX-X"
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

```

## API Documentation

For full API documentation please visit [https://www.perfect.org/docs/api-Perfect-GoogleAnalytics-MeasurementProtocol.html](https://www.perfect.org/docs/api-Perfect-GoogleAnalytics-MeasurementProtocol.html)

## Building

Add this project as a dependency in your Package.swift file.

``` swift
.Package(url: "https://github.com/PerfectlySoft/Perfect-GoogleAnalytics-MeasurementProtocol.git", majorVersion: 3)
```

## Issues

We are transitioning to using JIRA for all bugs and support related issues, therefore the GitHub issues has been disabled.

If you find a mistake, bug, or any other helpful suggestion you'd like to make on the docs please head over to [http://jira.perfect.org:8080/servicedesk/customer/portal/1](http://jira.perfect.org:8080/servicedesk/customer/portal/1) and raise it.

A comprehensive list of open issues can be found at [http://jira.perfect.org:8080/projects/ISS/issues](http://jira.perfect.org:8080/projects/ISS/issues)

## Further Information
For more information on the Perfect project, please visit [perfect.org](http://perfect.org).
