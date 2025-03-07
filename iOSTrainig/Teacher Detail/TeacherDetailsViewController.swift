//
//  TeacherDetailsViewController.swift
//  iOSTrainig
//
//  Created by FDC-Kit on 3/4/25.
//

import UIKit

class TeacherDetailsViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    @IBOutlet weak var teacherImageView: UIImageView!
    @IBOutlet weak var teacherNameLabel: UILabel!
    @IBOutlet weak var tabStackView: UIStackView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var uploadIcon: UIImageView!
    
    var teacher: Teacher?
    let imagePicker = UIImagePickerController()
    
    var tutorProfileVC: TutorProfileViewController!
    var lessonDetailVC: LessonDetailViewController!
    var reviewsVC: ReviewsViewController!
    var viewControllers: [UIViewController] = []

    
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
            image: UIImage(systemName: "ellipsis"),
            style: .plain,
            target: self,
            action: #selector(ellipsisButtonTapped)
        )
        navigationItem.rightBarButtonItem = ellipsisButton
        
        setupTabs()
        // Initialize child view controllers
        tutorProfileVC = TutorProfileViewController()
        lessonDetailVC = LessonDetailViewController()
        reviewsVC = ReviewsViewController()
        showTab(index: 0)
        
        setupUploadIcon()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
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
    
    // Changes the visible content when a tab is selected
    func showTab(index: Int) {
        let selectedVC: UIViewController
        switch index {
        case 0: selectedVC = tutorProfileVC
            tutorProfileVC.teacher = teacher
        case 1: selectedVC = lessonDetailVC
        case 2: selectedVC = reviewsVC
        default: return
        }

        // Remove previous content with slide effect
        UIView.transition(with: containerView, duration: 0.3, animations: {
            self.containerView.subviews.forEach { $0.removeFromSuperview() }
        }) { _ in
            // Add new content
            self.addChild(selectedVC)
            selectedVC.view.frame = self.containerView.bounds
            self.containerView.addSubview(selectedVC.view)
            selectedVC.didMove(toParent: self)
        }

        updateTabUI(selectedIndex: index)
    }

    let bottomIndicatorView = UIView()

    func setupTabs() {
        bottomIndicatorView.backgroundColor = UIColor.systemOrange
        bottomIndicatorView.frame = CGRect(x: 0, y: tabStackView.frame.height - 2, width: 0, height: 2)
        tabStackView.addSubview(bottomIndicatorView)

        for (index, button) in tabStackView.arrangedSubviews.enumerated() {
            if let btn = button as? UIButton {
                btn.tag = index
                btn.addTarget(self, action: #selector(tabTapped(_:)), for: .touchUpInside)
            }
        }
    }
    
    @IBAction func tabTapped(_ sender: UIButton) {
        showTab(index: sender.tag)
    }
    
    func updateTabUI(selectedIndex: Int) {
        UIView.animate(withDuration: 0.3) {
            for (index, button) in self.tabStackView.arrangedSubviews.enumerated() {
                if let btn = button as? UIButton {
                    if index == selectedIndex {
                        btn.setTitleColor(UIColor.systemOrange, for: .normal)
                    } else {
                        btn.setTitleColor(UIColor.black, for: .normal)
                    }
                }
            }
        }
        
        // Animate the bottom border movement
        guard let selectedButton = tabStackView.arrangedSubviews[selectedIndex] as? UIButton else { return }
        
        UIView.animate(withDuration: 0.3) {
            self.bottomIndicatorView.frame = CGRect(x: selectedButton.frame.origin.x,
                                                    y: self.tabStackView.frame.height - 2,
                                                    width: selectedButton.frame.width,
                                                    height: 2)
        }
    }
    
    private func setupUploadIcon() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(uploadImageTapped))
        uploadIcon.isUserInteractionEnabled = true // Enable interaction
        uploadIcon.addGestureRecognizer(tapGesture)
    }
    
    @objc private func uploadImageTapped() {
        let alert = UIAlertController(title: "Upload Image", message: "Choose an option", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { _ in
            self.openImagePicker(sourceType: .photoLibrary)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true)
    }
    
    private func openImagePicker(sourceType: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            imagePicker.sourceType = sourceType
            present(imagePicker, animated: true)
        }
    }
    
    // Handle selected image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let selectedImage = info[.editedImage] as? UIImage {
            teacherImageView.image = selectedImage
        } else if let selectedImage = info[.originalImage] as? UIImage {
            teacherImageView.image = selectedImage
        }
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }

}

// MARK: - UIView Extension for Borders
extension UIButton {
    func addBottomBorder(color: UIColor, thickness: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.height - thickness, width: self.frame.width, height: thickness)
        border.name = "bottomBorder" // Identify the border so we can remove it later
        self.layer.addSublayer(border)
    }
    
    func removeBottomBorder() {
        self.layer.sublayers?.removeAll(where: { $0.name == "bottomBorder" }) // Remove only the bottom border
    }
}

