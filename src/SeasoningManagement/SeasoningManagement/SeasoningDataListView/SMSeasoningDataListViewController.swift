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
    
    var seasoningData: SeasoningData?;
    
    @IBOutlet weak var dataListSeasoningTableView: UITableView! {
        didSet {
            let nib = UINib(nibName: SMCommonConst.SMSeasoningDataListTableViewCellIdentifier, bundle: nil)
            self.dataListSeasoningTableView.register(nib,
                                                  forCellReuseIdentifier: SMCommonConst.SMSeasoningDataListTableViewCellIdentifier);
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
                let seasoningDataListTableViewCell = tableView.dequeueReusableCell(withIdentifier: SMCommonConst.SMSeasoningDataListTableViewCellIdentifier, for: indexPath) as! SMSeasoningDataListTableViewCell
                let model: SMSeasoningDataListTableViewCellModel = dataSource[indexPath]
                seasoningDataListTableViewCell.seasoningNameLabel.text = model.seasoningData.name
                return seasoningDataListTableViewCell
            },
            titleForHeaderInSection: { dataSource, index in
                return dataSource[index].header
            }
        )
        
        
        self.dataSource = dataSource
        
        self.dataListSeasoningTableView.rx.setDelegate(self).disposed(by: self.disposeBag)
        
        self.viewModel.sectionsObservable()
            .bind(to: self.dataListSeasoningTableView.rx.items(dataSource: self.dataSource!))
            .disposed(by: disposeBag)
        
        self.dataListSeasoningTableView.rx
            .modelSelected(SMSeasoningDataListTableViewCellModel.self)
            .subscribe(onNext: { [weak self] model in
                self?.seasoningData = model.seasoningData
                self?.performSegue(withIdentifier: SMCommonConst.SMSeasoningDataEditViewControllerIdentifier, sender: nil)
        }).disposed(by: disposeBag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.viewModel.updateItems()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SMCommonConst.SMSeasoningDataEditViewControllerIdentifier {
            guard let seasoningData = self.seasoningData else {
                return
            }
            let destVC = segue.destination as! SMSeasoningDataEditViewController
            destVC.seasoningData = seasoningData;
        }
    }
    
    private func setupSeasoningDataListTableViewCell(cell: SMSeasoningDataListTableViewCell, sesoningData: SeasoningData) {
        // 名前
        cell.seasoningNameLabel.text = sesoningData.name
        
        //
        cell.seasoningTypeLabel.t
    }
}
