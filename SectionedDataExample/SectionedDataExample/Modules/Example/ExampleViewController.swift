//
//  ExampleViewController.swift
//  SectionedDataExample
//  Module: Example
//
//  Created by Tabriz Dzhavadov on 12/04/2019.
//  Copyright © 2019 Tabriz Dzhavadov. All rights reserved.
//

import UIKit
import SectionedData
import DifferenceKit

private typealias Section = ArraySection<ExampleSection, BaseTableCellData>

enum ExampleSection: Int, ExtDifferentiable {
    case dateTime
    case time

    func raw() -> Int {
        return self.rawValue
    }
}

protocol ExampleView: class {

}

class ExampleViewController: UIViewController {

    var configurator: ExampleConfigurator!
    var presenter: ExamplePresenter!

    private var data = SectionedData<ExampleSection>()
    private var dataInput = SectionedData<ExampleSection>()

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configurator.configure(self)
        self.presenter.viewDidLoad()

        self.title = "Example"
        self.tableView.tableFooterView = UIView()
        self.tableView.dataSource = self
        self.tableView.register(ExampleInfoTableCell.nib,
                                forCellReuseIdentifier: ExampleInfoTableCell.identifier)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "add", style: .plain, target: self, action: #selector(add))
    }

    @objc func add() {

        let df = DateFormatter()
        if Bool.random() {
            df.dateFormat = "dd.MM.yyyy HH:mm:ss"
            let data = ExampleInfoTableCellData("\(df.string(from: Date()))")
            self.dataInput.append(Section(model: .dateTime, elements: [data]))
        } else {
            df.dateFormat = "HH:mm:ss"
            let data = ExampleInfoTableCellData("\(df.string(from: Date()))")
            self.dataInput.append(Section(model: .time, elements: [data]))
        }
        self.reloadAnimated()
    }

    func reloadAnimated() {
        let changeset = StagedChangeset(source: self.data.items, target: self.dataInput.items)
        self.tableView.reload(using: changeset, with: .automatic, setData: { (data) in
            self.data.reload(data)
        })
    }

}

extension ExampleViewController: ExampleView {

}

extension ExampleViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return self.data.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.numberOfItemsIn(section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let data = self.data.itemAt(indexPath)

        switch self.data.typeAt(indexPath) {
        case .dateTime:
            let identifier = ExampleInfoTableCell.identifier
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? ExampleInfoTableCell
            cell?.bind(data as? ExampleInfoTableCellData)
            return cell!
        case .time:
            let identifier = ExampleInfoTableCell.identifier
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? ExampleInfoTableCell
            cell?.bind(data as? ExampleInfoTableCellData)
            return cell!
        }

    }

}

extension UIView {

    class var identifier: String {
        return String.init(describing: self)
    }

    class var nib: UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }

}
