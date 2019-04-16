//
//  ValidationError.swift
//  CleanArchitecture
//
//  Created by Tuan Truong on 6/28/18.
//  Copyright © 2018 Framgia. All rights reserved.
//

import UIKit

enum ValidationError: Error {
    case usernameMinLength
    case passwordMinLength
}

extension ValidationError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .usernameMinLength:
            return "Please enter your username."
        case .passwordMinLength:
            return "Please enter your password"
        }
    }
}
