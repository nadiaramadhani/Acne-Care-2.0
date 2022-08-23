//
//  LoginView.swift
//  ACNIFY
//
//  Created by Agus Budianto on 02/08/22.
//

import SwiftUI

struct LoginView: View {
    @State var userName: String = ""
    @State var alertTitle: String = ""
    @State var showingAlert = false
    
   
    
    @ObservedObject var viewModel = LoginViewModel()

    
    var body: some View {
        
        VStack{
            Spacer()
            Text("**Welcome to Acnify!**")
                .padding()
                .font(.title)
                .frame(width: 370, alignment: .leading)
                .foregroundColor(Color("primaryGreen"))
                .opacity(28.0)
            
            Text("Tell us yourname")
                .font(.title3)
                .frame(width: 340, alignment: .leading)
            
            TextField("Name", text: $userName)
                .disableAutocorrection(true)
                .colorMultiply(Color.white)
                .frame(width: 300,alignment: .leading)
                .padding()
                .font(.headline)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
            
            BottomButtonView(buttonText: "Next")
                .onTapGesture {
                    if userName.isEmpty {
                        showAlert(title: "Please Provide Username")
                    } else{
                        signIn()
                    }
                }
            
            Spacer()
            
        }.alert(isPresented: $showingAlert, content: {
            return Alert(title: Text(alertTitle))
            
        })
    }
}


extension LoginView{
    //MARK: FUNCTIONS
    func signIn() {
        withAnimation{
            viewModel.setLoginUser(for: userName)
        }
    }

    func showAlert(title: String) {
            alertTitle = title
            showingAlert.toggle()
            return
    }

}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
