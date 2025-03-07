//
//  TutorProfileViewController.swift
//  iOSTrainig
//
//  Created by FDC-Kit on 3/6/25.
//

import UIKit

class TutorProfileViewController: UIViewController {
    var teacher: Teacher?

    @IBOutlet weak var teacherNameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let teacher = teacher {
            teacherNameLabel.text = teacher.name
        }
    }
}
