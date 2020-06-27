//
//  SMAddStockSeasoningViewController.swift
//  SeasoningManagement
//
//  Created by DIO on 2020/06/25.
//  Copyright © 2020 DIO0550. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources
import RxCocoa

class SMSelectAddStockSeasoningViewController: UIViewController {
    let disposeBag = DisposeBag()
    
    // データソース
    var dataSource: RxTableViewSectionedAnimatedDataSource<SMSelectAddStockSeasoningTableViewCellSectionOfModel>?
    // ビューモデル
    var viewModel: SMSeasoningDataListTableViewModel = SMSeasoningDataListTableViewModel()
    
    @IBOutlet weak var selectAddStockSeasoningTableView: UITableView! {
        didSet {
            let nib = UINib(nibName: SMCommonConst.SMSelectAddStockSeasoningTableViewCellIdentifier, bundle: nil)
            self.selectAddStockSeasoningTableView.register(nib,
                                                  forCellReuseIdentifier: SMCommonConst.SMSelectAddStockSeasoningTableViewCellIdentifier);
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
