//
//  OnboardingItemView.swift
//  ACNIFY
//
//  Created by Agus Budianto on 02/08/22.
//

import SwiftUI

struct OnboardingItemView: View {
    var item: OnboardingViewModel.OnboardingItem
    var body: some View {
        VStack{
            Spacer()
            Image(item.ImageName)
                .padding()
            Text(item.Title.toMarkdown())
                .font(.title)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color("primaryGreen"))
                .frame(width: 350, alignment: .leading)
                .padding(.leading, 30)
                .padding(.bottom)
            
            Text(item.Subtitle)
                .frame(width: 350, alignment: .leading)
                .font(.title3)
                .padding(.leading, 30)
                        Spacer()
            
          
        }
    }
}

struct OnboardingItemView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = OnboardingViewModel()
        let item = vm.onboardingItems.first!
        OnboardingItemView(item: item)
    }
}
