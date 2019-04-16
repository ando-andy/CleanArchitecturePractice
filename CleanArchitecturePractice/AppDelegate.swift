import UIKit
import MagicalRecord

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var assembler: Assembler = DefaultAssembler()
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        bindViewModel()
    }
    
    private func bindViewModel() {
        guard let window = window else { return }
        let vm: AppViewModel = assembler.resolve(window: window)
        let input = AppViewModel.Input(loadTrigger: Driver.just(()))
        let output = vm.transform(input)
        output.toMain
            .drive()
            .disposed(by: rx.disposeBag)
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        MagicalRecord.cleanUp()
    }
}

