//
//  FirstViewController.swift
//  SeasoningManagement
//
//  Created by DIO on 2020/05/09.
//  Copyright © 2020 DIO0550. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SMUsingSeasoningViewController: UIViewController {
    var usingSeasoningList: Array = ["Seasoning1", "Seasoning2", "Seasoning3", "Seasoning1", "Seasoning2", "Seasoning3", "Seasoning1", "Seasoning2", "Seasoning3"]
    
    struct SMUsingSeasoningListCollectionViewMergin {
        static let Left: CGFloat = 10.0
        static let Right: CGFloat = 10.0
    }
    
    static let SMUsingSeasoningListCollectionViewItemHeight: CGFloat = 150.0
    
    let disposeBag = DisposeBag()

    @IBOutlet weak var usingSeasoningListCollectionView: UICollectionView!
    @IBOutlet weak var addUsingSeasoningButton: UIButton!
    
    override func viewDidLoad() {
        self.usingSeasoningListCollectionView.register(UINib(nibName: SMCommonConst.SMUsingSeasoningCollectionViewCellIndentifier, bundle: nil), forCellWithReuseIdentifier: SMCommonConst.SMUsingSeasoningCollectionViewCellIndentifier)
        self.setupFlowLayout()
        
        self.addUsingSeasoningButton.rx.tap
            .subscribe(onNext: { [weak self] in
            })
            .disposed(by: disposeBag)
        
        self.usingSeasoningListCollectionView.rx.itemSelected
    }
    
    private func setupFlowLayout() {
        let layout = UICollectionViewFlowLayout()
        let sideMargin = SMUsingSeasoningListCollectionViewMergin.Left + SMUsingSeasoningListCollectionViewMergin.Right
        layout.itemSize = CGSize(width: self.usingSeasoningListCollectionView.frame.width - sideMargin,
                                 height: SMUsingSeasoningViewController.SMUsingSeasoningListCollectionViewItemHeight)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        layout.minimumLineSpacing = 20
        self.usingSeasoningListCollectionView.collectionViewLayout = layout
    }
}

