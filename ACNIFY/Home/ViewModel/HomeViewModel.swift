//
//  HomeViewModel.swift
//  ACNIFY
//
//  Created by Agus Budianto on 10/08/22.
//

import Foundation
import SwiftUI
import SwiftUICharts
import Combine

final class HomeViewModel: ObservableObject {
   
    @Published var currentUser: User?
    @Published var dayLog: AcneLog?
    @Published var nightLog: AcneLog?
    @Published var totalWeekSinceFirstLog = ""
    @Published var isNightProductCreated = false
    @Published var isDayProductCreated = false
    @Published var productUsedNightNames: [String] = []
    @Published var productUsedDayNames: [String] = []
    @Published var chartData: LineChartData = LineChartData(dataSets: LineDataSet(dataPoints: []))

    private let userRepository: UserRepository
    private let acneLogRepository: AcneLogRepository
    private let userProductRepository: UserProductRepository
    
    init(
        userRepository: UserRepository = UserDefaultRepository(),
        acneLogRepository: AcneLogRepository = AcneLogDefaultRepository(),
        userProductRepository: UserProductRepository = UserProductDefaultRepository()
    ){
        self.userRepository = userRepository
        self.acneLogRepository = acneLogRepository
        self.userProductRepository = userProductRepository
        let logedinUserID  = AuthenticationDefaultRepository.shared.userID
        
        self.dayLog = acneLogRepository.getDayAcneLogsByUserID(userID: logedinUserID!)
        self.nightLog = acneLogRepository.getNightAcneLogsByUserID(userID: logedinUserID!)
        self.currentUser = userRepository.getUserByID(id: logedinUserID!)
        
    }
    
    func getGraphicData() -> [Date:Int]?{
        guard let logs = self.acneLogRepository.getAcneLogsByUserID(userID: (currentUser?.id)!.uuidString) else {return nil}
        
        var data : [Date : Int] = [:]
        
        for log in logs {
            if log.condition == nil  || log.time == nil {
                continue
            }
            
            data[log.time!] = Int(logConditionToNumber(condition: log.condition!))
        }
        
        return data
    }
    
    func doDayChecklist(){
        guard dayLog == nil else {return}
        
        let acnelogData = AcneLogData()
        acnelogData.type = "day"
        acnelogData.userID = (currentUser?.id)!
        
        let newAcnelog = acneLogRepository.createNewAcneLog(data: acnelogData)
        
        userRepository.addNewAcneLog(id: (currentUser?.id)!.uuidString, acneLog: newAcnelog)
        acneLogRepository.addAcneLogUnlockProductsByUserID(userID: (currentUser?.id)!.uuidString, acneLog: newAcnelog)
        
        acneLogRepository.saveChanges()
        self.dayLog = newAcnelog
    }
    
    func doNightChecklist(){
        guard nightLog == nil else {return}
        
        let acnelogData = AcneLogData()
        acnelogData.type = "night"
        acnelogData.userID = UUID.init(uuidString: AuthenticationDefaultRepository.shared.userID!)
        
        let newAcnelog = acneLogRepository.createNewAcneLog(data: acnelogData)
        userRepository.addNewAcneLog(id: AuthenticationDefaultRepository.shared.userID!, acneLog: newAcnelog)
        acneLogRepository.addAcneLogUnlockProductsByUserID(userID: (currentUser?.id)!.uuidString, acneLog: newAcnelog)
        
        
        acneLogRepository.saveChanges()
        self.nightLog = newAcnelog
    }
    
    func getTotalWeekElapsed(){
        guard let userID = currentUser?.id?.uuidString else {return}
        let totalDaySinceFirstLog = acneLogRepository.getDayCountSinceFirstLog(userID: userID)
        
        if totalDaySinceFirstLog < 7 {
            totalWeekSinceFirstLog = "This is your first week journey"
        } else {
            totalWeekSinceFirstLog = "It's been \(totalDaySinceFirstLog / 7) weeks keep going!"
        }
    }
    
    func createNightProduct(){
        userProductRepository.createNightDefaultProduct(userID: AuthenticationDefaultRepository.shared.userID!)
    }
    
    func createDayProduct(){
        userProductRepository.createDayDefaultProduct(userID: AuthenticationDefaultRepository.shared.userID!)
    }
    
    
    func checkChecklistAvailablility(){
        let userProducts  = userProductRepository.getAllUsedUserProduct(userID: AuthenticationDefaultRepository.shared.userID!)

        
        if userProducts.filter({$0.routineType == UserProduct.dayRoutineType}).count > 0 {
            isDayProductCreated = true
        }
        
        if userProducts.filter({$0.routineType == UserProduct.nightRoutineType}).count > 0 {
            isNightProductCreated = true
        }
    }
    
 
    
    func getGraphLineData() {
        guard let logs = acneLogRepository.getAcneLogsByUserID(userID: AuthenticationDefaultRepository.shared.userID!) else {
            return
        }


        print(logs.count)
        var dataPoints: [LineChartDataPoint] = []
        dataPoints.append(LineChartDataPoint(value: 1, xAxisLabel: "M", description: "Monday"   ))

        for log in logs {
        
            if log.condition == nil {
                continue
            }
            
            let number = logConditionToNumber(condition: log.condition!)
            
            guard let firstitem  = dataPoints.first else {
                continue
            }
            
            if dataPoints.count == 1 {
                if number == firstitem .value{
                    continue
                }
                dataPoints.append(LineChartDataPoint(value: number, xAxisLabel: "M", description: "Monday"   ))
            }
            
            dataPoints.append(LineChartDataPoint(value: number, xAxisLabel: "M", description: "Monday"   ))

        }


        guard dataPoints.count != 0 else {
            return
        }

        let data = LineDataSet(dataPoints: dataPoints,
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
                                      xAxisLabels: [Int](0..<dataPoints.count).map{"W\($0+1)"},
                                      yAxisLabels: ["Bad", "Balance", "Great"],
                                      chartStyle: chartStyle)
        
        self.chartData = chartData
    }
    
    func getProductNameUsed(){
        let userProducts = userProductRepository.getAllUsedUserProduct(userID: AuthenticationDefaultRepository.shared.userID!)
        
        self.productUsedDayNames = userProducts.filter{$0.routineType == "day" && $0.isUsed && !$0.isLocked()}.map{
            let productId = Int($0.productDetailID)
            return UserProductDetail.getDefaultProduct().filter{$0.ID == productId}.first!.title
        }
       
        self.productUsedNightNames = userProducts.filter{$0.routineType == "night" && $0.isUsed && !$0.isLocked()}.map{
            let productId = Int($0.productDetailID)
            return UserProductDetail.getDefaultProduct().filter{$0.ID == productId}.first!.title
        }
       
    }

    private func logConditionToNumber(condition: String) -> Double {
        switch condition.lowercased(){
        case "better":
            return 3
        case "same":
            return 2
        case "worst":
            return 1
        case "firstcomer":
            return 2
        default:
            return 1
        }
    }
}



