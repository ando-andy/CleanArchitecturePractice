struct ReposViewModel {
    let navigator: ReposNavigatorType
    let useCase: ReposUseCaseType
}

// MARK: - ViewModelType
extension ReposViewModel: ViewModelType {
    struct Input {
        let loadTrigger: Driver<Void>
        let reloadTrigger: Driver<Void>
        let loadMoreTrigger: Driver<Void>
        let selectRepoTrigger: Driver<IndexPath>
    }
    
    struct Output {
        let error: Driver<Error>
        let loading: Driver<Bool>
        let refreshing: Driver<Bool>
        let loadingMore: Driver<Bool>
        let fetchItems: Driver<Void>
        let repoList: Driver<[Repo]>
        let selectedRepo: Driver<Void>
        let isEmptyData: Driver<Bool>
    }
    
    func transform(_ input: Input) -> Output {
        let loadMoreOutput = setupLoadMorePaging(
            loadTrigger: input.loadTrigger,
            getItems: useCase.getRepoList,
            refreshTrigger: input.reloadTrigger,
            refreshItems: useCase.getRepoList,
            loadMoreTrigger: input.loadMoreTrigger,
            loadMoreItems: useCase.loadMoreRepoList)
        
        let (page, fetchItems, loadError, loading, refreshing, loadingMore) = loadMoreOutput
        
        let repoList = page
            .map { $0.items.map { $0 } }
            .asDriverOnErrorJustComplete()
        
        let selectedRepo = input.selectRepoTrigger
            .withLatestFrom(repoList) {
                return ($0, $1)
            }
            .map { indexPath, repoList in
                return repoList[indexPath.row]
            }
            .do(onNext: { repo in
                self.navigator.toRepoDetail(repo: repo)
            })
            .mapToVoid()
        
        let isEmptyData = checkIfDataIsEmpty(fetchItemsTrigger: fetchItems,
                                             loadTrigger: Driver.merge(loading, refreshing),
                                             items: repoList)
        
        return Output(
            error: loadError,
            loading: loading,
            refreshing: refreshing,
            loadingMore: loadingMore,
            fetchItems: fetchItems,
            repoList: repoList,
            selectedRepo: selectedRepo,
            isEmptyData: isEmptyData
        )
    }
}
