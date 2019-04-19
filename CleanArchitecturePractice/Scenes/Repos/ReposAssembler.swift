import Foundation

protocol ReposAssembler {
    func resolve(navigationController: UINavigationController) -> ReposViewController
    //func resolve(navigationController: UINavigationController) -> RepoCollectionViewController
    func resolve(navigationController: UINavigationController) -> ReposViewModel
    func resolve(navigationController: UINavigationController) -> ReposNavigatorType
    func resolve() -> ReposUseCaseType
}

extension ReposAssembler {
    func resolve(navigationController: UINavigationController) -> ReposViewController {
        let vc = ReposViewController.instantiate()
        let vm: ReposViewModel = resolve(navigationController: navigationController)
        vc.bindViewModel(to: vm)
        return vc
    }
//    func resolve(navigationController: UINavigationController) -> RepoCollectionViewController {
//        let vc = RepoCollectionViewController.instantiate()
//        let vm: ReposViewModel = resolve(navigationController: navigationController)
//        vc.bindViewModel(to: vm)
//        return vc
//    }
    
    func resolve(navigationController: UINavigationController) -> ReposViewModel {
        return ReposViewModel(navigator: resolve(navigationController: navigationController),
                              useCase: resolve())
    }
}

extension ReposAssembler where Self: DefaultAssembler {
    func resolve() -> ReposUseCaseType {
        return ReposUseCase(repository: resolve())
    }
    
    func resolve(navigationController: UINavigationController) -> ReposNavigatorType {
        return ReposNavigator(assembler: self, navigationController: navigationController)
    }
}
