//
//  LearningViewController.swift
//  iOSTrainig
//
//  Created by FDC-Kit on 3/6/25.
//

import UIKit

class LearningViewController: UIViewController {
    private var products: [ProductsResponse.Product] = []
    @IBOutlet weak var collectionView: UICollectionView!
    private let productIdentifier = "ProductCell"
    
    override func viewDidLoad() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        super.viewDidLoad()
        title = "Learning"
        
        let nib = UINib(nibName: productIdentifier, bundle:nil)
        collectionView.register(nib, forCellWithReuseIdentifier: productIdentifier)
        
        APIRequest.shared.fetchProducts {
            [weak self] products in self?.products = products
            print(products)
            
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
}

extension LearningViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: productIdentifier, for: indexPath) as? ProductCell {
            cell.configureCell(with: products[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    // Improved responsive UI layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
//        let spacing: CGFloat = 5
//        let itemsPerRow: CGFloat = 10
        let itemWidth = (screenWidth - 10 / 3) / 10
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
