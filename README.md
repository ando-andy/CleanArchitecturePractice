
#  The goal of this practice
### Comprehension and implementation of

　   1. Reactive Programming
    
 - 1-1.Rxswift
 - 1-2.MVVM
   
　   2. Clean Architecture
    
 - 2-1 Dependency Injection  
 - 2-2 Dependency inversion principle


  
# What is CleanArchitecture + RxSwift + MVVM ?

へんしゅうちゅう〜

## CleanArchitecure

### DI(Dependency Injection) 
Dependency Injectionでは、モジュールから部品を取り出すことで、追加機能や保守、テストなどの時に、余分な工数がかからなくて済む。<sup><a href="#3">3</a></sup>
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

### Web
[Example of Clean Architecture of iOS app using RxSwift](https://github.com/sergdort/CleanArchitectureRxSwift)

[Folked from this project](https://github.com/tuan188/MGCleanArchitecture)

[Easy to generate the structure of Dependency Injection](https://github.com/tuan188/MGiGen)

[What is Dependency Injection?](https://medium.com/makingtuenti/dependency-injection-in-swift-part-1-236fddad144a)

[Example1 code of CA (from peaks)](https://github.com/peaks-cc/iOS_architecture_samplecode)

[Example2 code of CA (from quita)](https://github.com/koutalou/iOS-CleanArchitecture)

### Book
「RxSwift 研究読本1 入門編」
「RxSwift 研究読本2 エラーハンドリング編」
「RxSwift 研究読本3 ViewModel 設計パターン編」　

「iOSアプリ設計パターン入門」

「Clean Architecture(達人に学ぶソフトウェアの構造と設計)」

"Swift3 Functional Programing"

"RxSwift Reactive Programming with Swift"

"Test-Driven iOS Development with Swift 3"

