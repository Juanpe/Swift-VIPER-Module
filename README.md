![](assets/header.jpg)

# Swift-VIPER-Module

![Preview](/assets/viper_diagram.png)

![Preview](/assets/demoviper.gif)

## Generated code

This template generates all files that you need to create a new VIPER module. All generated code is Swift 3.

**Protocols**
```swift
//MARK: Wireframe -
protocol LoginWireframeProtocol: class {

}
//MARK: Presenter -
protocol LoginPresenterProtocol: class {

}

//MARK: Interactor -
protocol LoginInteractorProtocol: class {

  var presenter: LoginPresenterProtocol!  { get set }
}

//MARK: View -
protocol LoginViewProtocol: class {

  var presenter: LoginPresenterProtocol!  { get set }
}
```

**Interactor**
```swift
class LoginInteractor: LoginInteractorProtocol {

    weak var presenter: LoginPresenterProtocol!
}
```

**Presenter**
```swift
class LoginPresenter: LoginPresenterProtocol {

    weak private var view: LoginViewProtocol?
    private let interactor: LoginInteractorProtocol
    private let router: LoginWireframeProtocol

    init(interface: LoginViewProtocol, interactor: LoginInteractorProtocol, router: LoginWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router

        self.interactor.presenter = self
    }
}
```

**Wireframe**
```swift
class LoginRouter: LoginWireframeProtocol {

}
```

**View**
```swift
class LoginViewController: UIViewController, LoginViewProtocol {

	var presenter: LoginPresenterProtocol!

	override func viewDidLoad() {
        super.viewDidLoad()
    }
}
```

## Why VIPER?
After using VIPER, I've found it to be very beneficial in many ways. Let’s get back to the list of things we set out to accomplish when architecting our app to see if VIPER addresses them.

- Easy to iterate on
- Collaboration friendly
- Separated out concerns
- Spec-ability

## References
- [iOS Architecture Patterns](https://medium.com/ios-os-x-development/ios-architecture-patterns-ecba4c38de52#.ba7q8dcih)
- [#8 VIPER to be or not to be?](https://swifting.io/blog/2016/03/07/8-viper-to-be-or-not-to-be/)
- [https://www.objc.io/issues/13-architecture/viper/](https://www.objc.io/issues/13-architecture/viper/)
- [https://www.ckl.io/blog/ios-project-architecture-using-viper/](https://www.ckl.io/blog/ios-project-architecture-using-viper/)

## Contributed
This is an open source project, so feel free to contribute. How?
- Open an [issue](https://github.com/Juanpe/Swift-VIPER-Module/issues/new).
- Send feedback via [email](mailto://juanpecatalan.com).
- Propose your own fixes, suggestions and open a pull request with the changes.

## Author

* Juanpe Catalán [twitter](https://www.twitter.com/juanpecmios)
