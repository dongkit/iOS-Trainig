//
//  LessonDetailViewController.swift
//  iOSTrainig
//
//  Created by FDC-Kit on 3/6/25.
//

import UIKit

class LessonDetailViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        
        let label = UILabel()
        label.text = "Lesson Details"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.frame = view.bounds
        
        view.addSubview(label)
    }
}
