//
//  MenuViewController.swift
//  Data graph
//
//  Created by satsuki nakai on 2020/06/11.
//  Copyright © 2020 satsuki nakai. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes
              = [NSAttributedString.Key.font: UIFont(name: "Times New Roman", size: 30)!]
    }
    
    @IBAction func add() {
        self.performSegue(withIdentifier: "addmenu", sender: nil)
    }
    
    @IBAction func test() {
         self.performSegue(withIdentifier: "showgragh", sender: nil)
}
}
