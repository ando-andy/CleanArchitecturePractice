//
// MainViewModel.swift
// CleanArchitecture
//
// Created by Tuan Truong on 6/4/18.
// Copyright © 2018 Framgia. All rights reserved.
//

struct MainViewModel {
    let navigator: MainNavigatorType
    let useCase: MainUseCaseType
}

// MARK: - ViewModelType
extension MainViewModel: ViewModelType {
    struct Input {
        let loadTrigger: Driver<Void>
        let selectMenuTrigger: Driver<IndexPath>
    }
    
    struct Output {
        let menuSections: Driver<[MenuSection]>
        let selectedMenu: Driver<Void>
    }

    func transform(_ input: Input) -> Output {
        let menuSections = input.loadTrigger
            .map {
                self.menuSections()
            }
        
        let selectedMenu = input.selectMenuTrigger
            .withLatestFrom(menuSections) { indexPath, menuSections in
                menuSections[indexPath.section].menus[indexPath.row]
            }
            .do(onNext: { menu in
                switch menu {
                case .login:
                    self.navigator.toLogin()
                default:
                    return
                }
            })
            .mapToVoid()
        
        return Output(
            menuSections: menuSections,
            selectedMenu: selectedMenu
        )
    }
    
    func menuSections() -> [MenuSection] {
        return [
            MenuSection(title: "", menus: [ .login ])
        ]
    }
}

extension MainViewModel {
    enum Menu: Int, CustomStringConvertible, CaseIterable {
        case login = 1
        
        var description: String {
            switch self {
            case .login:
                return "Login"
            }
        }
    }
    
    struct MenuSection {
        let title: String
        let menus: [Menu]
    }
}
