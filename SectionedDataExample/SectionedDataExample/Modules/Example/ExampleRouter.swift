//
//  ExampleRouter.swift
//  SectionedDataExample
//  Module: Example
//
//  Created by Tabriz Dzhavadov on 12/04/2019.
//  Copyright © 2019 Tabriz Dzhavadov. All rights reserved.
//

import UIKit

protocol ExampleRouter {

}

class ExampleRouterImpl: ExampleRouter {
    fileprivate weak var view: ExampleViewController?

    init(view: ExampleViewController) {
        self.view = view
    }

}
