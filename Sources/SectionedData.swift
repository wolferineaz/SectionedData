//
//  SectionedData.swift
//  Domopult
//
//  Created by Tabriz Dzhavadov on 31/03/2019.
//  Copyright © 2019 Tabriz Dzhavadov. All rights reserved.
//

import DifferenceKit

protocol ExtDifferentiable: Differentiable {
    func raw() -> Int
}

extension ExtDifferentiable {

    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.raw() == rhs.raw()
    }

    public static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.raw() < rhs.raw()
    }

}

class SectionedData<SectionEnum: ExtDifferentiable> {

    private(set) var items = [ArraySection<SectionEnum, BaseTableCellData>]() {
        didSet {
            self.items.sort { (lhs, rhs) -> Bool in
                return lhs.model < rhs.model
            }
        }
    }

    // MARK: - Data Source

    func numberOfSections() -> Int {
        return self.items.count
    }

    func numberOfItemsIn(_ section: Int) -> Int {
        return self.items[section].elements.count
    }

    func itemAt(_ indexPath: IndexPath) -> BaseTableCellData {
        return self.items[indexPath.section].elements[indexPath.row]
    }

    func typeAt(_ indexPath: IndexPath) -> SectionEnum {
        return self.items[indexPath.section].model
    }

    // MARK: - Modifying

    func clear() {
        self.items.removeAll()
    }

    func removeAllBy(_ section: SectionEnum) {
        self.items.removeAll { $0.model == section }
    }

    func hasItemsIn(_ section: SectionEnum) -> Bool {
        return self.items.filter { $0.model == section }.count > 0
    }

    func append(_ item: ArraySection<SectionEnum, BaseTableCellData>) {
        self.items.append(item)
        print("items = \(self.items)")
    }

    func reload(_ data: [ArraySection<SectionEnum, BaseTableCellData>]) {
        self.items = data
    }

}

class BaseTableCellData: Differentiable {

    var identifier: Int

    init(_ identifier: Int) {
        self.identifier = identifier
    }

    var differenceIdentifier: Int {
        return self.identifier
    }

    func isContentEqual(to source: BaseTableCellData) -> Bool {
        return self == source
    }

    static func == (lhs: BaseTableCellData, rhs: BaseTableCellData) -> Bool {
        return lhs.identifier == rhs.identifier
    }

}
