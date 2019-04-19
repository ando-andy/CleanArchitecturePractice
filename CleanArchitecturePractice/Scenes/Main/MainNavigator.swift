import UIKit
protocol MainNavigatorType {
    func toLogin()
    func toRepos()
}

struct MainNavigator: MainNavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
    
    func toLogin() {
        let vc: LoginViewController = assembler.resolve(navigationController: navigationController)
        navigationController.pushViewController(vc, animated: true)
    }

    func toRepos() {
        let vc: ReposViewController = assembler.resolve(navigationController: navigationController)
        navigationController.pushViewController(vc, animated: true)
    }

}

