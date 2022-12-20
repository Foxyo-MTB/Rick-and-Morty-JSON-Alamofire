//
//  PostTableViewController.swift
//  JSON_Rick_and_Morty
//
//  Created by Vladimir Beliakov on 24.09.2022.
//

import UIKit

class PostTableViewController: UITableViewController {
    
    let dataManager = DataManager()
    
    var data: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
    }

    private func fetch() {
        dataManager.postRequestWithAlamofire { data in
            DispatchQueue.main.async {
                self.data = data.info
                self.tableView.reloadData()
            }
        }
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
         
         cell.textLabel?.text = data
         
     return cell
     }
}
