//
//  SignInViewController.swift
//  iOSTrainig
//
//  Created by FDC-Kit on 3/3/25.
//

import UIKit

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Teacher List"
        tableView.dataSource = self
        tableView.delegate = self
        
        let nib = UINib(nibName: "TeacherCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TeacherCell")
        
        let barButtonItem = UIBarButtonItem(
            title: nil,
            image: UIImage(systemName: "xmark"),
            target: self,
            action: #selector(didTapCloseButton)
        )
        self.navigationItem.rightBarButtonItem = barButtonItem
        self.navigationItem.rightBarButtonItem?.tintColor = .systemGray2
//        self.navigationItem.hidesBackButton = true
    }
    @objc func didTapCloseButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension DashboardViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teachers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TeacherCell", for: indexPath) as? TeacherCell {
            cell.configureCell(with: teachers[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let teacher = teachers[indexPath.row]
        
        print("You tapped \(teacher.name)")
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let teacherDetailsVC = TeacherDetailsViewController()
        teacherDetailsVC.teacher = teacher
        self.navigationController?.pushViewController(teacherDetailsVC, animated: true)
        
        
        // collection view
//        let photosVC = PhotosViewController()
//        self.navigationController?.pushViewController(photosVC, animated: true)
    }

}
