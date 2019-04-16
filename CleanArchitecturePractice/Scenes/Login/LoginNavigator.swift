import UIKit
protocol LoginNavigatorType {
    func toMain()
}

struct LoginNavigator: LoginNavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
    
    func toMain() {
        navigationController.showAutoCloseMessage(image: nil, title: nil, message: "Login success")
    }
}
