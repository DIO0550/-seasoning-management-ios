//
//  SMSeasoningListViewModel.swift
//  SeasoningManager
//
//  Created by DIO on 2020/11/22.
//

import UIKit
import RxDataSources
import RxSwift
import RxCocoa

class SMSeasoningListViewModel {
    typealias Section = SMSeasoningListTableViewCellSectionOfModel
    typealias Model = SMSeasoningListTableViewCellModel
    
    private var items = BehaviorRelay<[Section]>(value: [])
    
    func sectionsObservable() -> Observable<[Section]> {
        return self.items.asObservable()
    }
    
    func updateItems() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let allSeasoning = appDelegate.fetchAllSeasoning()
        var value: [Section] = []
        for seasoning in allSeasoning {
            let index = self.sameTypeFirstIndex(sections: value, seasoningType: seasoning.type)
            if index != nil {
                self.incrementSameStockSeasoningCount(items: &value[index!].items, seasoningData: seasoning.seasoningData!)
            }
            else {
                let sectionOfCell = Section.init(header: seasoning.seasoningData!.type!,
                                                 items: [Model.init(seasoningData: seasoning!)])
                value.append(sectionOfCell)
            }
        }
        self.items.accept(value)
    }
}
