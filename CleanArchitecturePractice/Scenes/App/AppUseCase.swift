//
// AppUseCase.swift
// CleanArchitecture
//
// Created by Tuan Truong on 6/4/18.
// Copyright © 2018 Framgia. All rights reserved.
//

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
