//
//  EarthQuakeServices.swift
//  Networking
//
//  Created by Emre Çiftçi on 15.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import Foundation

public enum EarthQuakeService: ServiceProtocol {
    
    case getList
    case getTopHeadlines(source: String)
    
    public var baseURL: URL {
      // TODO: Add baseURL to Constants!!!
        return URL(string: "https://nsdeprem.herokuapp.com")!
    }
    
    public var apiKey: String {
        return "17dee2eb8eee461584226aceece35139"
    }
    
    public var path: String {
        switch self {
            
        case .getList:
            return "/api/feed"
            
        case .getTopHeadlines(_):
            return "/top-headlines"
            
        }
    }
    
    public var method: HTTPMethod {
        return .get
    }
    
    public var task: Task {
        
        switch self {
            
        case .getList:
            return .requestPlain
            
        case .getTopHeadlines(let sources):
            let parameters = ["sources": "\(sources)",
                              "apiKey": apiKey]
            return .requestParameters(parameters)
        }
    }
    
    public var headers: Headers? {
        return nil
    }
    
    public var parametersEncoding: ParametersEncoding {
        return .url
    }
}
