//
//  MagazineTableViewController.swift
//  Assignment_240524
//
//  Created by 김상규 on 5/24/24.
//

import UIKit

class MagazineTableViewController: UITableViewController {

    let magazine = MagazineInfo().magazine.sorted(by: { $0.date > $1.date })
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 480
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return magazine.count
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MagazineTableViewCell") as! MagazineTableViewCell
        
        cell.magazineTableViewCell(data: magazine[indexPath.row])
        cell.magazineTableViewCellUI()
        
        tableView.reloadRows(at: [IndexPath(row: indexPath.row, section: indexPath.section)], with: .automatic)
        
        return cell
    }

}
