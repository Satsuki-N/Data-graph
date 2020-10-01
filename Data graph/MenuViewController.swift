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
    var categoryItems: Results<Category>!
    let realm = try! Realm()
    var indexNumber: Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes
              = [NSAttributedString.Key.font: UIFont(name: "Times New Roman", size: 30)!]
        Menu.dataSource = self
        Menu.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
         categoryItems = realm.objects(Category.self)
        Menu.reloadData()
        print(categoryItems)
    }
    
    @IBAction func add() {
        self.performSegue(withIdentifier: "addmenu", sender: nil)
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("categoryItemsは\(categoryItems.count)")
        return categoryItems.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
       let cellItem = categoryItems[indexPath.row]
        print("categorytitleは\(cellItem.categorytitle)")
        cell?.textLabel?.text = cellItem.categorytitle
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          indexNumber = indexPath.row
        performSegue(withIdentifier: "showgragh", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
       {
           return true
       }

       //スワイプしたセルを削除　※arrayNameは変数名に変更してください
       func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           if editingStyle == UITableViewCell.EditingStyle.delete {
            var category = Category()
            category = categoryItems[indexPath.row]
            try! realm.write{
                realm.delete(category)
            }
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
           }
        
       }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "showgragh" {
               let nextVC = segue.destination as! ViewController
               nextVC.categoryNumber = indexNumber
           }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//           if editingStyle == UITableViewCell.EditingStyle.delete {
//               .remove(at: indexPath.row)
//               tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
//           }
//
    
}
    

}
