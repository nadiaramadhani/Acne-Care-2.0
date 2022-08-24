//
//  PhotoAndUpdateView.swift
//  ACNIFY
//
//  Created by Local Administrator on 16/08/22.
//

import SwiftUI

struct PhotoAndUpdateView: View {
    @Binding var isShowPhoto:Bool
    @State var description : String = ""
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel : TreatmentPhotoViewModel
    

    
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
                    Text(TreatmentPhotoViewModel.emojiBetter)
                        .font(.system(size: 40))
                        .overlay(RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.orange, lineWidth: 4)
                            .opacity(TreatmentPhotoViewModel.emojiBetter == viewModel.selectedEmoji ? 1 : 0))
                    Text("Better")
                        .font(.system(size: 16))
                }
                .padding(.horizontal)
                .onTapGesture {
                    addEmoji(savedEmoji: TreatmentPhotoViewModel.emojiBetter)
                    
                }
                
                VStack{
                    Text(TreatmentPhotoViewModel.emojiNormal)
                        .font(.system(size: 40))
                        .overlay(RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.orange, lineWidth: 4)
                            .opacity(TreatmentPhotoViewModel.emojiNormal == viewModel.selectedEmoji ? 1 : 0))
                    
                    Text("Same")
                        .font(.system(size: 16))
                }
                .padding(.horizontal)
                .onTapGesture {
                    addEmoji(savedEmoji: TreatmentPhotoViewModel.emojiNormal)
                }
                VStack{
                    Text(TreatmentPhotoViewModel.emojiWorst)
                        .font(.system(size: 40))
                        .overlay(RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.orange, lineWidth: 4)
                            .opacity(TreatmentPhotoViewModel.emojiWorst == viewModel.selectedEmoji ? 1 : 0))
                    Text("Worst")
                        .font(.system(size: 16))
                }
                .padding(.horizontal)
                .onTapGesture {
                    addEmoji(savedEmoji: TreatmentPhotoViewModel.emojiWorst)
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
                            .shadow(color: viewModel.isAcneGoneQuickAnswerSelected ? .orange: .gray, radius: 1)
                        Text(TreatmentPhotoViewModel.acneGoneQuickAnswer)
                            .font(.system(size: 16))
                    }
                    .onTapGesture {
                        viewModel.isAcneGoneQuickAnswerSelected.toggle()
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 173, height: 40)
                            .foregroundColor(.white)
                            .shadow(color: viewModel.isAcneGetDryerQuickAnswerSelected ? .orange: .gray, radius: 1)
                        Text(TreatmentPhotoViewModel.acneGetDryerQuickAnswer)
                            .font(.system(size: 16))
                    }
                }
                .onTapGesture {
                    viewModel.isAcneGetDryerQuickAnswerSelected.toggle()
                }
                HStack{
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 69, height: 40)
                            .foregroundColor(.white)
                            .shadow(color: viewModel.isAcneStreakQuickAnswerSelected ? .orange: .gray, radius: 1)
                        Text(TreatmentPhotoViewModel.acneStreakQuickAnswer)
                            .font(.system(size: 16))
                    }
                    .onTapGesture {
                        viewModel.isAcneStreakQuickAnswerSelected.toggle()
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 147, height: 40)
                            .foregroundColor(.white)
                            .shadow(color: viewModel.isAcneAPimpleAppearsQuickAnswerSelected ? .orange: .gray, radius: 1)
                        Text(TreatmentPhotoViewModel.acneAPimpleAppearsQuickAnswer)
                            .font(.system(size: 16))
                    }
                    .onTapGesture {
                        viewModel.isAcneAPimpleAppearsQuickAnswerSelected.toggle()
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 100, height: 40)
                            .foregroundColor(.white)
                            .shadow(color: viewModel.isAcneRedPimpleQuickAnswerSelected ? .orange: .gray, radius: 1)
                        Text(TreatmentPhotoViewModel.acneRedPimpleQuickAnswer)
                            .font(.system(size: 16))
                    }
                    .onTapGesture {
                        viewModel.isAcneRedPimpleQuickAnswerSelected .toggle()
                    }
                    
                }
                
            }.padding(.vertical)
                .padding(.trailing)
                .padding(.bottom)
                
            VStack(alignment: .leading){
                Text("Describe Your Skin Today")
                    .font(.body)
                    .fontWeight(.bold)
                TextField("A new pimple appears on the cheek...", text: $viewModel.acneLogDesc)
                    .padding()
                    .frame(width: 350, height: 76)
                    .cornerRadius(10)
                    .border(Color.gray)
            }
            Button {
                viewModel.saveChanges()
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Finish")
                    .font(.system(size: 13))
                    .fontWeight(.semibold)
            }
            .foregroundColor(Color.white)
            .frame(width: 153, height: 50)
            .background(viewModel.selectedEmoji == "" ? Color.gray : Color("yellow"))
            .cornerRadius(12)
            .disabled(viewModel.selectedEmoji == "")
            Spacer()
        }
    }
    
    func addEmoji(savedEmoji : String) {
        self.viewModel.acneLogCondition = TreatmentPhotoViewModel.getEmojiName(emoji: savedEmoji)
        self.viewModel.selectedEmoji = savedEmoji
    }
    
  
    
   
}

//struct PhotoAndUpdateView_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotoAndUpdateView(viewModel: TreatmentPhotoViewModel(acneLog: AcneLog(context: PersistenceController.shared.container.viewContext)))
//    }
//}
