//
//  SummaryViewModel.swift
//  ACNIFY
//
//  Created by Agus Budianto on 23/08/22.
//

import Foundation
import SwiftUI
import SwiftUICharts

final class SummaryViewModel: ObservableObject, GraphProviderAble {
    func getGraphLineData() -> LineChartData {
        let data = LineDataSet(dataPoints: [
            LineChartDataPoint(value: 1, xAxisLabel: "W1", description: "Monday" ),
            LineChartDataPoint(value: 2, xAxisLabel: "W2", description: "Tuesday"  ),
            LineChartDataPoint(value: 3 , xAxisLabel: "W3", description: "Wednesday"),
            LineChartDataPoint(value: 3 , xAxisLabel: "W3", description: "Wednesday"),
            LineChartDataPoint(value: 3 , xAxisLabel: "W3", description: "Wednesday"),
            
        ],
                               legendTitle: "Acne Conditions",
                               pointStyle: PointStyle(),
                               style: LineStyle(lineColour: ColourStyle(colour: Color(hex: "#006255")), lineType: .line))
        
        let gridStyle = GridStyle(numberOfLines: 3,
                                  lineColour   : Color(.lightGray).opacity(0.5),
                                  lineWidth    : 1,
                                  dash         : [10],
                                  dashPhase    : 2)
        
     
        
        
        
        let chartStyle = LineChartStyle(infoBoxPlacement    : .infoBox(isStatic: false),
                                        infoBoxContentAlignment: .vertical,
                                        infoBoxBorderColour : Color.primary,
                                        infoBoxBorderStyle  : StrokeStyle(lineWidth: 1),
                                        markerType: .vertical(attachment: .line(dot: .style(DotStyle()))),
                                        xAxisLabelColour    : Color(hex: "#757575"),
                                        xAxisLabelsFrom: .chartData(rotation: .degrees(0)),
                                        yAxisGridStyle      : gridStyle, yAxisLabelPosition  : .trailing,
                                        yAxisLabelColour    : Color(hex: "#006255"), yAxisNumberOfLabels : 3,
                                        yAxisLabelType: .custom,
                                        globalAnimation     : .easeOut(duration: 1))
        
        
        
        let chartData = LineChartData(dataSets: data,
                                      metadata: ChartMetadata(title: "Your acne", subtitle: "A Week"),
                                      xAxisLabels: ["W1", "W2", "W3", "W4"],
                                      yAxisLabels: ["Bad", "Balance", "Great"],
                                      chartStyle: chartStyle)
        
        
        return chartData
    }
}
