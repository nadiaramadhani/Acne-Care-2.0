//
//  Rahmat9.swift
//  ACNIFY
//
//  Created by Rahmat Maftuh Ihsan on 29/06/22.
//

//
//  Rahmat8.swift
//  ACNIFY
//
//  Created by Rahmat Maftuh Ihsan on 29/06/22.
//
import SwiftUI

struct HistoryView: View {
    @Environment(\.presentationMode) var presentation

    
    var body: some View {
        NavigationView {
            
            
            VStack {
                HStack{
                Text("July 2022")
                    Spacer()
                }.padding()
                HStack{
                    Image("Image")
                        .resizable()
                        .frame(width: 127, height: 147)
                    Image("Image")
                        .resizable()
                        .frame(width: 127, height: 147)
                    Image("Image")
                        .resizable()
                        .frame(width: 127, height: 147)


                }.padding(.leading)
                HStack{
                    Image("Image")
                        .resizable()
                        .frame(width: 127, height: 147)
                    Image("Image")
                        .resizable()
                        .frame(width: 127, height: 147)
                    Image("Image")
                        .resizable()
                        .frame(width: 127, height: 147)


                }.padding(.leading)
                HStack{
                    Text("June 2022")
                    Spacer()
                }.padding()
                HStack{
                    Image("Image")
                        .resizable()
                        .frame(width: 127, height: 147)
                    Image("Image")
                        .resizable()
                        .frame(width: 127, height: 147)
                    Image("Image")
                        .resizable()
                        .frame(width: 127, height: 147)


                }.padding(.leading)
                HStack{
                    Image("Image")
                        .resizable()
                        .frame(width: 127, height: 147)
                    Image("Image")
                        .resizable()
                        .frame(width: 127, height: 147)
                    Image("Image")
                        .resizable()
                        .frame(width: 127, height: 147)


                }.padding(.leading)
                
            }.navigationTitle("My Acne Journey")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing:
                                        Button(action: {
                    self.presentation.wrappedValue.dismiss()
                }) {
                    Text("Done")
                    //.fontWeight(.bold)
                        .foregroundColor(Color("primaryGreen"))
                }
                )
                
    }
}
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
        
    }
}
