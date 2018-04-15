//
//  ServiceResult.swift
//  TheViperKit
//
//  Created by Susmita Horrow on 18/01/18.
//  Copyright © 2018 hsusmita. All rights reserved.
//

import Foundation

enum ServiceResult<Value> {
	case success(Value)
	case failure(ApplicationError)
}

extension ServiceResult where Value: Any {
    func resultMapper<U>() -> ServiceResult<U> {
        switch self {
        case .success(let value):
            return .success(value as! U)
        case .failure(let error):
            return .failure(error)
        }
    }
//    
//    func paginatedResultMapper<U>() -> Result<PaginatedResponse<U>> {
//        switch self {
//        case .success(let value):
//            let anyPaginatedResponse = value as! PaginatedResponse<U>
//            let response = PaginatedResponse(
//                paginationMetaData: anyPaginatedResponse.paginationMetaData,
//                currentEntities: anyPaginatedResponse.currentEntities)
//            return .success(response)
//            
//        case .failure(let error):
//            return .failure(error)
//        }
//    }
}
