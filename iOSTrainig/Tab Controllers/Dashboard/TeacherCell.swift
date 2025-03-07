//
//  TeacherCell.swift
//  iOSTrainig
//
//  Created by FDC-Kit on 3/4/25.
//

import UIKit

protocol TeacherCellDelegate: AnyObject {
    func didTapFavoriteButton(_ cell: TeacherCell)
}

class TeacherCell: UITableViewCell {
    @IBOutlet weak var teacherImageView: UIImageView!
    @IBOutlet weak var teacherNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var addFavorite: UIImageView!
    
    weak var delegate: TeacherCellDelegate?
    private var teacher: Teacher?

    override func awakeFromNib() {
        super.awakeFromNib()
        setupImageView()
        
        // Add Tap Gesture to Favorite Button
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(favoriteTapped))
        addFavorite.isUserInteractionEnabled = true
        addFavorite.addGestureRecognizer(tapGesture)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        teacherImageView.layer.cornerRadius = teacherImageView.frame.size.width / 2
    }
    
    func configureCell(with teacher: Teacher, isFavorite: Bool) {
        self.teacher = teacher
        teacherImageView.image = UIImage(named: teacher.image)
        teacherNameLabel.text = teacher.name
        addressLabel.text = teacher.address
        
        updateFavoriteIcon(isFavorite)
    }
    
    @objc func favoriteTapped() {
        guard let teacher = teacher else { return }
        
        // Toggle favorite in FavoriteManager
        FavoriteManager.shared.toggleFavorite(teacher: teacher)
        
        // Update UI
        let isFavorite = FavoriteManager.shared.isFavorite(teacher: teacher)
        updateFavoriteIcon(isFavorite)
    }
    
    private func updateFavoriteIcon(_ isFavorite: Bool) {
        let imageName = isFavorite ? "plus.circle.fill" : "plus.circle"
        addFavorite.image = UIImage(systemName: imageName)
    }
    
    private func setupImageView() {
        teacherImageView.layer.cornerRadius = teacherImageView.frame.size.width / 2
        teacherImageView.clipsToBounds = true
        teacherImageView.layer.borderWidth = 1
        teacherImageView.layer.borderColor = UIColor.lightGray.cgColor
        teacherImageView.contentMode = .scaleAspectFill
    }
}
