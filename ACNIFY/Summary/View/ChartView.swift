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
    
    let data: LineChartData = weekOfData()
    
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
    
    
    static func weekOfData() -> LineChartData {
        let data = LineDataSet(dataPoints: [
            LineChartDataPoint(value: 1, xAxisLabel: "W1", description: "Monday" ),
            LineChartDataPoint(value: 2, xAxisLabel: "W2", description: "Tuesday"  ),
            LineChartDataPoint(value: 2 , xAxisLabel: "W3", description: "Wednesday"),
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

struct LineChartView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartDemoView()
    }
}

extension Color {
    public static var myBackground: Color {
#if os(iOS)
        return Color(.systemBackground)
#elseif os(tvOS)
        return Color(.darkGray)
#elseif os(macOS)
        return Color(.windowBackgroundColor)
#endif
    }
}




import LinkPresentation

//This code is from https://gist.github.com/tsuzukihashi/d08fce005a8d892741f4cf965533bd56
struct ShareSheet: UIViewControllerRepresentable {
    let photo: UIImage
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let activityItems: [Any] = [photo]
        return UIActivityViewController(
            activityItems: activityItems,
            applicationActivities: nil
        )
    }
    
    func updateUIViewController(_ vc: UIActivityViewController, context: Context) {
        
    }
}
