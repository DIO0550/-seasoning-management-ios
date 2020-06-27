//
//  SMSelectAddStockSeasoningTableViewModel.swift
//  SeasoningManagement
//
//  Created by DIO on 2020/06/27.
//  Copyright © 2020 DIO0550. All rights reserved.
//

import UIKit
import RxDataSources
import RxSwift
import RxCocoa

class SMSelectAddStockSeasoningTableViewModel {
    typealias Section = SMSelectAddStockSeasoningTableViewCellSectionOfModel
    typealias Model = SMSelectAddStockSeasoningTableViewCellModel
    
    private var items = BehaviorRelay<[Section]>(value: [])
    
    func sectionsObservable() -> Observable<[Section]> {
        return self.items.asObservable()
    }
    
    func updateItems() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let allSeasoningData = appDelegate.fetchAllSeasonignData()
        var value = self.items.value
        for seasoningData in allSeasoningData {
            let sameType = value.filter({ $0.header == seasoningData.type })
            if sameType.first != nil {
                var section = sameType.first!
                section.items.append(SMSeasoningDataListTableViewCellModel.init(seasoningData: seasoningData))
            }
            else {
                let sectionOfCell = Section.init(header: seasoningData.type!, items: [Model.init(seasoningData: seasoningData)])
                value.append(sectionOfCell)
            }
        }
        self.items.accept(value)
    }
}
