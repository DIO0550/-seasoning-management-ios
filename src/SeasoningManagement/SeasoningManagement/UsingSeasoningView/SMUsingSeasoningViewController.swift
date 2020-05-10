//
//  FirstViewController.swift
//  SeasoningManagement
//
//  Created by DIO on 2020/05/09.
//  Copyright © 2020 DIO0550. All rights reserved.
//

import UIKit

class SMUsingSeasoningViewController: UIViewController {
    var usingSeasoningList: Array = ["Seasoning1", "Seasoning2", "Seasoning3"]
    
    @IBOutlet weak var usingSeasoningListTableView: UITableView!
    
    override func viewDidLoad() {
        self.usingSeasoningListTableView.register (UINib(nibName: "SMUsingSeasoningTableViewCell", bundle: nil),forCellReuseIdentifier:"SMUsingSeasoningTableViewCell")
    }
}

