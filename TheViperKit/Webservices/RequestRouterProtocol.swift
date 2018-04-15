//
//  RequestRouterProtocol.swift
//  TheViperKit
//
//  Created by Susmita Horrow on 18/01/18.
//  Copyright © 2018 hsusmita. All rights reserved.
//

import Foundation
import Alamofire

enum ActionType {
	case get
	case head
	case post
	case put
	case patch
	case delete

	var httpMethod: HTTPMethod {
		switch self {
		case .get:
			return HTTPMethod.get
		case .head:
			return HTTPMethod.head
		case .post:
			return HTTPMethod.post
		case .put:
			return HTTPMethod.put
		case .patch:
			return HTTPMethod.patch
		case .delete:
			return HTTPMethod.delete
		}
	}
}

protocol RequestRouterProtocol: LabelProvider {
	var path: String { get }
	var baseUrl: String { get }
	var headers: [String: String] { get }
	var timeoutInterval: TimeInterval { get }
	var parameters: [String: Any]? { get }
	var method: ActionType { get }
}

extension RequestRouterProtocol {
	var urlParameters: [String: Any]? {
		switch method {
		case .post, .patch, .put:
			return nil
		default:
			return parameters
		}
	}

	func urlRequest() -> URLRequestConvertible {
		let urlString = baseUrl + path
		let url =  URL(string: urlString)!
		var mutableURLRequest = URLRequest(url: url)
		mutableURLRequest.httpMethod = method.httpMethod.rawValue
		headers.forEach { mutableURLRequest.setValue($1, forHTTPHeaderField: $0) }
		mutableURLRequest = method.httpMethod.appendHttpBody(for: mutableURLRequest, with: parameters ?? [:])
		let request = try! URLEncoding.default.encode(mutableURLRequest, with: urlParameters)
		return request
	}
}

fileprivate extension HTTPMethod {
	func appendHttpBody(for request: URLRequest, with parameters: [String: Any] = [:]) -> URLRequest {
		var mutableRequest = request
		let params = parameters
		switch self {
		case .post, .patch, .put:
			do {
				mutableRequest.httpBody = try JSONSerialization.data(
					withJSONObject: params,
					options: JSONSerialization.WritingOptions()
				)
			} catch {
				print(error.localizedDescription)
			}
		default:
			break
		}
		return mutableRequest
	}
}
