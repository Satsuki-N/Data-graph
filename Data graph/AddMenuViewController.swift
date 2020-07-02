//
//  AddMenuViewController.swift
//  Data graph
//
//  Created by satsuki nakai on 2020/06/11.
//  Copyright © 2020 satsuki nakai. All rights reserved.
//

import UIKit

class AddMenuViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    let categorylist = ["時間","点数"]
    var selectedrow : Int!
    
    @IBOutlet weak var categorytextField: UITextField!
    
    var categoryPickerView:UIPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryPickerView.delegate = self
        categoryPickerView.dataSource = self
        
        let toolbar = UIToolbar(frame: CGRectMake(0, 0, 0, 35))
               let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(AddMenuViewController.done))
               let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(AddMenuViewController.cancel))
               toolbar.setItems([cancelItem, doneItem], animated: true)
               
               
               self.categorytextField.inputView = categoryPickerView
               self.categorytextField.inputAccessoryView = toolbar
    }
    
      func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return categorylist.count
        }
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
            return pickerView.bounds.width * 1/4
        }
        
        func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView
        {
            let pickerLabel = UILabel()
            pickerLabel.textAlignment = NSTextAlignment.left
            pickerLabel.text = String(categorylist[row])
            selectedrow = row
            return pickerLabel
        }
    
    @objc func cancel() {
               self.categorytextField.text = ""
               self.categorytextField.endEditing(true)
           }
    
    @objc func done() {
        self.categorytextField.text = String(categorylist[selectedrow])
               self.categorytextField.endEditing(true)
           }
    
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
              return CGRect(x: x, y: y, width: width, height: height)
          }

   

}
