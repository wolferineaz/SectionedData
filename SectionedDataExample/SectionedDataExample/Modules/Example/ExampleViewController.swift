//
//  ExampleViewController.swift
//  SectionedDataExample
//  Module: Example
//
//  Created by Tabriz Dzhavadov on 12/04/2019.
//  Copyright © 2019 Tabriz Dzhavadov. All rights reserved.
//

import UIKit

protocol ExampleView: class {

}

class ExampleViewController: UIViewController {

    var configurator: ExampleConfigurator!
    var presenter: ExamplePresenter!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configurator.configure(self)
        self.presenter.viewDidLoad()

        self.title = "Example"
    }

}

extension ExampleViewController: ExampleView {

}
