//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class ___VARIABLE_productName:identifier___ViewController: UIViewController, ___VARIABLE_productName:identifier___ViewType
{
    // MARK: - Presenter
    
	let presenter: ___VARIABLE_productName:identifier___PresenterType
    
    // MARK: - Initializer
    
    required init(
        presenter: ___VARIABLE_productName:identifier___PresenterType)
    {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View's Life Cycle

	override func viewDidLoad()
    {
        super.viewDidLoad()
    }
}
