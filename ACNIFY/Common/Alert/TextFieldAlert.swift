//
//  TextFieldAlert.swift
//  ACNIFY
//
//  Created by Agus Budianto on 22/08/22.
//

import Foundation
import SwiftUI

struct TextFieldAlert<Presenting>: View where Presenting: View {

    @Binding var isShowing: Bool
    @Binding var text: String
    let presenting: Presenting
    let title: String
    let subtitle: String
    let action: ()->()


    var body: some View {
        GeometryReader { (deviceSize: GeometryProxy) in
            ZStack {
                self.presenting
                    .disabled(isShowing)
                VStack {
                    Text(self.title).font(.body).fontWeight(.semibold)
                    Text(self.subtitle).font(.caption2)
                    TextField("", text: self.$text)
                        .background(.white)
                        .padding(1)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5, style: .continuous)
                                .strokeBorder(Color(hex: "#3C3C43").opacity(0.29), lineWidth: 0.5)
                        )
                    Divider()
                    HStack {
                        Spacer()
                        Button(action: {
                            withAnimation {
                                self.isShowing.toggle()
                            }
                        }) {
                            Text("Back").foregroundColor(.blue)
                        }
                        Spacer()
                        Divider()
                        Spacer()
                        Button(action: {
                            withAnimation {
                                self.isShowing.toggle()
                                action()
                            }
                        }) {
                            Text("Save").bold().foregroundColor(.blue)
                            
                        }
                        Spacer()
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 14, style: .continuous).fill(Color(hex: "#F2F2F2").opacity(0.8))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .strokeBorder(Color(hex: "#3C3C43").opacity(0.29), lineWidth: 0.5)
                )
                
                .frame(
                    width: 270,
                    height: 140
                )
                .opacity(self.isShowing ? 1 : 0)
            }
                                                                                                
        }
    }

}


extension View {

    func textFieldAlert(isShowing: Binding<Bool>,
                        text: Binding<String>,
                        title: String,
                        subtitle: String,
                        action: @escaping ()->()
    ) -> some View {
        TextFieldAlert(isShowing: isShowing,
                       text: text,
                       presenting: self,
                       title: title,
                       subtitle: subtitle,
                       action: action
        )
    }

}
