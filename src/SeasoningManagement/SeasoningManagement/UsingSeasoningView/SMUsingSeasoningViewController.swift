//
//  FirstViewController.swift
//  SeasoningManagement
//
//  Created by DIO on 2020/05/09.
//  Copyright © 2020 DIO0550. All rights reserved.
//

import UIKit

class SMUsingSeasoningViewController: UIViewController {
    var usingSeasoningList: Array = ["Seasoning1", "Seasoning2", "Seasoning3", "Seasoning1", "Seasoning2", "Seasoning3", "Seasoning1", "Seasoning2", "Seasoning3"]

    @IBOutlet weak var usingSeasoningListCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        self.usingSeasoningListCollectionView.register(UINib(nibName: "SMUsingSeasoningCollectionViewCell", bundle: nil), forCellWithReuseIdentifier:"SMUsingSeasoningCollectionViewCell")
        self.setupFlowLayout()
    }
    
    private func setupFlowLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: self.usingSeasoningListCollectionView.frame.width - 20, height: 150)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        layout.minimumLineSpacing = 20
        self.usingSeasoningListCollectionView.collectionViewLayout = layout
    }
}

