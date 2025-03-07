//
//  ProductCell.swift
//  iOSTrainig
//
//  Created by FDC-Kit on 3/7/25.
//

import UIKit
import Kingfisher

class ProductCell: UICollectionViewCell {
    @IBOutlet weak var productImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(with product: ProductsResponse.Product) {
        guard let imageURL = product.thumbnail,
              let url = URL(string: imageURL) else {
            return
        }
        productImageView.kf.setImage(with: url)
    }

}
