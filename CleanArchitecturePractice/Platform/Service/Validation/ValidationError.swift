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
