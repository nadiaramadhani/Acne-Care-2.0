//
//  ComparingSkinView.swift
//  ACNIFY
//
//  Created by Rahmat Maftuh Ihsan on 22/08/22.
//

import SwiftUI

struct ComparingSkinView: View {
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                Text("Compare Image")
                    
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .foregroundColor(Color("primaryGreen"))
                
                Spacer()
                    .frame(height:16)
                
                HStack{
                    VStack{
                        Image("GirlExample")
                            .resizable()
                            .frame(width: 159, height: 240)
                        
                        Text("15 July 2022")
                            .font(.system(size: 17))
                            .fontWeight(.semibold)
                            .foregroundColor(Color("primaryGreen"))

                    }
                    VStack{
                        Image("GirlExample")
                            .resizable()
                            .frame(width: 159, height: 240)
                        
                        Text("15 July 2022")
                            .font(.system(size: 17))
                            .fontWeight(.semibold)
                            .foregroundColor(Color("primaryGreen"))

                    }
                }
            }
            .position(x: 195, y: 160)
            .navigationBarHidden(true)
         
            Spacer()
            
        }
    }
}

struct ComparingSkinView_Previews: PreviewProvider {
    static var previews: some View {
        ComparingSkinView()
    }
}
