//
//  SMUsingSeasoningTableViewCell.swift
//  SeasoningManagement
//
//  Created by DIO on 2020/05/10.
//  Copyright © 2020 DIO0550. All rights reserved.
//

import UIKit
import RxSwift

class SMUsingSeasoningTableViewCell: UITableViewCell {
    
    /// 初期のフレーム
    /// layoutSubViewsが呼ばれるたびに高さが縮むため
    var originalFrame: CGRect? = nil
    
    /// タッチ中か
    var isTouche = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10))
        self.setupLayer()
    }

    
    private func setupLayer() {
        if self.isTouche {
            self.backgroundColor = UIColor.black
        } else {
            self.backgroundColor = UIColor.white
        }

        self.layer.borderWidth = 2.0
        self.layer.cornerRadius = 10.0
        self.layer.masksToBounds = false;
        self.layer.shadowRadius = 5.0
        self.layer.shadowOpacity = 1.0
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.isTouche = true;
        self.setNeedsLayout()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.isTouche = true;
        self.setNeedsLayout()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.isTouche = false;
        self.setNeedsLayout()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.isTouche = false;
        self.setNeedsLayout()
    }
}
