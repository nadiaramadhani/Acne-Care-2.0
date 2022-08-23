//
//  GraphProviderAble.swift
//  ACNIFY
//
//  Created by Agus Budianto on 23/08/22.
//

import Foundation
import SwiftUI
import SwiftUICharts

protocol GraphProviderAble{
    func getGraphLineData()-> LineChartData
}
