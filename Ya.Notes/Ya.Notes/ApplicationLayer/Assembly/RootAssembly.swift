//
//  RootAssembly.swift
//  Ya.Notes
//
//  Created by Daniel Kunis on 08/08/2019.
//  Copyright © 2019 Daniel Kunis. All rights reserved.
//

import Foundation

class RootAssembly {
    lazy var presentationAssembly: IPresentationAssembly = PresentationAssembly(serviceAssembly: self.serviceAssembly)
    private lazy var serviceAssembly: IServicesAssembly = ServicesAssembly(coreAssembly: self.coreAssembly)
    private lazy var coreAssembly: ICoreAssembly = CoreAssembly()
}
