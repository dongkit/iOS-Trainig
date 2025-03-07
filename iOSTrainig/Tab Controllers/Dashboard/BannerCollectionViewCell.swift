//
//  BannerCollectionViewCell.swift
//  iOSTrainig
//
//  Created by FDC-Kit on 3/6/25.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var bannerImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(with imageName: String) {
        bannerImageView.image = UIImage(named: imageName)
    }

}
