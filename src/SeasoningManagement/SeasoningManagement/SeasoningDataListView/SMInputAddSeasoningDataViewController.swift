//
//  SMInputAddSeasoningDataViewController.swift
//  SeasoningManagement
//
//  Created by DIO on 2020/05/23.
//  Copyright © 2020 DIO0550. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources

class SMInputAddSeasoningDataViewController: UITableViewController {
    /// テーブルビュー
    @IBOutlet var seasoningDataEditTableView: UITableView!
    
    /// 名前
    @IBOutlet weak var nameLabel: UITextField!
    /// 種類
    @IBOutlet weak var typeLabel: UITextField!
    /// 価格
    @IBOutlet weak var priceLabel: UITextField!
    /// カロリー
    @IBOutlet weak var calorieLabel: UITextField!
    /// タンパク質
    @IBOutlet weak var proteinLabel: UITextField!
    /// 脂質
    @IBOutlet weak var lipidLabel: UITextField!
    /// 糖質
    @IBOutlet weak var sugarLabel: UITextField!
    /// 炭水化物
    @IBOutlet weak var carbohydrateLabel: UITextField!
    
    // Doneボタン
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UINib.init(nibName: "SMSeasoningEditViewHeader", bundle: nil),
                                forHeaderFooterViewReuseIdentifier: "SMSeasoningEditViewHeaderIndentifier")
        
        self.doneBarButton.rx.tap.asDriver().drive(onNext: { [weak self] in
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let seasoningData = appDelegate.createSeasoningData()
            seasoningData.name = self?.nameLabel.text
            seasoningData.type = self?.typeLabel.text
            seasoningData.identifier = UUID();
            appDelegate.saveContext()
            self?.navigationController?.popViewController(animated: true)
        })
        .disposed(by: disposeBag)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SMSeasoningEditViewHeaderIndentifier") as? SMSeasoningDataEditTableViewHeader
        headerView?.contentView.backgroundColor = UIColor.init(named: "SMSeasoningDataEditTableSectionHeaderColor")
        headerView?.textLabel?.textColor = UIColor.white
        return headerView
    }

}
