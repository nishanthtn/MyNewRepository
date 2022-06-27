//
//  HomeViewController.swift
//  SampleApp
//
//  Created by Jaldee on 25/06/22.
//

import UIKit

class HomeViewController: UIViewController {
//HomeViewID
    @IBOutlet weak var viewSearch: UIView!
    @IBOutlet weak var viewCategory: UIView!
    @IBOutlet weak var collectionViewCategory: UICollectionView!
    @IBOutlet weak var viewBanners: UIView!
    @IBOutlet weak var viewBannerHeight: NSLayoutConstraint!
    @IBOutlet weak var collectionViewBanners: UICollectionView!
    @IBOutlet weak var viewProducts: UIView!
    @IBOutlet weak var collectionViewProducts: UICollectionView!
    @IBOutlet weak var viewCategoryHeight: NSLayoutConstraint!
    @IBOutlet weak var viewProductHeight: NSLayoutConstraint!
    
    var categories = ["Groceries", "Home", "Mobile", "Fashion", "Electronics", "Groceries", "Home", "Mobile", "Fashion", "Electronics"]
    
    var viewModel = HomeViewModel()
    var homeData: DataModel?
    var cateGoryData: HomeData?
    var bannerData: HomeData?
    var productData: HomeData?
    var types = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.apiToGetData { [weak self] in
            self?.homeData = self?.viewModel.homeData
                   DispatchQueue.main.async {
                       
                       self?.types = /*["products","category", "banners"]*/CommonClass.createTypeArr(data: self?.homeData ?? DataModel())
                       CommonClass.initialiseCollectionView(collectionViewCateogory: (self?.collectionViewCategory)!, collectionViewBanner: (self?.collectionViewBanners)!, collectionViewProduct: (self?.collectionViewProducts)!, type: self?.types ?? [])
                       self?.collectionViewCategory.dataSource = self
                       self?.collectionViewCategory.delegate = self
                       self?.collectionViewBanners.dataSource = self
                       self?.collectionViewBanners.delegate = self
                       self?.collectionViewProducts.dataSource = self
                       self?.collectionViewProducts.delegate = self
                       
                       self?.cateGoryData = self?.homeData?.homeData?.filter {$0.type == "category"}.first
                       self?.bannerData = self?.homeData?.homeData?.filter {$0.type == "banners"}.first
                       self?.productData = self?.homeData?.homeData?.filter {$0.type == "products"}.first
                       
                       self?.collectionViewCategory.reloadData()
                       self?.collectionViewBanners.reloadData()
                       self?.collectionViewProducts.reloadData()
                       self?.setHeight()
                   }
                   
               }
        
        print("HomeViewController")
        // Do any additional setup after loading the view.
//        self.viewBannerHeight.constant = UIDevice.current.userInterfaceIdiom == .pad ? 250 : 190
    }
    func setHeight() {
        
        if types.first == "category"{
            self.viewCategoryHeight.constant = 120
            if types[1] == "banners"{
                self.viewBannerHeight.constant = UIDevice.current.userInterfaceIdiom == .pad ? 250 : 190
                self.viewProductHeight.constant = 250
            }else {
                self.viewBannerHeight.constant = 250
                self.viewProductHeight.constant = UIDevice.current.userInterfaceIdiom == .pad ? 250 : 190
            }
        }
        if types.first == "banners"{
            self.viewCategoryHeight.constant = UIDevice.current.userInterfaceIdiom == .pad ? 250 : 190
            if types[1] == "products"{
                self.viewBannerHeight.constant = 250
                self.viewProductHeight.constant = 120
            }else {
                self.viewBannerHeight.constant = 120
                self.viewProductHeight.constant = 250
            }
        }
        if types.first == "products"{
            self.viewCategoryHeight.constant = 250
            if types[1] == "banners"{
                self.viewBannerHeight.constant = UIDevice.current.userInterfaceIdiom == .pad ? 250 : 190
                self.viewProductHeight.constant = 120
            }else {
                self.viewBannerHeight.constant = 120
                self.viewProductHeight.constant = UIDevice.current.userInterfaceIdiom == .pad ? 250 : 190
            }
        }
    }
}
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionViewCategory{
            if self.types.first == "category"{
            return self.cateGoryData?.values?.count ?? 0
            }
            if self.types.first == "banners"{
                return self.bannerData?.values?.count ?? 0
            }
            if self.types.first == "products"{
                return self.productData?.values?.count ?? 0
            }
        }
        if collectionView == self.collectionViewBanners{
            if self.types[1] == "category"{
            return self.cateGoryData?.values?.count ?? 0
            }
            if self.types[1] == "banners"{
                return self.bannerData?.values?.count ?? 0
            }
            if self.types[1] == "products"{
                return self.productData?.values?.count ?? 0
            }
        }
        if collectionView == self.collectionViewProducts{
//            return self.productData?.values?.count ?? 0
            if self.types.last == "category"{
            return self.cateGoryData?.values?.count ?? 0
            }
            if self.types.last == "banners"{
                return self.bannerData?.values?.count ?? 0
            }
            if self.types.last == "products"{
                return self.productData?.values?.count ?? 0
            }
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionViewCategory{
            if self.types.first == "category"{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as? CategoryCell {
                cell.name = self.categories[indexPath.item]
                cell.categoryData = self.cateGoryData?.values?[indexPath.item]
                cell.setContents()
                return cell
            }
            }
            else if self.types.first == "banners"{
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as? BannerCell {
                    cell.layer.borderColor = UIColor.lightGray.cgColor
                    cell.layer.cornerRadius = 5
                    cell.layer.shadowColor = UIColor.black.cgColor
                    cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
                    cell.layer.shadowRadius = 5.0
                    cell.layer.shadowOpacity = 0.5
                    cell.layer.masksToBounds = false
                    cell.contentView.layer.cornerRadius = 5
                    cell.bannerData = self.bannerData?.values?[indexPath.item]
                    cell.setContents()
                    return cell
            }
            }
            else if self.types.first == "products"{
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell {
                    cell.layer.borderColor = UIColor.lightGray.cgColor
                    cell.layer.cornerRadius = 5
                    cell.layer.shadowColor = UIColor.black.cgColor
                    cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
                    cell.layer.shadowRadius = 5.0
                    cell.layer.shadowOpacity = 0.5
                    cell.layer.masksToBounds = false
                    cell.contentView.layer.cornerRadius = 5
                    cell.productData = self.productData?.values?[indexPath.item]
                    cell.setContents()
                    return cell
                }
            }
            
        }
        if collectionView == self.collectionViewBanners{
            if self.types[1] == "category"{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as? CategoryCell {
                cell.name = self.categories[indexPath.item]
                cell.categoryData = self.cateGoryData?.values?[indexPath.item]
                cell.setContents()
                return cell
            }
            }
            else if self.types[1] == "banners"{
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as? BannerCell {
                    cell.layer.borderColor = UIColor.lightGray.cgColor
                    cell.layer.cornerRadius = 5
                    cell.layer.shadowColor = UIColor.black.cgColor
                    cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
                    cell.layer.shadowRadius = 5.0
                    cell.layer.shadowOpacity = 0.5
                    cell.layer.masksToBounds = false
                    cell.contentView.layer.cornerRadius = 5
                    cell.bannerData = self.bannerData?.values?[indexPath.item]
                    cell.setContents()
                    return cell
            }
            }
            else if self.types[1] == "products"{
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell {
                    cell.layer.borderColor = UIColor.lightGray.cgColor
                    cell.layer.cornerRadius = 5
                    cell.layer.shadowColor = UIColor.black.cgColor
                    cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
                    cell.layer.shadowRadius = 5.0
                    cell.layer.shadowOpacity = 0.5
                    cell.layer.masksToBounds = false
                    cell.contentView.layer.cornerRadius = 5
                    cell.productData = self.productData?.values?[indexPath.item]
                    cell.setContents()
                    return cell
                }
            }
        }
        if collectionView == self.collectionViewProducts{
            if self.types.last == "category"{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as? CategoryCell {
                cell.name = self.categories[indexPath.item]
                cell.categoryData = self.cateGoryData?.values?[indexPath.item]
                cell.setContents()
                return cell
            }
            }
            else if self.types.last == "banners"{
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as? BannerCell {
                    cell.layer.borderColor = UIColor.lightGray.cgColor
                    cell.layer.cornerRadius = 5
                    cell.layer.shadowColor = UIColor.black.cgColor
                    cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
                    cell.layer.shadowRadius = 5.0
                    cell.layer.shadowOpacity = 0.5
                    cell.layer.masksToBounds = false
                    cell.contentView.layer.cornerRadius = 5
                    cell.bannerData = self.bannerData?.values?[indexPath.item]
                    cell.setContents()
                    return cell
            }
            }
            else if self.types.last == "products"{
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell {
                    cell.layer.borderColor = UIColor.lightGray.cgColor
                    cell.layer.cornerRadius = 5
                    cell.layer.shadowColor = UIColor.black.cgColor
                    cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
                    cell.layer.shadowRadius = 5.0
                    cell.layer.shadowOpacity = 0.5
                    cell.layer.masksToBounds = false
                    cell.contentView.layer.cornerRadius = 5
                    cell.productData = self.productData?.values?[indexPath.item]
                    cell.setContents()
                    return cell
                }
            }
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
}
