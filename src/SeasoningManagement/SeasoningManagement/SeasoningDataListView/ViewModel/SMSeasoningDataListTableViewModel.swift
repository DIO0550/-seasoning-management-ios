//
//  SMSeasoningDataListTableViewModel.swift
//  SeasoningManagement
//
//  Created by DIO on 2020/05/27.
//  Copyright © 2020 DIO0550. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class SMSeasoningDataListTableViewModel {
    typealias Section = SMSeasoningDataListTableViewCellSectionOfModel
    typealias Model = SMSeasoningDataListTableViewCellModel
    
    init() {
        self.updateItems()
    }
    
    private let items = BehaviorRelay<[Section]>(value: [])
    
    func sectionsObservable() -> Observable<[Section]> {
        return self.items.asObservable()
    }
    
    func updateItems() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let allSeasoningData = appDelegate.fetchAllSeasonignData()
        for seasoningData in allSeasoningData {
            var value = self.items.value
            let sameType = value.filter({ $0.header == seasoningData.type })
            if sameType.first != nil {
                var section = sameType.first!
                section.items.append(SMSeasoningDataListTableViewCellModel.init(seasoningData: seasoningData))
            }
            else {
                let sectionOfCell = Section.init(header: seasoningData.type!, items: [Model.init(seasoningData: seasoningData)])
                value.append(sectionOfCell)
            }
            self.items.accept(value)
        }
    }
    
    func remove(indexPath: IndexPath) {
        var sections = self.items.value[indexPath.section]
        let item = sections.items[indexPath.row]
        sections.items.remove(at: indexPath.row)
        if sections.items.count == 0 {
            
        }
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.deleteSeasoningData(seasoningData: item.seasoningData)
        self.items.accept(self.items.value)
    }
}
