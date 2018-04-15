//
//  RequestRouter.swift
//  TheViperKit
//
//  Created by Susmita Horrow on 18/01/18.
//  Copyright © 2018 hsusmita. All rights reserved.
//

import Foundation

enum RequestRouter: RequestRouterProtocol {
	case fetchList
	case fetchDetail(id: String)

	var path: String {
		switch self {
		case .fetchList:
			return "/venues/explore"
		case .fetchDetail(let id):
			return "/venues/\(id)"
		}
	}

	var baseUrl: String {
		return "https://api.foursquare.com/v2"
	}

	var headers: [String: String] {
		return [:]
	}

	var parameters: [String: Any]? {
		switch self {
		case .fetchList:
			return ["client_id" : "HW1JRRFVFQVOXQKK2CNV03KWGNTIBTFUUQVBIBUBMUP1WYCL",
			        "client_secret": "VAEEX52MQNMEL234YIWWJM4EB4W322E2R1A4ZCFLBYYGETMJ",
			        "v": "20171231",
			        "near": "Noida",
			        "radius": "1000",
			        "categoryId": "4d4b7105d754a06374d81259"]

		case .fetchDetail:
		return ["client_id" : "HW1JRRFVFQVOXQKK2CNV03KWGNTIBTFUUQVBIBUBMUP1WYCL",
		        "client_secret": "VAEEX52MQNMEL234YIWWJM4EB4W322E2R1A4ZCFLBYYGETMJ",
		        "v": "20171231"]

		}
	}

	var method: ActionType {
		switch self {
		case .fetchList, .fetchDetail:
			return .get
		}
	}

	var timeoutInterval: TimeInterval {
		return 60.0
	}
}
