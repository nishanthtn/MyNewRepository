//
//  CommonClass.swift
//  SampleApp
//
//  Created by Jaldee on 26/06/22.
//

import UIKit

class CommonClass: NSObject {

    class func initialiseCategoryCollectionView(collectionView: UICollectionView){
        let cellNib = UINib(nibName: "CategoryCell", bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "CategoryCell")
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 100, height: 120)
        flowLayout.minimumLineSpacing = 10.0
        flowLayout.minimumInteritemSpacing = 10.0
        collectionView.collectionViewLayout = flowLayout
        collectionView.showsHorizontalScrollIndicator = false
       
    }
    class func initialiseBannerCollectionView(collectionView: UICollectionView){
        let cellNib1 = UINib(nibName: "BannerCell", bundle: nil)
        collectionView.register(cellNib1, forCellWithReuseIdentifier: "BannerCell")
        
        let flowLayout1 = UICollectionViewFlowLayout()
        flowLayout1.scrollDirection = .horizontal
        if UIDevice.current.userInterfaceIdiom == .pad{
            flowLayout1.itemSize = CGSize(width: 460, height: 240)
        }else{
            flowLayout1.itemSize = CGSize(width: 280, height: 180)
        }
        
        flowLayout1.minimumLineSpacing = 10.0
        flowLayout1.minimumInteritemSpacing = 10.0
        collectionView.collectionViewLayout = flowLayout1
        collectionView.showsHorizontalScrollIndicator = false
        
    }
    class func initialiseProductCollectionView(collectionView: UICollectionView){
        let cellNib2 = UINib(nibName: "ProductCell", bundle: nil)
        collectionView.register(cellNib2, forCellWithReuseIdentifier: "ProductCell")
        
        let flowLayout2 = UICollectionViewFlowLayout()
        flowLayout2.scrollDirection = .horizontal
        
        flowLayout2.itemSize = CGSize(width: 170, height: 250)
        flowLayout2.minimumLineSpacing = 10.0
        flowLayout2.minimumInteritemSpacing = 10.0
        collectionView.collectionViewLayout = flowLayout2
        collectionView.showsHorizontalScrollIndicator = false
    }
}
