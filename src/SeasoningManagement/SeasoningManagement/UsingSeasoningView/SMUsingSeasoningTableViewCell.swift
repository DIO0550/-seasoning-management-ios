//
//  SMUsingSeasoningTableViewCell.swift
//  SeasoningManagement
//
//  Created by DIO on 2020/05/10.
//  Copyright © 2020 DIO0550. All rights reserved.
//

import UIKit

class SMUsingSeasoningTableViewCell: UITableViewCell {
    
    /// 初期のフレーム
    /// layoutSubViewsが呼ばれるたびに高さが縮むため
    var originalFrame: CGRect? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if self.originalFrame == nil { self.originalFrame = self.frame; }
        self.frame = self.originalFrame!.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
    }

}
