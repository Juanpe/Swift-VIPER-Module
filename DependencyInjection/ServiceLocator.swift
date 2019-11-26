//
//  ServiceLocator.swift
//  
//  Created by Jesus Martin Alonso on 13/11/2019.
//

import Foundation

//Protocol to implement by ServiceLocator objects that provides all the dependencies for the app
protocol ServiceLocator {
    //Repositories
    var myRepository: MyRepository {get}
}
