import UIKit

struct RepoViewModel {
    let repo: Repo
    
    var name: String {
        return repo.name
    }
    
    var url: URL? {
        return URL(string: repo.avatarURLString)
    }
}
