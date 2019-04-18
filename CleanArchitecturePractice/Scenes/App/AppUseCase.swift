protocol AppUseCaseType {
    func checkIfFirstRun() -> Bool
    func setDidInit()
}

struct AppUseCase: AppUseCaseType {
    
    func checkIfFirstRun() -> Bool {
        return !AppSettings.didInit
    }
    
    func setDidInit() {
        AppSettings.didInit = true
    }
}
