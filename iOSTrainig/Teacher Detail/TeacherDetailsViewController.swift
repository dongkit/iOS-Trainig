//
//  TeacherDetailsViewController.swift
//  iOSTrainig
//
//  Created by FDC-Kit on 3/4/25.
//

import UIKit

class TeacherDetailsViewController: UIViewController {
    @IBOutlet weak var teacherImageView: UIImageView!
    @IBOutlet weak var teacherNameLabel: UILabel!
    
    var teacher: Teacher?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let teacher = teacher {
            title = "Teacher \(teacher.name)"
            teacherImageView.image = UIImage(named: teacher.image)
            teacherNameLabel.text = teacher.name
        }
        
        self.navigationController?.navigationBar.topItem?.backButtonTitle = ""
        
        // Add the ellipsis button
        let ellipsisButton = UIBarButtonItem(
            image: UIImage(systemName: "ellipsis"), // SF Symbol for ellipsis
            style: .plain,
            target: self,
            action: #selector(ellipsisButtonTapped)
        )
        
        navigationItem.rightBarButtonItem = ellipsisButton
    }
    
    @objc func ellipsisButtonTapped() {
        let alert = UIAlertController(title: "Options", message: "Choose an action", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Edit", style: .default, handler: { _ in
            print("Edit tapped")
        }))
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
            print("Delete tapped")
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true)
    }
    
}
