//
//  PhotoCell.swift
//  iOSTrainig
//
//  Created by FDC-Kit on 3/5/25.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(with imageName: String) {
        self.photoImageView.image = UIImage(named: imageName)
    }

}
