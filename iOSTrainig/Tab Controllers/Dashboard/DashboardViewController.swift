//
//  SignInViewController.swift
//  iOSTrainig
//
//  Created by FDC-Kit on 3/3/25.
//

import UIKit

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let teacherCellIdentifier = "TeacherCell"
    private let bannerCellIdentifier = "BannerCell"
    
    var teachers: [Teacher] = [
        Teacher(image: "native-camp", name: "Kit", flag: "🇵🇭", address: "Cordova"),
        Teacher(image: "axe-1", name: "Axe", flag: "🇵🇭", address: "Cebu"),
        Teacher(image: "fizz-1", name: "Fizz", flag: "🇵🇭", address: "Mandaue"),
        Teacher(image: "akai-1", name: "Akai", flag: "🇵🇭", address: "Lapu-lapu"),
        Teacher(image: "rylai-1", name: "Rylai", flag: "🇵🇭", address: "Naga"),
        Teacher(image: "leona-1", name: "Leona", flag: "🇵🇭", address: "Consolacion"),
        Teacher(image: "selena-1", name: "Selena", flag: "🇵🇭", address: "Catmon"),
        Teacher(image: "pudge-1", name: "Pudge", flag: "🇵🇭", address: "Talisay"),
        Teacher(image: "miya-1", name: "Miya", flag: "🇵🇭", address: "Argao")
    ]
    
    var favoriteTeachers: [Teacher] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Teacher List"
        tableView.dataSource = self
        tableView.delegate = self
        
        let nib = UINib(nibName: "TeacherCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TeacherCell")
        
        let nib2 = UINib(nibName: "BannerCell", bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: "BannerCell")
        
        // Add Long Press Gesture Recognizer
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        longPressGesture.minimumPressDuration = 2.0 // 2 seconds hold time
        tableView.addGestureRecognizer(longPressGesture)
        
//        let barButtonItem = UIBarButtonItem(
//            title: nil,9
//            image: UIImage(systemName: "xmark"),
//            target: self,
//            action: #selector(didTapCloseButton)
//        )
//        self.navigationItem.rightBarButtonItem = barButtonItem
//        self.navigationItem.rightBarButtonItem?.tintColor = .systemGray2
//        self.navigationItem.hidesBackButton = true
        
    }
    @objc func didTapCloseButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension DashboardViewController: UITableViewDataSource, UITableViewDelegate, TeacherCellDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : teachers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "BannerCell", for: indexPath) as? BannerCell {
                return cell
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "TeacherCell", for: indexPath) as? TeacherCell {
                let teacher = teachers[indexPath.row]
                let isFavorite = favoriteTeachers.contains { $0.name == teacher.name }
                cell.configureCell(with: teacher, isFavorite: isFavorite)
                cell.delegate = self
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.section == 1 else { return }
        
        let teacher = teachers[indexPath.row]
        print("You tapped \(teacher.name)")
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let teacherDetailsVC = TeacherDetailsViewController()
        teacherDetailsVC.teacher = teacher
        self.navigationController?.pushViewController(teacherDetailsVC, animated: true)
    }
    
    @objc func handleLongPress(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            let touchPoint = gesture.location(in: tableView)
            if let indexPath = tableView.indexPathForRow(at: touchPoint), indexPath.section == 1 {
                let teacher = teachers[indexPath.row]
                print("Long press detected on \(teacher.name)")

                let photosVC = PhotosViewController()
                photosVC.teacher = teacher // Pass teacher data
                self.navigationController?.pushViewController(photosVC, animated: true)
            }
        }
    }
    
    // Handle Favorite Button Tap
    func didTapFavoriteButton(_ cell: TeacherCell) {
        if let indexPath = tableView.indexPath(for: cell), indexPath.section == 1 {
            let teacher = teachers[indexPath.row]
            
            if let index = favoriteTeachers.firstIndex(where: { $0.name == teacher.name }) {
                favoriteTeachers.remove(at: index)
            } else {
                favoriteTeachers.append(teacher)
            }
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
}
