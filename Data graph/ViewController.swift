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
      var resultnumbers: Results<Record>!
      var datenumbers: Results<Record>!
    var categorynames: Results<Category>!
       let realm = try! Realm()
    
          override func viewDidLoad() {
            super.viewDidLoad()
            resultnumbers = realm.objects(Record.self)
            datenumbers = realm.objects(Record.self)
            
            setChart(valuesX: datenumbers, valuesY: resultnumbers)//Setchartにデータを代入　valuesにy軸のデータが入る
      }
       
    func setChart(valuesX: [String] ,valuesY: [Double] ) { //引数にvaluesという名前のdoublu型の配列を設定する
              var entry = [ChartDataEntry]() //グラフ作成
              for i in 0..<valuesX.count {
                  entry.append(ChartDataEntry(x: valuesX[i], y: valuesY[i] )) //プロットした点に数値を表示
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
