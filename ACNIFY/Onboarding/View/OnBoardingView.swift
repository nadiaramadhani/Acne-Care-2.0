//
//  ContentView.swift
//  ACNIFY
//
//  Created by Local Administrator on 22/06/22.
//

import SwiftUI
//import CoreData

struct OnBoardingView: View {
    
    //onboarding states:
    /*
     0 = welcome screen
     1= first onboarding
     2 = second onboarding
     3 = third onboarding
     */
    
    @ObservedObject var viewModel = OnboardingViewModel()    
    //username input
  
    
    init() {
           UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color("primaryGreen"))
           UIPageControl.appearance().pageIndicatorTintColor = UIColor(Color("primaryGreen")).withAlphaComponent(0.2)
           
    }
    
    var body: some View {
        
        ZStack{
            VStack{
                Button(action:{
                    UserDefaults.standard.set(false, forKey: "FirstTimeUser")
                    
                }){
                    HStack{
                    Spacer()
                    Text("Skip")
                        .foregroundColor(Color("primaryGreen"))
                        .padding(.horizontal, 20)
                    }

                }
                TabView(selection: $viewModel.tabIndex){
                    ForEach(0..<viewModel.onboardingItems.count) { index in
                        OnboardingItemView(item: viewModel.onboardingItems[index]).tag(index)
                    }
                } .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    .onAppear{
                        print(viewModel.tabIndex)
                    }
                
                if viewModel.tabIndex == (viewModel.onboardingItems.count - 1) {
                    bottomButton
                }else{
                    bottomButton.frame(width: 0, height: 0)
                }
                    
            }
         
            Spacer()
        }
        
    }
}


struct UserInputView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}

//MARK: COMPONENTS

extension OnBoardingView{
    private  var bottomButton: some View {
        BottomButtonView(buttonText: "Start")
        .onTapGesture {
            viewModel.markAsFirstTimeUser()
        }
    }
}

