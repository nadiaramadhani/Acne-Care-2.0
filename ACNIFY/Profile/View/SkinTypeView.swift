//
//  SkinTypeView.swift
//  ACNIFY
//
//  Created by Local Administrator on 23/8/22.
//

import SwiftUI


struct DrySkinView: View {
    let skinType: String
    let acneSeverity: String
    let items: [BookmarkItem] = [.causesDry, .tipsDry]
    let acneItem: [BookmarkItem] = [.causesSensi, .tipsSensi]
    
    var body: some View {
        VStack{
            ScrollView{
                HStack{
                    Text("Skin type: \(skinType.capitalizingFirstLetter())")
                        .foregroundColor(Color("primaryGreen"))
                        .bold()
                    Spacer()
                }.padding(.leading, 20)
                ForEach(BookmarkItem.getBookmarkBySkinType(skintype: skinType)){ item in
                    ExpandableCard(title: item.desc, items: item.items!)
                }
                
                
                HStack{
                    Text("Acne Severity: \(acneSeverity.capitalizingFirstLetter())")
                        .foregroundColor(Color("primaryGreen"))
                        .bold()
                    Spacer()
                }.padding(.leading, 20)
                ForEach(BookmarkItem.getBookmarkBySkinType(skintype: skinType)){ item in
                    ExpandableCard(title: item.desc, items: item.items!)
                }
            }
            .padding(.bottom, 10)
        }
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }

    mutating func capitalizeFirstLetter() {
      self = self.capitalizingFirstLetter()
    }
}
