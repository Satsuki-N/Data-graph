//
//  ViewController.swift
//  Data graph
//
//  Created by satsuki nakai on 2020/06/06.
//  Copyright © 2020 satsuki nakai. All rights reserved.
//

import UIKit
import RealmSwift
import Charts

class ViewController: UIViewController {
    
       @IBOutlet weak var chartView: LineChartView!
//    var resultnumbers: [Float] = []
//    var datenumbers: [String] = []
      var resultnumbers: List<Record>!
     // var datenumbers: Results<Record>!
    var categoryItemes: Results<Category>!
       let realm = try! Realm()
    var categoryNumber: Int!
    
          override func viewDidLoad() {
            super.viewDidLoad()
//            resultnumbers = realm.objects(Record.self)
//            datenumbers = realm.objects(Record.self)
            categoryItemes = realm.objects(Category.self)
            resultnumbers = categoryItemes[categoryNumber].records
            print(resultnumbers[0].resultnumber)
            
            
            let sales:[Double] = [1,2,3]
            setChart(values: sales)//Setchartにデータを代入　valuesにy軸のデータが入る
      }
      
    func setChart(values: [Double] ) { //引数にvaluesという名前のdoublu型の配列を設定する
              var entry = [ChartDataEntry]() //グラフ作成
              for i in 0..<values.count {
                  entry.append(ChartDataEntry(x: Double(i), y: values[i] )) //プロットした点に数値を表示
              }  //valuesXのi番目の数をxに代入する、valuesYのi番目の数をyに代入する
       
            let dataSet = LineChartDataSet(entries: entry, label: "a")
              chartView.data = LineChartData(dataSet: dataSet) // グラフに点をプロット
          }
       
          override func didReceiveMemoryWarning() {
              super.didReceiveMemoryWarning() //グラフの形を形成
              // Dispose of any resources that can be recreated.
          }
    
    @IBAction func adddata() {
        self.performSegue(withIdentifier: "adddata", sender: nil) //グラフに表示するデータの追加
    }

    
}
