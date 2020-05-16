//
//  SMUsingSeasoningCollectionViewCellSectionOfModel.swift
//  SeasoningManagement
//
//  Created by DIO on 2020/05/16.
//  Copyright © 2020 DIO0550. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources

struct SMUsingSeasoningCollectionViewCellSectionOfModel {
    var header: String
    var items: [Item]
}

extension SMUsingSeasoningCollectionViewCellSectionOfModel: SectionModelType {
    
    typealias Item = SMUsingSeasoningCollectionViewCellModel
    
    init(original: SMUsingSeasoningCollectionViewCellSectionOfModel, items: [SMUsingSeasoningCollectionViewCellModel]) {
        self = original
        self.items = items
    }
    
}
