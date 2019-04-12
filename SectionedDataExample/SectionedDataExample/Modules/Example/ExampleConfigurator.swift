//
//  ExampleConfigurator.swift
//  SectionedDataExample
//  Module: Example
//
//  Created by Tabriz Dzhavadov on 12/04/2019.
//  Copyright © 2019 Tabriz Dzhavadov. All rights reserved.
//

import UIKit

protocol ExampleConfigurator {
    func configure(_ controller: ExampleViewController)
}

class ExampleConfiguratorImpl: ExampleConfigurator {

    func configure(_ controller: ExampleViewController) {
        let router = ExampleRouterImpl(view: controller)
        controller.presenter = ExamplePresenterImpl(view: controller, router: router)
    }

}
