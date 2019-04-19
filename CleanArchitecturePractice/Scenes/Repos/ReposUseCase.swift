protocol ReposUseCaseType {
    func getRepoList() -> Observable<PagingInfo<Repo>>
    func loadMoreRepoList(page: Int) -> Observable<PagingInfo<Repo>>
}

struct ReposUseCase: ReposUseCaseType {
    let repository: RepoRepositoryType
    
    func getRepoList() -> Observable<PagingInfo<Repo>> {
        return loadMoreRepoList(page: 1)
    }
    
    func loadMoreRepoList(page: Int) -> Observable<PagingInfo<Repo>> {
        return repository.getRepoList(page: page, perPage: 10, useCache: page == 1)
    }
}

