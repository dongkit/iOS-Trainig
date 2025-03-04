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
    @IBOutlet weak var flagLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    var teacher: Teacher?  // Holds the teacher data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Ensure we have valid teacher data before updating UI
        if let teacher = teacher {
            teacherImageView.image = UIImage(named: teacher.image)
            teacherNameLabel.text = teacher.name
            flagLabel.text = teacher.flag
            addressLabel.text = teacher.address
        }
    }
}
