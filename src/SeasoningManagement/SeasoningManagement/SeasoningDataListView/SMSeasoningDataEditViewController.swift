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
    
    /// 調味料データ
    var seasoningData: SeasoningData?
    var seasonign: SeasoningNutrients?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSeaoningData()
    }
    
    private func setupSeaoningData() {
        // 名前
        self.nameLabel.text = self.seasoningData?.name
        // 種類
        self.typeLabel.text = self.seasoningData?.type
        
        if let price = self.seasoningData?.price {
            self.priceLabel.text = String(price)
        } else {
            self.priceLabel.text = String(0)
        }
        
        // カロリー
        if let carorie = self.seasoningData?.nutrients?.calorie {
            self.calorieLabel.text = String(carorie)
        } else {
            self.calorieLabel.text = String(0)
        }
        
        // タンパク質
        if let protein = self.seasoningData?.nutrients?.protein {
            self.proteinLabel.text = String(protein)
        } else {
            self.proteinLabel.text = String(0)
        }
        
        // 脂質
        if let lipid = self.seasoningData?.nutrients?.lipid {
            self.lipidLabel.text = String(lipid)
        } else {
            self.lipidLabel.text = String(0)
        }
        
        // 糖質
        if let sugar = self.seasoningData?.nutrients?.lipid {
            self.sugarLabel.text = String(sugar)
        } else {
            self.sugarLabel.text = String(0)
        }
        
        // 炭水化物
        if let carbohydrate = self.seasoningData?.nutrients?.carbohydrate {
            self.carbohydrateLabel.text = String(carbohydrate)
        } else {
            self.carbohydrateLabel.text = String(0)
        }
    }
}
