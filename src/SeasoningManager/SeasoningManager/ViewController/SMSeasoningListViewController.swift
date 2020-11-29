//
//  ViewController.swift
//  SeasoningManager
//
//  Created by DIO on 2020/11/14.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class SMSeasoningListViewController: UIViewController {
    typealias Section = SMSeasoningListTableViewCellSectionOfModel
    
    let disposeBag = DisposeBag()
    
    //  データソース
    var dataSeource: RxTableViewSectionedAnimatedDataSource<Section>?
    
    /// 調味料テーブルビュー
    @IBOutlet weak var seasoningListTableView: UITableView! {
        didSet {
            let nib = UINib(nibName: SMNibName.SMSeasoningListCellView, bundle: Bundle.main)
            self.seasoningListTableView.register(nib, forCellReuseIdentifier: <#T##String#>)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

