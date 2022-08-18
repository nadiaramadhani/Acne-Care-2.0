//
//  PhotoAndUpdateView.swift
//  ACNIFY
//
//  Created by Local Administrator on 16/08/22.
//

import SwiftUI

struct PhotoAndUpdateView: View {
    
    @State var description : String = ""
    @Environment (\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var skins: FetchedResults<UpdateEntity>
    
    var emojiBetter : String = "😁"
    var emojiNormal : String = "🙂"
    var emojiWorst : String = "🙁"
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                Text("Let's Update Your Skin")
                    .foregroundColor(Color("primaryGreen"))
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                Text("Rate your skin condition with the first time you used the app")
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                
            }
            .padding()
            VStack{
            Text("What was your skin like?")
                .fontWeight(.bold)
                .padding(.trailing, 150)
            HStack{
                VStack{
                    Text(emojiBetter)
                        .font(.system(size: 40))
                    Text("Better")
                        .font(.system(size: 16))
                }
                .padding(.horizontal)
                .onTapGesture {
                    addEmoji(savedEmoji: emojiBetter)
                    
                }
                
                VStack{
                    Text(emojiNormal)
                        .font(.system(size: 40))
                    Text("Same")
                        .font(.system(size: 16))
                }
                .padding(.horizontal)
                .onTapGesture {
                    addEmoji(savedEmoji: emojiNormal)
                }
                VStack{
                    Text(emojiWorst)
                        .font(.system(size: 40))
                    Text("Worst")
                        .font(.system(size: 16))
                }
                .padding(.horizontal)
                .onTapGesture {
                    addEmoji(savedEmoji: emojiWorst)
                }
                
                
            }
            .padding(.trailing, 100)
            }
            VStack(alignment: .leading){
                Text("Quick Answer")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                HStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 133, height: 40)
                            .foregroundColor(.white)
                            .shadow(color: .gray, radius: 1)
                        Text("Acne was gone")
                            .font(.system(size: 16))
                    }
                    .onTapGesture {
                        
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 173, height: 40)
                            .foregroundColor(.white)
                            .shadow(color: .gray, radius: 1)
                        Text("My face get drier")
                            .font(.system(size: 16))
                    }
                }
                .onTapGesture {
                    
                }
                HStack{
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 69, height: 40)
                            .foregroundColor(.white)
                            .shadow(color: .gray, radius: 1)
                        Text("Streak")
                            .font(.system(size: 16))
                    }
                    .onTapGesture {
                        
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 147, height: 40)
                            .foregroundColor(.white)
                            .shadow(color: .gray, radius: 1)
                        Text("A pimple appears")
                            .font(.system(size: 16))
                    }
                    .onTapGesture {
                        
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 100, height: 40)
                            .foregroundColor(.white)
                            .shadow(color: .gray, radius: 1)
                        Text("Red pimple")
                            .font(.system(size: 16))
                    }
                    .onTapGesture {
                        
                    }
                    
                }
                
            }.padding(.vertical)
                .padding(.trailing)
                .padding(.bottom)
                
            VStack(alignment: .leading){
                Text("Describe Your Skin Today")
                    .font(.body)
                    .fontWeight(.bold)
                TextField("A new pimple appears on the cheek...", text: $description)
                    .padding()
                    .frame(width: 350, height: 76)
                    .cornerRadius(10)
                    .border(Color.gray)
            }
            Button {
                addDesc()
                
            } label: {
                Text("Finish")
                    .font(.system(size: 13))
                    .fontWeight(.semibold)
            }
            .foregroundColor(Color.white)
            .frame(width: 153, height: 50)
            .background(Color("yellow"))
            .cornerRadius(12)
            Spacer()
        }
    }
    
    func addEmoji(savedEmoji : String) {
        let newUpdate = UpdateEntity(context: moc)
        
        newUpdate.emojiUpdate = savedEmoji
        
        try? moc.save()
        
    }
    
    func addDesc () {
        let newUpdate = UpdateEntity(context: moc)
        newUpdate.descUpdate = description
        
        try? moc.save()
        
    }
    
   
}

struct PhotoAndUpdateView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoAndUpdateView()
    }
}
