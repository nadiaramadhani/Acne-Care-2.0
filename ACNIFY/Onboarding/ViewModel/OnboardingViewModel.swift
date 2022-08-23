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
                Title: "**Identify your skin condition**",
                Subtitle: "Understand your skin and your acne. So you know what to do next",
                ImageName: "firstOnboard"
            ),
            OnboardingViewModel.OnboardingItem(
                Title: "**Acne treatment routine**",
                Subtitle: "Create your skincare commitment, find the most suitable products, and stay consistence with Acne Care",
                ImageName: "secondOnboard"
            ),
            OnboardingViewModel.OnboardingItem(
                Title: "**Healing process**",
                Subtitle: "No matter how small it is, check your progress and stay motivated",
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
