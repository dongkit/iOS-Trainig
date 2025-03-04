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
        Teacher(image: "native-camp", name: "Axe", flag: "🇵🇭", address: "Cebu"),
        Teacher(image: "native-camp", name: "Fizz", flag: "🇵🇭", address: "Mandaue"),
        Teacher(image: "native-camp", name: "Akai", flag: "🇵🇭", address: "Lapu-lapu"),
        Teacher(image: "native-camp", name: "Rylai", flag: "🇵🇭", address: "Naga"),
        Teacher(image: "native-camp", name: "Leona", flag: "🇵🇭", address: "Consolacion"),
        Teacher(image: "native-camp", name: "Selena", flag: "🇵🇭", address: "Catmon"),
        Teacher(image: "native-camp", name: "Pudge", flag: "🇵🇭", address: "Talisay"),
        Teacher(image: "native-camp", name: "Miya", flag: "🇵🇭", address: "Argao")
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
        self.navigationItem.rightBarButtonItem?.tintColor = .systemBrown
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
        print("You tapped row # \(indexPath.row)")
        
        tableView.deselectRow(at: indexPath, animated: true)

        let teacher = teachers[indexPath.row]

        // Load TeacherDetailsViewController from XIB
        let teacherDetailsVC = TeacherDetailsViewController(nibName: "TeacherDetailsViewController", bundle: nil)
        
        // Pass the selected teacher data
        teacherDetailsVC.teacher = teacher

        // Push the details screen
        self.navigationController?.pushViewController(teacherDetailsVC, animated: true)
    }

}
