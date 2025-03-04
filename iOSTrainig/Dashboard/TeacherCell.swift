//
//  TeacherCell.swift
//  iOSTrainig
//
//  Created by FDC-Kit on 3/4/25.
//

import UIKit

class TeacherCell: UITableViewCell {
    @IBOutlet weak var teacherImageView: UIImageView!
    @IBOutlet weak var teacherNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(with teacher: Teacher) {
        teacherImageView.image = UIImage(named: teacher.image)
        teacherNameLabel.text = teacher.name
        addressLabel.text = teacher.address
    }
    
}
