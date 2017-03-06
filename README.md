![](assets/header.jpg)

When you decide to use VIPER architecture in your project, it is very tired create new modules, because you need create at least 5 files for each. Imagine that you need to create 6 modules...I was suffering this problem, and this is the raison why I've created this template. It's very useful for me and I hope that for you too.

## How to install

### Using script (easy)
Only need execute this command in terminal:
```swift
sudo swift install.swift
```
You should be this output message:

![](assets/terminal.png)

If all it's ok you now could find your template in Xcode.

### Manual
Go to Application folder, browse to the Xcode application icon. Right-click it and choose 'Show Package Contents'. Then browse to:
`Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/Project Templates/iOS/Application` and add "Module VIPER.xctemplate" file. Now you can find your template in Xcode.

## Easy to use
![Preview](/assets/demoviper.gif)

## Generated code
This template generates all files that you need to create a new VIPER module. All generated code is Swift 3.

This is an example, we're creating a Login module:

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

	var presenter: LoginPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
    }
}
```
## VIPER diagram overview
![Preview](/assets/viper_diagram.png)

## Why VIPER?
After using VIPER, I've found it to be very beneficial in many ways. Let’s get back to the list of things we set out to accomplish when architecting our app to see if VIPER addresses them.

- Easy to iterate on
- Collaboration friendly
- Separated out concerns
- Spec-ability

## Next steps
* [x] Create bash script to install more easy
* [ ] ~~Create groups in template~~ *(Only available for Project templates)*

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

* Juanpe Catalán [🐦](https://www.twitter.com/juanpecmios)
