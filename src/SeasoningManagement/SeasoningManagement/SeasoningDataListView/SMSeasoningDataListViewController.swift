//
//  SMAddSeasoningViewController.swift
//  SeasoningManagement
//
//  Created by DIO on 2020/05/23.
//  Copyright © 2020 DIO0550. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class SMSeasoningDataListViewController: UIViewController, UITableViewDelegate {
    @IBOutlet weak var addDataBarButton: UIBarButtonItem!
    
    var dataSource: RxTableViewSectionedAnimatedDataSource<SMSeasoningDataListTableViewCellSectionOfModel>?
    var viewModel: SMSeasoningDataListTableViewModel = SMSeasoningDataListTableViewModel()
    
    @IBOutlet weak var dataListSeasoningTableView: UITableView! {
        didSet {
            let nib = UINib(nibName: SMCommonConst.SMSesonDataListTableViewCellIdentifier, bundle: nil)
            self.dataListSeasoningTableView.register(nib,
                                                  forCellReuseIdentifier: SMCommonConst.SMSesonDataListTableViewCellIdentifier);
        }
    }
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.addDataBarButton.rx.tap.asDriver().drive(onNext: { [weak self] in
            self?.performSegue(withIdentifier: "SMInputAddSeasoningDataViewControllerShowIdentifier",
                               sender: nil)
            })
            .disposed(by: disposeBag)
        
        let dataSource = RxTableViewSectionedAnimatedDataSource<SMSeasoningDataListTableViewCellSectionOfModel>(
            configureCell: { dataSource, tableView, indexPath, item in
                let seasoningDataListTableViewCell = tableView.dequeueReusableCell(withIdentifier: SMCommonConst.SMSesonDataListTableViewCellIdentifier, for: indexPath) as! SMSeasoningDataListTableViewCell
                let model: SMSeasoningDataListTableViewCellModel = dataSource[indexPath]
                seasoningDataListTableViewCell.seasoningNameLabel.text = model.seasoningName
                return seasoningDataListTableViewCell
        })
        
        
        self.dataSource = dataSource
        
        self.dataListSeasoningTableView.rx.setDelegate(self).disposed(by: self.disposeBag)
        
        self.viewModel.sectionsObservable()
            .bind(to: self.dataListSeasoningTableView.rx.items(dataSource: self.dataSource!))
            .disposed(by: disposeBag)
    }

}
