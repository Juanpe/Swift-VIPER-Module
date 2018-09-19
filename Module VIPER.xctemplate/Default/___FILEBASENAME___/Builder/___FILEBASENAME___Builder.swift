//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class ___VARIABLE_productName:identifier___Builder: ___VARIABLE_productName:identifier___BuilderType
{
    static func build() -> (UIViewController & ___VARIABLE_productName:identifier___ViewType)
    {
        let router = ___VARIABLE_productName:identifier___Router()
        
        let presenter = ___VARIABLE_productName:identifier___Presenter(
            router: router)
        
        let viewController = ___VARIABLE_productName:identifier___ViewController(presenter: presenter)
        
        return viewController
    }
}
