//
//  ExpandableCard.swift
//  ACNIFY
//
//  Created by Agus Budianto on 24/08/22.
//

import SwiftUI

struct ExpandableCard: View {
    var title: String
    let items: [BookmarkItem]
    
    @State var isExpanded = false
    var body: some View {
        VStack{
            HStack{
            
                Text(title).font(.subheadline.bold()).padding(.horizontal)
                Spacer()
                Label("", systemImage: isExpanded ? "chevron.up" : "chevron.down")
            }.frame(width: .infinity,height: 48, alignment: .leading)
                .background(Color(hex: "#F5F6F6").cornerRadius(8))
                .padding(.horizontal, 20)
                .onTapGesture {
                    isExpanded.toggle()
                }
            
            if isExpanded{
                ForEach(items) { row in
                    HStack{
                    
                        Image(row.icon)
                            .frame(width: 40, height: 40)
                            .padding(.leading, 16)
                        Text(row.desc)
                            .font(.system(size: 12))
                            .padding(.leading, 16)
                            .padding(.trailing, 16)
                           
                        
                        Spacer()
                    }.frame(width: .infinity,height: 48, alignment: .leading)
                        .padding(.horizontal, 20)

                        
                    
                    
                    
                    
                }
            }
        }
    }
}

struct ExpandableCard_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableCard(title: "Cause", items: BookmarkItem.causesDry.items!)
    }
}
