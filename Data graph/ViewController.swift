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
       
    
          override func viewDidLoad() {
            super.viewDidLoad()
            let sales = [3205.0, 3120.0, 3424.0, 3544.0, 3312.0, 3612.0, 3594.0, 3648.0, 3845.0, 3585.0, 3917.0, 4014.0]
            setChart(values: sales)
      }
    
    @IBAction func adddata() {
        self.performSegue(withIdentifier: "adddata", sender: nil)
    }
       
          func setChart(values: [Double]) {
              var entry = [ChartDataEntry]()
       
              for i in 0..<values.count {
                  entry.append(ChartDataEntry(x: Double(i), y: values[i] ))
              }
       
            let dataSet = LineChartDataSet(entries: entry, label: "2018年売上推移（百万）")
              chartView.data = LineChartData(dataSet: dataSet)
          }
       
          override func didReceiveMemoryWarning() {
              super.didReceiveMemoryWarning()
              // Dispose of any resources that can be recreated.
          }
    
}
