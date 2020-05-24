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

class SMAddSeasoningViewController: UIViewController {
    @IBOutlet weak var addDataBarButton: UIBarButtonItem!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.addDataBarButton.rx.tap.asDriver().drive(onNext: { [weak self] in
            self?.performSegue(withIdentifier: "SMInputAddSeasoningDataViewControllerShowIdentifier",
                               sender: nil)
            })
            .disposed(by: disposeBag)
    }

}
