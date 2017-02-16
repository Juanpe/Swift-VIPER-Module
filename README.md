![](http://juanpecatalan.com/SwiftViperModule/logo.png)

# Swift-VIPER-Module
Xcode templates for VIPER Architecture in Swift

![Preview](http://juanpecatalan.com/SwiftViperModule/demoViper2.gif)

## Generated code

**Protocols**
```
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
```
class LoginInteractor: LoginInteractorProtocol {

    weak var presenter: LoginPresenterProtocol!
}
```

**Presenter**
```
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
```
class LoginRouter: LoginWireframeProtocol {

}
```

**View**
```
class LoginViewController: UIViewController, LoginViewProtocol {

	var presenter: LoginPresenterProtocol!

	override func viewDidLoad() {
        super.viewDidLoad()
    }
}
```
