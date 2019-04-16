# What is CleanArchitecture + RxSwift + MVVM ?

# CleanArchitecure

# Reference

- Example of Clean Architecture of iOS app using RxSwift
https://github.com/sergdort/CleanArchitectureRxSwift

- Folked from this project
https://github.com/tuan188/MGCleanArchitecture

- Easy to generate the structure of Dependency Injection
https://github.com/tuan188/MGiGen

- What is Dependency Injection?
https://medium.com/makingtuenti/dependency-injection-in-swift-part-1-236fddad144a

Dependency Injectionでは、モジュールから部品を取り出すことで、追加機能や保守、テストなどの時に、余分な工数がかからなくて済む。
```
//Login
Assembler
  Navigator
  UseCase
  LoginView
  LoginViewModel
```
アゼンブラーに各機能がバインドされており、それぞれの機能はそれぞれに任される。


- concept compression about CA in Japanese
https://github.com/peaks-cc/iOS_architecture_samplecode

- concept compression about CA in Japanese
https://github.com/koutalou/iOS-CleanArchitecture

