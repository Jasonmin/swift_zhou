//
//  ChartViewController.swift
//  swift_zhou
//
//  Created by taiji_zq on 2019/5/17.
//  Copyright © 2019 taiji_zq. All rights reserved.
//

import UIKit
import Charts

class ChartViewController: UIViewController,ChartViewDelegate {
    
    var chartView:LineChartView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let classString = NSStringFromClass(type(of: self))
        let vcName = classString.components(separatedBy: ".").last
        title = vcName!
        view.backgroundColor = UIColor.white
        
        showLineChart()
        setChart(dataPoints: ["A","B","C"], values: [2.0,4.0,3.0])
    }
    
    func showLineChart() {
        
        chartView = LineChartView.init(frame: CGRect(x: 0, y: 100, width: view.bounds.size.width, height: 200))
        chartView.delegate = self
        chartView.backgroundColor = UIColor.lightGray
        view.addSubview(chartView)
    }
    
    // 加上模拟数据
    func setChart(dataPoints: [String], values: [Double]) {
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(x: values[i], y: Double(i))
            dataEntries.append(dataEntry)
        }
        let chartDataSet = LineChartDataSet(entries: dataEntries, label: "Units Sold")
//        let chartData = LineChartData(xVals: mount_t, dataSet: chartDataSet)
        let chartData = LineChartData(dataSet: chartDataSet)
        // 加上一个界限, 演示图中红色的线
        let jx = ChartLimitLine(limit: 12.0, label: "I am LimitLine")
        chartView.rightAxis.addLimitLine(jx)
        chartView.data = chartData
        // 自定义颜色
        // colors 是一个数组, 可以给相应的颜色
        chartDataSet.colors = [UIColor.red]
        chartDataSet.colors = ChartColorTemplates.colorful()
        chartView.animate(yAxisDuration: 1.0, easingOption: .easeInBounce)
    }

}
