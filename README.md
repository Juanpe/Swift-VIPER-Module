![](http://juanpecatalan.com/SwiftViperModule/logo.png)

# Swift-VIPER-Module
Xcode templates for VIPER Architecture in Swift

![Preview](demoviper.gif)

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
## Contributed
This is an open source project, so feel free to contribute. How?
- Open an [issue](https://github.com/Juanpe/Swift-VIPER-Module/issues/new).
- Send feedback via [email](mailto://juanpecatalan.com).
- Propose your own fixes, suggestions and open a pull request with the changes.
