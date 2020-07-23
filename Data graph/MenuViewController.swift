//
//  MenuViewController.swift
//  Data graph
//
//  Created by satsuki nakai on 2020/06/11.
//  Copyright © 2020 satsuki nakai. All rights reserved.
//

import UIKit
import RealmSwift

class MenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var Menu: UITableView!
    var categoryArray: Results<Category>!
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes
              = [NSAttributedString.Key.font: UIFont(name: "Times New Roman", size: 30)!]
        Menu.dataSource = self
        
        categoryArray = realm.objects(Category.self)
    }
    
    @IBAction func add() {
        self.performSegue(withIdentifier: "addmenu", sender: nil)
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cellItems = realm.objects(Category.self)
        return cellItems.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
       let cellItems = realm.objects(Category.self)
       let cellItem = cellItems[indexPath.row]
        cell?.textLabel?.text = cellItem.categorytitle
        return cell!
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//           if editingStyle == UITableViewCell.EditingStyle.delete {
//               .remove(at: indexPath.row)
//               tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
//           }
//
    
}
    

