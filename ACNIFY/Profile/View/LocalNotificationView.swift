//
//  LocalNotificationView.swift
//  ACNIFY
//
//  Created by Rahmat Maftuh Ihsan on 22/08/22.
//

import SwiftUI

struct LocalNotificationView: View {
    @State private var isMorningReminder = false
    @State private var isNightReminder = false
    
    var body: some View {
        NavigationView{
            VStack{
                Section{
                    Toggle("Morning Routine", isOn: $isMorningReminder)
                    Toggle("Night Routine", isOn: $isNightReminder)
                }
                .padding(.all)
               
                
            }
            .position(x: 195, y: 80)
            
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Reminder")
            .navigationBarItems(leading:
                                    HStack{
                Button(action: {
//                    presentation.wrappedValue.dismiss()
                }){
                   
                        Image (systemName: "chevron.backward")
                        .font(.system(size:22))
                        .foregroundColor(Color ("primaryGreen"))
                        
                       
                    
            
                }
                
            }
                                
            )
        }
    }
}

struct LocalNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        LocalNotificationView()
    }
}
