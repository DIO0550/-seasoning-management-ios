//
//  SMSeasoningDataListTableViewModel.swift
//  SeasoningManagement
//
//  Created by DIO on 2020/05/26.
//  Copyright © 2020 DIO0550. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

struct SMSeasoningDataListTableViewCellModel: IdentifiableType, Equatable {
    var seasoningName: String
    
    typealias Identity = String
    var identity: String {
        return self.seasoningName
    }
}
