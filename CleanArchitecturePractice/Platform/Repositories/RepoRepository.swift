import UIKit

protocol RepoRepositoryType {
    func getRepoList(page: Int, perPage: Int, useCache: Bool) -> Observable<PagingInfo<Repo>>
}

final class RepoRepository: RepoRepositoryType {
    func getRepoList(page: Int, perPage: Int, useCache: Bool) -> Observable<PagingInfo<Repo>> {
        let input = API.GetRepoListInput(page: page, perPage: perPage)
        input.useCache = useCache
        return API.shared.getRepoList(input)
            .map { output in
                guard let repos = output.repos else {
                    throw APIInvalidResponseError()
                }
                return PagingInfo<Repo>(page: page, items: repos)
        }
    }
}
