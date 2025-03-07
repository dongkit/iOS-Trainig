//
//  BannerCell.swift
//  iOSTrainig
//
//  Created by FDC-Kit on 3/6/25.
//

import UIKit

class BannerCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    let bannerIdentifier = "BannerCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: bannerIdentifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: bannerIdentifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

extension BannerCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bannerIdentifier, for: indexPath) as? BannerCollectionViewCell {
            cell.configureCell(with: "native-camp")
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = UIScreen.main.bounds.size
        let width = screenSize.width
        let height: CGFloat = 200
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
