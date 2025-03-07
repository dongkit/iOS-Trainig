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
    private var imageNames: [String] = []  // Now mutable
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "PhotoCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "PhotoCell")
        
        if let teacher = teacher {
            title = "\(teacher.name)'s Photos"
            loadTeacherImages(for: teacher)
        }
    }
    
    func loadTeacherImages(for teacher: Teacher) {
        imageNames = (1...100).map { "\(teacher.name.lowercased())-\($0)" }
        collectionView.reloadData()
    }


}

extension PhotosViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCell {
            cell.configureCell(with: imageNames[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    // Improved responsive UI layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let spacing: CGFloat = 5
        let itemsPerRow: CGFloat = 10 // 10 images per row
        let itemWidth = (screenWidth - (spacing * (itemsPerRow + 1))) / itemsPerRow
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("YOU TAPPED A PHOTO AT INDEX: \(indexPath.row)")
        
        let alert = UIAlertController(
            title: "Collection View Practice",
            message: "Please select a photo",
            preferredStyle: .actionSheet
        )
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default)
        alert.addAction(cameraAction)
        
        let libraryAction = UIAlertAction(title: "Photo Library", style: .default)
        alert.addAction(libraryAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
}
