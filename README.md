
#  The goal of this practice
### Comprehension and implementation of
   
　  1. Clean Architecture
    
 - 1-1 Dependency Injection  
 - 1-2 Dependency inversion principle
 - 1-3 SOLID principle
 
　  2. Reactive Programming
    
 - 2-1.Rxswift
 - 2-2.MVVM

  
# What is CleanArchitecture + RxSwift + MVVM ?

へんしゅうちゅう〜

## CleanArchitecure

### DI(Dependency Injection) 
DIでは、モジュールから部品を取り出すことで、追加機能や保守、テストなどの時に、余分な工数がかからなくて済む。<sup><a href="#3">3</a></sup>
```
//Login
Assembler
  Navigator
  UseCase
  LoginView
  LoginViewModel
```
アゼンブラーに各機能がバインドされており、それぞれの機能はそれぞれに任される。


# Footnote
<span id="3" style="font-size:x-small">3: "What is Dependency Injection?"</span>


# Reference

## Web 
### Article

### Japanese
[Begineer for Rx](https://qiita.com/nomok_/items/39b5d7c61810f274768d)

[Observer pattern](https://ja.wikipedia.org/wiki/Observer_%E3%83%91%E3%82%BF%E3%83%BC%E3%83%B3)

### English
[What is Dependency Injection?](https://medium.com/makingtuenti/dependency-injection-in-swift-part-1-236fddad144a)

[SOLID Principles every Developer Should Know](https://blog.bitsrc.io/solid-principles-every-developer-should-know-b3bfa96bb688)

### Code
[Folked from this project](https://github.com/tuan188/MGCleanArchitecture)

[Example of Clean Architecture of iOS app using RxSwift](https://github.com/sergdort/CleanArchitectureRxSwift)

[Easy to generate the structure of Dependency Injection](https://github.com/tuan188/MGiGen)

[Example1 code of CA (from peaks)](https://github.com/peaks-cc/iOS_architecture_samplecode)

[Example2 code of CA (from quita)](https://github.com/koutalou/iOS-CleanArchitecture)

## Book

### Japanese
「Clean Architecture(達人に学ぶソフトウェアの構造と設計)」

「iOSアプリ設計パターン入門」

「RxSwift 研究読本1 入門編」

「RxSwift 研究読本2 エラーハンドリング編」

「RxSwift 研究読本3 ViewModel 設計パターン編」　

### English
"The Swift Programming Language"

"Swift3 Functional Programing"

"RxSwift Reactive Programming with Swift"

"Test-Driven iOS Development with Swift 3"
