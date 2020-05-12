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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SMCommonConst.SMUsingSeasoningTableViewCellIndentifier, for: indexPath) as! SMUsingSeasoningTableViewCell

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
