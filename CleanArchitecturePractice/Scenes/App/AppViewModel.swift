struct AppViewModel: ViewModelType {
    
    struct Input {
        let loadTrigger: Driver<Void>
    }
    
    struct Output {
        let toMain: Driver<Void>
    }
    
    let navigator: AppNavigatorType
    let useCase: AppUseCaseType
    
    func transform(_ input: Input) -> Output {
        let toMain = input.loadTrigger
            .do(onNext: self.navigator.toMain)
        return Output(toMain: toMain)
    }
}
