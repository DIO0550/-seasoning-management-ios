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

class SMInputAddSeasoningDataViewController: UIViewController {
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var typeLabel: UITextField!
    @IBOutlet weak var priceLabel: UITextField!
    @IBOutlet weak var calorieLabel: UITextField!
    
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.doneBarButton.rx.tap.asDriver().drive(onNext: { [weak self] in
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let seasoningData = appDelegate.createSeasoningData()
            seasoningData.name = "醤油"
            seasoningData.type = "調味料"
            appDelegate.saveContext()
            self?.dismiss(animated: true, completion: nil)
        })
        .disposed(by: disposeBag)
    }
    

}
