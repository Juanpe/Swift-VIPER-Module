![](http://juanpecatalan.com/SwiftViperModule/logo.png)

# Swift-VIPER-Module
Xcode templates for VIPER Architecture in Swift

![Preview](http://juanpecatalan.com/SwiftViperModule/demoViper2.gif)

## Generated code

Template generated all files that you need to create a new module follow VIPER architecture. All generated code is Swift 3.

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
