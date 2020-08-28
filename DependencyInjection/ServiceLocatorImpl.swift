//
//  ServiceLocatorImpl.swift
//
//  Created by Jesus Martin Alonso on 13/11/2019.
//

import Foundation

/// ServiceLocator default implementation. We use lazy vars to avoid loading all dependencies when ServiceLocator instance is created
class ServiceLocatorImpl: ServiceLocator {
    
    private lazy var remoteDataSource = {
       MyRemoteDataSource()
    }()
    
    lazy var myRepository: MyRepository = {
       MyRepositoryImpl(remoteDataSource: remoteDataSource)
    }()
}
