//
//  ContentView.swift
//  ACNIFY
//
//  Created by Local Administrator on 22/06/22.
//

import SwiftUI
//import CoreData

struct onBoardingView: View {
    
    //onboarding states:
    /*
     0 = welcome screen
     1= first onboarding
     2 = second onboarding
     3 = third onboarding
     */
    
    let transition: AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    @State var onBoardingState: Int = 0
    @State var userName: String = ""
    
    //username input
    @AppStorage("name") var currentUserName: String?
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    
    var body: some View {
        
        ZStack{
            ZStack{
                switch onBoardingState{
                case 0:
                    onboarding1
                        .transition(transition)
                case 1:
                    onboarding2
                        .transition(transition)
                    
                case 2:
                    onboarding3
                        .transition(transition)
                    
                case 3:
                    onboarding4
                        .transition(transition)
                case 4:
                    HomeView()
                        .transition(transition)
                default:
                    RoundedRectangle(cornerRadius: 25.0)
                        .foregroundColor(.blue)
                }
            }
            VStack{
                Spacer()
                bottomButton
            }
        }
        
    }
}

struct UserInputView_Previews: PreviewProvider {
    static var previews: some View {
        onBoardingView()
    }
}

//MARK: COMPONENTS

extension onBoardingView{
    private  var bottomButton: some View {
        Text(onBoardingState == 3 ? "FINISH" :
                "NEXT"
        )
        .font(.headline)
        .foregroundColor(.white)
        .frame(width: 350, height:50 )
        //            .frame(maxWidth: .infinity)
        .background(Color("primaryGreen"))
        .cornerRadius(10)
        .padding()
        .onTapGesture {
            handleNextButtonPressed()
        }
    }
    //MARK: ONBOARDING 1
    private var onboarding1: some View {
        VStack{
            Spacer()
            Image("firstOnboard")
                .padding()
            
            Text("**Identify your skin condition**")
                .font(.title)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color("primaryGreen"))
                .frame(width: 350, alignment: .leading)
                .padding(.leading, 30)
                .padding(.bottom)
            
            Text("Have a better understanding of your skin condition to find suitable product")
                .frame(width: 350, alignment: .leading)
                .font(.title3)
                .padding(.leading, 30)
            Spacer()
        }
    }
    //MARK: ONBOARDING 2
    private var onboarding2: some View {
        VStack{
            Spacer()
            Image("secondOnboard")
                .padding()
            
            Text("**Check the suitable ingredients**")
                .font(.title)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color("primaryGreen"))
                .frame(width: 350, alignment: .leading)
                .padding(.leading, 30)
                .padding(.bottom)
            
            Text("Get to know your acne with its characteristics and recommendation ingredients that suitable for you")
                .frame(width: 350, alignment: .leading)
                .font(.title3)
                .padding(.leading, 30)
            Spacer()
            
        
        }
    }
    //MARK: ONBOARDING 3
    private var onboarding3: some View {
        VStack{
            Spacer()
            Image("thirdOnboard")
                .padding()
            Text("**Daily Progress of The Treatment**")
                .font(.title)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color("primaryGreen"))
                .frame(width: 350, alignment: .leading)
                .padding(.leading, 30)
                .padding(.bottom)
            
            Text("Track and trace your daily treatment progress to maintain the skin condition")
                .frame(width: 350, alignment: .leading)
                .font(.title3)
                .padding(.leading, 30)
            Spacer()
            
          
        }
    }
    //MARK: ONBOARDING 4
    private var onboarding4: some View {
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
                .colorMultiply(Color.white)
                .frame(width: 346,alignment: .leading)
                .padding()
                .font(.headline)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
            
            Spacer()
        }
        
    }
}
extension onBoardingView{
    //MARK: FUNCTIONS
    func signIn() {
        currentUserName = userName
        withAnimation(.spring()) {
            currentUserSignedIn = true
        }
    }
    
    func handleNextButtonPressed() {
        
        //check name inputs
        switch onBoardingState {
        case 3:
            guard userName.count >= 3 else {
                return
            }
            
        default:
            break
            
        }
        
        if onBoardingState == 4 {
            signIn()
        }
        else {
            withAnimation(.spring()) {
                onBoardingState += 1
            }
        }
        
    }
}
