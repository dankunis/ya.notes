//
//  PresentationAssembly.swift
//  Ya.Notes
//
//  Created by Daniel Kunis on 08/08/2019.
//  Copyright © 2019 Daniel Kunis. All rights reserved.
//

import UIKit

protocol IPresentationAssembly {

    func demoViewController() -> DemoViewController
}

class PresentationAssembly: IPresentationAssembly {
    
    private let serviceAssembly: IServicesAssembly
    
    init(serviceAssembly: IServicesAssembly) {
        self.serviceAssembly = serviceAssembly
    }
    
    // MARK: - IPresentationAssembly
    
    func demoViewController() -> DemoViewController {
        return DemoViewController()
    }
}
