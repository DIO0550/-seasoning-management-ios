//
//  SMSeasoningDataInfoViewController.swift
//  SeasoningManagement
//
//  Created by DIO on 2020/05/30.
//  Copyright © 2020 DIO0550. All rights reserved.
//

import UIKit

class SMSeasoningDataEditViewController: UITableViewController {
    
    /// 名前
    @IBOutlet weak var nameLabel: UITextField!
    /// 種類
    @IBOutlet weak var typeLabel: UITextField!
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
