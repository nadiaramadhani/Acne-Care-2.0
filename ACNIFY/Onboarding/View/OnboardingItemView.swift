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
                .padding(.all)
            
            
            Text(item.Title.toMarkdown())
                .font(.title)
                .foregroundColor(Color("primaryGreen"))
                .frame(width: 350, alignment: .leading)
                .multilineTextAlignment(.leading)
                .padding(.leading)
                .padding(.bottom)
            
            Text(item.Subtitle)
                .frame(width: 345, alignment: .leading)
                .font(.headline)
                .padding(.leading)
            
            Spacer()
            
          
        }
//        .frame(width: 353, height: 443)
    }
}

struct OnboardingItemView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = OnboardingViewModel()
        let item = vm.onboardingItems.first!
        OnboardingItemView(item: item)
    }
}
