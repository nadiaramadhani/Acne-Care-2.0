//
//  UpdateSkinView.swift
//  ACNIFY
//
//  Created by Local Administrator on 26/06/22.
//

import SwiftUI

struct UpdateSkinView: View {
    @State private var isPopUpPresented = false
    @State var updateSkinText = ""
    
    @Environment (\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var skins: FetchedResults<UpdateEntity>
    var emojiBetter = "😁"
    var emojiNormal = "🙂"
    var emojiWorst = "😔"
    
    
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 10, style: .circular)
                    .foregroundColor(Color("gray"))
                    .frame(width: 330, height: 450, alignment: .center)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("cream"),lineWidth: 1))
                //  .shadow(color: Color("brown").opacity(0.5), radius: 3)
                //                    .stroke(Color("cream"), lineWidth: 3)
                
                Image("update")
                    .position(x: 200, y: 100)
                
                VStack{
                    
                    Text("Let's Update Your Skin Progress!")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                    HStack{
                        VStack{
                            Text(emojiBetter)
                            Text("Better")
                                .font(.system(size: 16))
                        }
                        .onTapGesture {
                            addEmoji(savedEmoji: emojiBetter)
                            
                        }
                        .padding()
                        
                        VStack{
                            Text(emojiNormal)
                            Text("""
Nothing
happened
""")
                            .lineLimit(3)
                            .font(.system(size: 16))
                            .multilineTextAlignment(.center)
                        } .onTapGesture {
                            
                            addEmoji(savedEmoji: emojiNormal)
                            
                        }
                        
                        
                        .padding()
                        VStack{
                            Text(emojiWorst)
                            Text("Worst")
                                .font(.system(size: 16))
                        }
                        .onTapGesture {
                            addEmoji(savedEmoji: emojiWorst)
                        }
                        .padding()
                        
                        
                    }
                    
                    Text("Describe your skin")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .padding()
                    
                    TextField("Describe your skin progress", text: $updateSkinText)
                        .font(.system(size: 14))
                        .padding()
                        .frame(width: 280, height: 80, alignment: .leading)
                        .background(Color.white)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("cream"),lineWidth: 1))
                    
                    
                    
                    
                }
                
            }
            
            
            Button(action: {
                self.isPopUpPresented.toggle()
                addDesc()
                
            }) {
                Text("Finish")
                
            }
            .frame(width: 150, height: 50)
            .background(Color("primaryGreen"))
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(.bottom)
            // .padding(.top)
            
        }.background(Color("beige"))
            .popup(isPresented: isPopUpPresented, alignment: .center, direction: .top, content: CustomPopUp.init)
        
    }
    
    func addEmoji(savedEmoji : String) {
        let newUpdate = UpdateEntity(context: moc)
        
        newUpdate.emojiUpdate = savedEmoji
        
        try? moc.save()
        
    }
    
    func addDesc () {
        let newUpdate = UpdateEntity(context: moc)
        newUpdate.descUpdate = updateSkinText
        
        try? moc.save()
        
    }
    
   
    
}

struct UpdateSkinView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateSkinView()
    }
}
