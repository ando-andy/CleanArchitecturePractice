import UIKit

protocol RepositoriesAssembler {
    func resolve() -> RepoRepositoryType
    // func resolve() -> ProductRepositoryType
    //func resolve() -> UserRepositoryType
}

extension RepositoriesAssembler where Self: DefaultAssembler {
    func resolve() -> RepoRepositoryType {
        return RepoRepository()
    }
    
//    func resolve() -> ProductRepositoryType {
//        return ProductRepository()
//    }
    
//    func resolve() -> UserRepositoryType {
//        return UserRepository()
//    }
    
}
