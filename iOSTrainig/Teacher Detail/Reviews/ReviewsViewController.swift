//
//  ReviewsViewController.swift
//  iOSTrainig
//
//  Created by FDC-Kit on 3/6/25.
//

import UIKit

class ReviewsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        let label = UILabel()
        label.text = "Reviews"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.frame = view.bounds
        
        view.addSubview(label)
    }
}
