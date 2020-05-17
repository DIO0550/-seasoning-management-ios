//
//  SMUsingSeasoningCollectionViewModel.swift
//  SeasoningManagement
//
//  Created by DIO on 2020/05/17.
//  Copyright © 2020 DIO0550. All rights reserved.
//

import UIKit
import RxDataSources
import RxSwift
import RxCocoa

class SMUsingSeasoningCollectionViewModel {
    typealias Section = SMUsingSeasoningCollectionViewCellSectionOfModel
    typealias Model = SMUsingSeasoningCollectionViewCellModel
    
    private let items = BehaviorRelay<[Section]>(value: [])
    
    func sectionsObservable() -> Observable<[Section]> {
        return self.items.asObservable()
    }
    
    func addUsingSeasoning(model: Model) {
        let uuid = UUID().uuidString
        var value = self.items.value
        value.append(SMUsingSeasoningCollectionViewCellSectionOfModel(header: uuid, items: [model]))
        self.items.accept(value)
    }
}
