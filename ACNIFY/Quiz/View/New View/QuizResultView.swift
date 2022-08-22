//
//  QuizResultView.swift
//  ACNIFY
//
//  Created by Local Administrator on 22/08/22.
//

import SwiftUI

struct QuizResultView: View {
   
    var body: some View {
        ZStack{
              
            Image("womanOily")
                .padding(.bottom, 300)
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white)
                    .frame(width: 390, height: 479)
                    .shadow(color: .gray, radius: 2)
                   
//
                VStack{
                TabView{
                    SkinResulView()
                        .tag(0)
                    
                    AcneResultView()
                        .tag(1)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .onAppear{
                    setupAppearance()
                }
                
                    
                    Text("*Take your first photo to compare later")
                        .font(.system(size: 13))
                        .italic()
                Button {
                    
                } label: {
                    Text("Take Photo")
                        .fontWeight(.semibold)
                }
                .foregroundColor(Color.white)
                .frame(width: 325, height: 50)
                .background(Color("yellow"))
                .cornerRadius(12)
                    
                Button {
                    
                } label: {
                    Text("Not Now")
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black)
                }
                .cornerRadius(12)
                .frame(width: 325, height: 50)
                .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color("yellow"), lineWidth: 2)
                        )
                .padding(.bottom)
                


                
                
                }
            }
            .padding(.top, 350)
        }
    }
    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .orange
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
      }
}

struct SkinResulView: View {
    var skinType: String = "Oily"
    var skinResult: String = "Oily skin may has enlarged pores, dull or shiny, thick complexion, blackheads, pimples, or other blemishes. Oiliness can change depending upon the time of year or the weather. Things that can cause or worsen it include, puberty or other hormonal imbalances, stress, heat or too much humidity"
    
    var sources: String = "dr. Firman (dermatologist)"
    var body: some View {
        VStack{
            Text("Your Skin Type: \(skinType)")
                .font(.title)
                .foregroundColor(Color("primaryGreen"))
                .bold()
            
            Text("\(skinResult)")
                .multilineTextAlignment(.center)
                .frame(width: 342, height: 154)
            
            Text("\(sources)")
                .font(.system(size: 13))
                .foregroundColor(Color("primaryGreen"))
                .italic()
            
        }
    }
}


struct AcneResultView: View {
    var acneSeverity: String = "Mild"
    var acneDesc: String = "Mild acne mostly whiteheads and blackheads, with a few papules and pustules"
    
    var body: some View {
        VStack{
            Text("Acne Severity: \(acneSeverity)")
                .font(.title)
                .foregroundColor(Color("primaryGreen"))
                .bold()
            
            
            Text("\(acneDesc)")
                .multilineTextAlignment(.center)
                .frame(width: 342, height: 154)
            
            Text("dr. Firman (dermatologist)")
                .font(.system(size: 13))
                .foregroundColor(Color("primaryGreen"))
                .italic()
        }
        
    }
}

struct QuizResultView_Previews: PreviewProvider {
    static var previews: some View {
        QuizResultView()
    }
}
