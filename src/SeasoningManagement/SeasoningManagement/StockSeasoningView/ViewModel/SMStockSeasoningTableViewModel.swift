//
//  SMStockSeasoningTableViewModel.swift
//  SeasoningManagement
//
//  Created by DIO on 2020/05/20.
//  Copyright © 2020 DIO0550. All rights reserved.
//

import UIKit
import RxDataSources
import RxSwift
import RxCocoa

class SMStockSeasoningTableViewModel {
    typealias Section = SMStockSeasoningTableViewCellSectionOfModel
    typealias Model = SMStockSeasoningTableViewCellModel
    
    private let items = BehaviorRelay<[Section]>(value: [SMStockSeasoningTableViewCellSectionOfModel(
        header: "A",
        items: [SMStockSeasoningTableViewCellModel(seasoningName: "調味料", stockCount: 2)])])
    
    func sectionsObservable() -> Observable<[Section]> {
        return self.items.asObservable()
    }
}
