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
    @IBOutlet weak var titleItem: UINavigationItem!
    var resultnumbers: List<Record>!
    var categoryItemes: Results<Category>!
    let realm = try! Realm()
    var categoryNumber: Int = 0
    var categoryItem: Category!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        var valueArray:[Double] = []
        categoryItemes = realm.objects(Category.self)
        categoryItem = categoryItemes[categoryNumber]
        resultnumbers = categoryItem.records
        
        if resultnumbers.count == 0 {
            
        } else if resultnumbers.count == 1 {
            valueArray.append(resultnumbers[0].resultnumber)
            setChart(values: valueArray)//Setchartにデータを代入　valuesにy軸のデータが入る
        } else {
            for i in 0 ... resultnumbers.count - 1 {
                valueArray.append(resultnumbers[i].resultnumber)
            }
            setChart(values: valueArray)//Setchartにデータを代入　valuesにy軸のデータが入る
        }
        titleItem.title = categoryItem.categorytitle
        chartView.xAxis.labelCount = valueArray.count
        print(valueArray.count)
    }
    
    func setChart(values: [Double] ) { //引数にvaluesという名前のdoublu型の配列を設定する
        var entry = [ChartDataEntry]() //グラフ作成
        if values.count == 1{
            entry.append(ChartDataEntry(x: Double(1), y: values[0] )) //プロットした点に数値を表示
        }else{
            for i in 0..<values.count - 1 {
                entry.append(ChartDataEntry(x: Double(i+1), y: values[i] )) //プロットした点に数値を表示
            }
        }
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "adddata"{
            let nextVC: AddDataViewController = segue.destination as! AddDataViewController
            nextVC.category = categoryItem
        }
    }
    
    
}
