//
//  SMUsingSeasoningViewController+TableView.swift
//  SeasoningManagement
//
//  Created by DIO on 2020/05/10.
//  Copyright © 2020 DIO0550. All rights reserved.
//

import UIKit

extension SMUsingSeasoningViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.usingSeasoningList.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.init(named: "SMUsingSeasoningTableViewCell")
        cell.layer.borderWidth = 2.0
        cell.layer.cornerRadius = 10.0
        cell.layer.masksToBounds = false;
        cell.layer.shadowRadius = 5.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SMCommonConst.SMUsingSeasoningTableViewCellIndentifier, for: indexPath) as! SMUsingSeasoningTableViewCell

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
