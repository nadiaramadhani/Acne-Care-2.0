//
//  LineChartDemoView.swift
//  SwiftUICharts Demo
//
//  Created by Will Dale on 23/01/2021.
//

import SwiftUI
import SwiftUICharts
import Combine

struct LineChartDemoView: View {
    
    @Binding var data: LineChartData
    
    var body: some View {
        LineChart(chartData: data)
            .pointMarkers(chartData: data)
            .yAxisGrid(chartData: data)

            .xAxisLabels(chartData: data)
        
        
            .yAxisLabels(chartData: data,
                         formatter: numberFormatter,
                         colourIndicator: .style(size: 12))
           
    }
    
    private var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.generatesDecimalNumbers = true
        formatter.numberStyle = .none
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    
    
}

