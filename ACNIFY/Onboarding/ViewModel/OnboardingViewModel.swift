//
//  OoboardingViewModel.swift
//  ACNIFY
//
//  Created by Agus Budianto on 02/08/22.
//

import Foundation
import SwiftUI

final class OnboardingViewModel: ObservableObject {
    @Published var tabIndex: Int = 0
    @Published var onboardingItems: [OnboardingItem]
    
    init(){
        onboardingItems = [
            OnboardingViewModel.OnboardingItem(
                Title: "**Daily Progress of The Treatment**",
                Subtitle: "Have a better understanding of your skin condition to find suitable product",
                ImageName: "firstOnboard"
            ),
            OnboardingViewModel.OnboardingItem(
                Title: "**Check the suitable ingredients**",
                Subtitle: "Get to know your acne with its characteristics and recommendation ingredients that suitable for you",
                ImageName: "secondOnboard"
            ),
            OnboardingViewModel.OnboardingItem(
                Title: "**Daily Progress of The Treatment**",
                Subtitle: "Track and trace your daily treatment progress to maintain the skin condition",
                ImageName: "thirdOnboard"
            ),
        ]
    }
}


extension OnboardingViewModel{
    public struct OnboardingItem {
         var Title: String = ""
         var Subtitle: String = ""
         var ImageName: String = ""
    }
    
    public func markAsFirstTimeUser(){
        UserDefaults.standard.set(false, forKey: "FirstTimeUser")
    }
    
}
