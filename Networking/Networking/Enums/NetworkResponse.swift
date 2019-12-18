//
//  NetworkResponse.swift
//  Newsapi
//
//  Created by Emre Çiftçi on 15.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import Foundation

public enum NetworkResponse<T> {
    case success(T)
    case failure(NetworkError)
}
