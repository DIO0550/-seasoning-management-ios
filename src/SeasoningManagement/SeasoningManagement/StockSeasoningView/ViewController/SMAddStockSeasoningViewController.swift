//
//  SMAddStockSeasoningViewController.swift
//  SeasoningManagement
//
//  Created by DIO on 2020/07/03.
//  Copyright © 2020 DIO0550. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SMAddStockSeasoningViewController: UIViewController {
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    let disposeBag = DisposeBag()
    
    var seasoningData: SeasoningData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.doneButton.rx.tap.asDriver().drive(onNext: { [weak self] in
            // rootViewControllerの2つ先のViewControllerに戻る
            self?.navigationController?.popToViewController((self?.navigationController!.viewControllers[0] ?? nil)!, animated: true)
        })
        .disposed(by: self.disposeBag)
    }
    
    private func createSeaoningFromInputData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let seasoning: Seasoning = appDelegate.createSeasoning()
        seasoning.identifier = UUID()
        seasoning.seasoningData = self.seasoningData
        // 賞味期限
        seasoning.expirationDate = Date()
        // 開封日
        seasoning.openingDate = Date()
    }

}
