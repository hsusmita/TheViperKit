//
//  Error.swift
//  TheViperKit
//
//  Created by Susmita Horrow on 18/01/18.
//  Copyright © 2018 hsusmita. All rights reserved.
//

import Foundation

protocol ApplicationError: LocalizedError {
	var title: String { get }
	var debugDescription: String { get }
}

public struct AnyApplicationError: ApplicationError {
	var title: String {
		return baseError.title
	}

	var debugDescription: String {
		return baseError.debugDescription
	}

	let baseError: ApplicationError

	init(_ error: ApplicationError) {
		baseError = error
	}
}

struct InternetError: ApplicationError {
	var title: String {
		return "No Internet!"
	}

	var debugDescription: String {
		return "Internet not working"
	}

	var errorDescription: String? {
		return "Internet seems to be down. Please try again after reconnecting!"
	}
}

struct ParsingError: ApplicationError {
	let error: DecodingError

	init(error: DecodingError) {
		self.error = error
	}

	var title: String {
		return "Error"
	}

	var debugDescription: String {
		switch self.error {
		case .valueNotFound(_, let context),
			 .keyNotFound(_, let context),
			 .typeMismatch(_, let context),
			 .dataCorrupted(let context):
			return "Parsing Error: " + context.debugDescription + "for path: \(context.codingPath)"
		}
	}

	var errorDescription: String? {
		return "Something went wrong. Try again!"
	}
}

struct ServerError: ApplicationError {
	var message: String

	init(message: String) {
		self.message = message
	}

	var title: String {
		return "Server Error"
	}

	var debugDescription: String {
		return "Server Error: \(message)"
	}

	var errorDescription: String? {
		return "Something went wrong. Try again!"
	}
}

struct APIError: ApplicationError, Codable {
	var title: String {
		return "API Error"
	}

	var debugDescription: String {
		return "Something went wrong."
	}
}
