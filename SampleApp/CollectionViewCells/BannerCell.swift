//
//  BannerCell.swift
//  SampleApp
//
//  Created by Jaldee on 26/06/22.
//

import UIKit

class BannerCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    var bannerData: ValueData?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setContents(){
        self.showImage()
        
        
    }
    func showImage() {
        let url = URL(string: self.bannerData?.banner_url ?? "")!
        let data = try? Data(contentsOf: url)
        if let imageData = data {
            let image = UIImage(data: imageData)
            self.imgView.image = image
        }
        self.imgView.contentMode = UIView.ContentMode.scaleAspectFill
        self.imgView.clipsToBounds = true
    }
}
