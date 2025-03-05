//
//  PhotosViewController.swift
//  iOSTrainig
//
//  Created by FDC-Kit on 3/5/25.
//

import UIKit

class PhotosViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var teacher: Teacher?  // Holds the teacher data
    
    private let imageNames: [String] = [
        "native-camp", "native-camp", "native-camp",
        "native-camp", "native-camp", "native-camp",
        "native-camp", "native-camp", "native-camp",
        "native-camp", "native-camp", "native-camp",
        "native-camp", "native-camp", "native-camp"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "PhotoCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "PhotoCell")
    }
}

extension PhotosViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCell {
            cell.configureCell(with: imageNames[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = UIScreen.main.bounds.size
        let itemWidth = (screenSize.width-10) / 3
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("YOU TAPPED A PHOTO AT INDEX: \(indexPath.row)")
        
//        let alert = UIAlertController(
//            title: "Collection View Practice",
//            message: "You selected photo \(indexPath.row)",
//            preferredStyle: .alert
//        )
//        let okAction = UIAlertAction(title: "OK", style: .default)
//        alert.addAction(okAction)
//        self.present(alert, animated: true)
        
        let alert = UIAlertController(
            title: "Collection View Practice",
            message: "Please select a photo",
            preferredStyle: .alert
        )
        let cameraAction = UIAlertAction(title: "Camera", style: .default)
        alert.addAction(cameraAction)
        
        let libraryAction = UIAlertAction(title: "Photo Library", style: .default)
        alert.addAction(libraryAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        alert.addAction(cancelAction)
    }
    
    
}
