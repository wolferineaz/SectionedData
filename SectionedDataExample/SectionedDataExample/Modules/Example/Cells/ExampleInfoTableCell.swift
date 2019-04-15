//
//  ExampleInfoTableCell.swift
//  SectionedDataExample
//
//  Created by Tabriz Dzhavadov on 12/04/2019.
//  Copyright © 2019 Tabriz Dzhavadov. All rights reserved.
//

import UIKit
import SectionedData

class ExampleInfoTableCellData: BaseTableCellData {

    static let kIdentifier = "ExampleInfoTableCellData".hashValue

    var name: String?

    init(_ name: String) {
        super.init(ExampleInfoTableCellData.kIdentifier)
        self.name = name
    }

    func isContentEqual(to source: ExampleInfoTableCellData) -> Bool {
        return self == source
    }

    public static func == (lhs: ExampleInfoTableCellData, rhs: ExampleInfoTableCellData) -> Bool {
        return lhs.name == rhs.name
    }

}

class ExampleInfoTableCell: UITableViewCell {

    private var data: ExampleInfoTableCellData?

    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }


    func bind(_ data: ExampleInfoTableCellData?) {
        self.data = data

        self.label.text = self.data?.name
    }

}
