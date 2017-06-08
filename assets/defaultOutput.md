## Default Login Module

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

    var presenter: LoginPresenterProtocol?  { get set }
}

//MARK: View -
protocol LoginViewProtocol: class {

    var presenter: LoginPresenterProtocol?  { get set }
}
```

**Interactor**
```swift
class LoginInteractor: LoginInteractorProtocol {

    weak var presenter: LoginPresenterProtocol?
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
    }
}
```

**Wireframe**
```swift
class LoginRouter: LoginWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {

        let view = LoginViewController(nibName: nil, bundle: nil)
        let interactor = LoginInteractor()
        let router = LoginRouter()
        let presenter = LoginPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}
```

**View**
```swift
class LoginViewController: UIViewController, LoginViewProtocol {

    var presenter: LoginPresenterProtocol?

    override func viewDidLoad() {
    super.viewDidLoad()
    }
}
```
