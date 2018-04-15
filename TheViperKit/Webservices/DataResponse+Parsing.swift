//
//  DataResponse+Parsing.swift
//  TheViperKit
//
//  Created by Susmita Horrow on 18/01/18.
//  Copyright © 2018 hsusmita. All rights reserved.
//

import Foundation
import Alamofire

extension DataResponse {
	func parseError() -> ApplicationError {
		let decoder = JSONDecoder()
			do {
				let apiError = try decoder.decode(APIError.self, from: self.data!)
				print("Got Error from server = \(apiError.debugDescription))")
				return apiError
			} catch (let error) {
				print("Error while parsing error: \(error)")
				return ServerError(message: "Wrong Error Format")
			}
	}

	func parseData<Value: Codable>() -> ServiceResult<Value> {
		do {
			let decoder = JSONDecoder()
			let result = try decoder.decode(Root<Value>.self, from: self.data!).value
			return ServiceResult.success(result)
		} catch {
			let error = ParsingError(error: error as! DecodingError)
			print(error.debugDescription)
			return ServiceResult.failure(error)
		}
	}
}
