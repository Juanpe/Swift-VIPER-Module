## Login Module with divided Interactor (Input & Output)

**Protocols**
```swift
//MARK: Wireframe -
protocol LoginWireframeProtocol: class {

}
//MARK: Presenter -
protocol LoginPresenterProtocol: class {

    var interactor: LoginInteractorInputProtocol? { get set }
}

//MARK: Interactor -
protocol LoginInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
}

protocol LoginInteractorInputProtocol: class {

    var presenter: LoginInteractorOutputProtocol?  { get set }

    /* Presenter -> Interactor */
}

//MARK: View -
protocol LoginViewProtocol: class {

    var presenter: LoginPresenterProtocol?  { get set }

    /* Presenter -> ViewController */
}
```

**Interactor**
```swift
class LoginInteractor: LoginInteractorInputProtocol {

    weak var presenter: LoginInteractorOutputProtocol?
}
```

**Presenter**
```swift
class LoginPresenter: LoginPresenterProtocol, LoginInteractorOutputProtocol {

    weak private var view: LoginViewProtocol?
    var interactor: LoginInteractorInputProtocol?
    private let router: LoginWireframeProtocol

    init(interface: LoginViewProtocol, interactor: LoginInteractorInputProtocol?, router: LoginWireframeProtocol) {
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
