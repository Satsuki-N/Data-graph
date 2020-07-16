//
//  AddDataViewController.swift
//  Data graph
//
//  Created by satsuki nakai on 2020/06/11.
//  Copyright © 2020 satsuki nakai. All rights reserved.
//

import UIKit
import RealmSwift

class AddDataViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate {
    
    let datalist = [[Int](2000...2030),[Int](1...12),[Int](1...31)]
    
    @IBOutlet weak var datetextField: UITextField!
    @IBOutlet weak var recordtextField: UITextField!
    var inputYear: Int = 0  //入力した日付　（年）
    var inputMonth: Int = 0 //入力した日付　（月）
    var inputDay: Int = 0   //入力した日付　（日）
    var datePickerView: UIPickerView = UIPickerView()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePickerView.delegate = self
        datePickerView.dataSource = self
        setPickerViewUnitLabel()
        
        let toolbar = UIToolbar(frame: CGRectMake(0, 0, 0, 35))
               let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(AddDataViewController.done))
               let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(AddDataViewController.cancel))
               toolbar.setItems([cancelItem, doneItem], animated: true)
               
               self.datetextField.inputView = datePickerView
               self.datetextField.inputAccessoryView = toolbar
        recordtextField.delegate = self
    }
    
     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return datalist[component].count
    }
      
      func numberOfComponents(in pickerView: UIPickerView) -> Int {
          return datalist.count
      }

      func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
          return pickerView.bounds.width * 1/4
      }
      
      func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView
      {
          let pickerLabel = UILabel()
          pickerLabel.textAlignment = NSTextAlignment.left
          pickerLabel.text = String(datalist[component][row])
          return pickerLabel
          
      }
    
    //PickerView内のラベルの位置
    private func setPickerViewUnitLabel() {
          //「時間」のラベルを追加
          let yStr = UILabel()
          yStr.text = "年"
          yStr.sizeToFit()
          yStr.frame = CGRect(x:datePickerView.bounds.width*5/13 - (yStr.bounds.width) - 20,
                              y:datePickerView.bounds.height/2 - (yStr.bounds.height/2),
                              width:yStr.bounds.width, height:yStr.bounds.height)
          datePickerView.addSubview(yStr)
          
          //「分」をラベルに追加
          let mStr = UILabel()
          mStr.text = "月"
          mStr.sizeToFit()
          mStr.frame = CGRect(x:datePickerView.bounds.width*2/3 - (mStr.bounds.width) - 20,
                              y:datePickerView.bounds.height/2 - (mStr.bounds.height/2),
                              width:mStr.bounds.width, height:mStr.bounds.height)
          datePickerView.addSubview(mStr)
          
          //「秒」をラベルに追加
          let dStr = UILabel()
          dStr.text = "日"
          dStr.sizeToFit()
          dStr.frame = CGRect(x:datePickerView.bounds.width - (dStr.bounds.width) - 20,
                              y:datePickerView.bounds.height/2 - (dStr.bounds.height/2),
                              width:dStr.bounds.width, height:dStr.bounds.height)
          datePickerView.addSubview(dStr)
      }
    
    @objc func cancel() {
               self.datetextField.text = ""
               self.datetextField.endEditing(true)
           }
    
    @objc func done() {
               self.datetextField.endEditing(true)
               self.datetextField.text = String(datalist[0][datePickerView.selectedRow(inComponent: 0)]) + "年"+String(datalist[1][datePickerView.selectedRow(inComponent: 1)]) + "月"+String(datalist[2][datePickerView.selectedRow(inComponent: 2)]) + "日"
               if datePickerView.selectedRow(inComponent: 0) == -1 {
                   inputYear = 0
               } else {
               inputYear = datalist[0][datePickerView.selectedRow(inComponent: 0)]
               }
               if datePickerView.selectedRow(inComponent: 1) == -1{
                   inputMonth = 0
               } else {
               inputMonth = datalist[1][datePickerView.selectedRow(inComponent: 1)]
               }
               if datePickerView.selectedRow(inComponent: 2) == -1{
                   inputDay = 0
               } else {
                   inputDay = datalist[2][datePickerView.selectedRow(inComponent: 2)]
               }
       
           }
    
    func textFieldShouldReturn(_ textField : UITextField) -> Bool {
        textField.resignFirstResponder()
        recordtextField.text = textField.text
        return true
    }
    
    
    
    

    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
           return CGRect(x: x, y: y, width: width, height: height)
    }
    
    @IBAction func save() {
        if recordtextField.text?.isEmpty == true{
                   // アラート
               }else{
                   // オブジェクトの作成
                   let record = Record() // Recordクラスのインスタンス
                   let realm = try! Realm() // Realmデータベースのインスタンス
                   
                   record.y = Float(recordtextField.text!) // RecordクラスのタイトルプロパティにtitleField.text!を代入
                   record.x = datetextField.text! //  RecordクラスのコンテンツプロパティにcontentView.textを代入
                   
                   try! realm.write{
                       realm.add(record) // realmデータベースにRecordクラスの変更を送信
                   }
            print(Record())
    }
    

}
}
