//
//  SetReminderView.swift
//  ACNIFY
//
//  Created by Local Administrator on 22/08/22.
//

import SwiftUI

struct SetReminderView: View {
    @State var isMorningOn: Bool = false
    @State var isNightOn: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @State var isMorningSheet: Bool = false
    @State var isNightSheet: Bool = false
    @State var selectedHourMorning: Date = Date()
    @State var selectedHourNight: Date = Date()
    @EnvironmentObject var lnManagerMorning: LocalNotificationManagerMorning
    @Environment(\.scenePhase) var scenePhase
    
    
    var body: some View {
        List{
            Toggle(isOn: $isMorningOn) {
                VStack(alignment: .leading){
                    Text("Morning Routine")
                        .font(.body)
                    Text("\(selectedHourMorning.formatted())")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .onTapGesture {
                    isMorningSheet.toggle()
                }
            }
            
            .sheet(isPresented: $isMorningSheet) {
                
            } content: {
                NavigationView{
                    ReminderPicker(selectedHour: $selectedHourMorning)
                        .navigationBarItems( trailing:
                                                HStack{
                            
                            if lnManagerMorning.isGranted {
                                Button(action: {
                                    Task{
                                        
                                        let dateComponents = Calendar.current.dateComponents([ .hour, .minute], from: selectedHourMorning)
                                        let localNotificationMorning = LocalNotificationMorning(identifier: UUID().uuidString,
                                                                                                title: "Morning Routine Reminder",
                                                                                                body: "Don't forget to do treatment and checklist!",
                                                                                                dateComponents: dateComponents,
                                                                                                repeats: true)
                                        await lnManagerMorning.schedule(localNotificationMorning: localNotificationMorning)
                                        
                                        
                                    }
                                    isMorningSheet.toggle()
                                    
                                }, label: {
                                    Text("Save")
                                        .foregroundColor(Color("primaryGreen"))
                                    
                                })
                            }else {
                                
                            }
                            
                            
                        }
                            .environmentObject(lnManagerMorning)
                                             
                        )
                    
                        .navigationBarTitle("Reminder")
                        .navigationBarTitleDisplayMode(.inline)
                    
                }
                
            }
            
            
            
            Toggle(isOn: $isNightOn) {
                VStack(alignment: .leading){
                    Text("Night Routine")
                        .font(.body)
                    Text("\(selectedHourNight.formatted())")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .onTapGesture {
                    isNightSheet.toggle()
                }
            
                
            }
            .sheet(isPresented: $isNightSheet) {
                
            } content: {
                NavigationView{
                    ReminderPicker(selectedHour: $selectedHourNight)
                        .navigationBarItems( trailing:
                                                HStack{
                            
                            if lnManagerMorning.isGranted {
                                Button(action: {
                                    Task{
                                        
                                        let dateComponents = Calendar.current.dateComponents([ .hour, .minute], from: selectedHourNight)
                                        let localNotificationMorning = LocalNotificationMorning(identifier: UUID().uuidString,
                                                                                                title: "Night Routine Reminder",
                                                                                                body: "Don't forget to do treatment and checklist!",
                                                                                                dateComponents: dateComponents,
                                                                                                repeats: true)
                                        await lnManagerMorning.schedule(localNotificationMorning: localNotificationMorning)
                                        
                                        
                                    }
                                    isNightSheet.toggle()
                                    
                                }, label: {
                                    Text("Save")
                                        .foregroundColor(Color("primaryGreen"))
                                    
                                })
                            }else {
                                
                            }
                            
                            
                        }
                            .environmentObject(lnManagerMorning)
                                             
                        )
                    
                        .navigationBarTitle("Reminder")
                        .navigationBarTitleDisplayMode(.inline)
                    
                }
                
            }
            
            
            
        }.navigationTitle("Reminder")
            .task{
                try? await lnManagerMorning.requestAuthorization()
            }
            .onChange(of: scenePhase){newValue in
                if newValue == .active{
                    Task {
                        await lnManagerMorning.getCurrentSettings()
                        // await lnManager.getPendingRequests()
                    }
                }
            }
        
    }
}


struct ReminderPicker: View{
    @Binding var selectedHour : Date
    var body: some View{
        VStack{
        DatePicker("Choose reminder", selection: $selectedHour, displayedComponents: .hourAndMinute)
            .padding()
            Spacer()
            
        }
    }
}
//
//struct SetReminderView_Previews: PreviewProvider {
//    @State var selectedHourMorning: Date
//    static var previews: some View {
//        SetReminderView(selectedHourMorning: .now)
//    }
//}
