//
//  FavoriteTutorViewController.swift
//  iOSTrainig
//
//  Created by FDC-Kit on 3/6/25.
//

import UIKit

class FavoriteTutorViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var favoriteTeachers: [Teacher] {
        return FavoriteManager.shared.favoriteTeachers
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favorite Tutors"
        tableView.dataSource = self
        tableView.delegate = self

        // Register the cell before dequeuing it
        let nib = UINib(nibName: "TeacherCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TeacherCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData() // Reload the list every time the screen appears
    }
}

extension FavoriteTutorViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteTeachers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeacherCell", for: indexPath) as! TeacherCell
        let teacher = favoriteTeachers[indexPath.row]
        cell.configureCell(with: teacher, isFavorite: true)
        return cell
    }
}
