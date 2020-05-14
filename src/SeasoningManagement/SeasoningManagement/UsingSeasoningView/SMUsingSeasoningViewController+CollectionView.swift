//
//  SMUsingSeasoningViewController+TableView.swift
//  SeasoningManagement
//
//  Created by DIO on 2020/05/10.
//  Copyright © 2020 DIO0550. All rights reserved.
//

import UIKit

extension SMUsingSeasoningViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.usingSeasoningList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let usingSeasoningCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: SMCommonConst.SMUsingSeasoningCollectionViewCellIndentifier, for: indexPath) as! SMUsingSeasoningCollectionViewCell


        return usingSeasoningCollectionViewCell
    }
    

    
}
