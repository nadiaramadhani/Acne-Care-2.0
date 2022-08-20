//
//  ChooseProductMainView.swift
//  ACNIFY
//
//  Created by Rahmat Maftuh Ihsan on 19/08/22.
//

import SwiftUI

struct ChooseProductMainView: View {
    @ObservedObject var viewModel : ChooseProductViewModel
    @State var isSelectedOilCleanserNight = false
    @Environment(\.presentationMode) var presentation
    @State var pageDisplayed: ChooseProductMainView.PageDisplayed = .Day
    
    var body: some View {
        NavigationView{
            ZStack{
                Color(.white)
                    .edgesIgnoringSafeArea(.all)
                Image ("Oval2")
                    .edgesIgnoringSafeArea(.all)
                    .position(x:250, y:110)
                
                VStack {
                    Text("Product Type")
                        .font(.system(size:17))
                        .fontWeight(.bold)
                        .padding(.leading,-180)
                        .padding(.top,40)
                    
                    
                    
                    ScrollView(.vertical, showsIndicators: false, content: {
                        VStack{
                            if pageDisplayed == .Day {
                                ForEach(0..<viewModel.userDayProducts.count, id: \.self) { index in
                                    let userProduct = viewModel.userDayProducts[index]
                                    let productDetail = UserProductDetail.getDefaultProduct().filter{$0.ID ==  userProduct.productDetailID}
                                        .first!
                                    ProductCardItemView(isChecked: $viewModel.productDayChecked[index], productDetail: productDetail, product: userProduct)
                                }
                            }
                            
                            if pageDisplayed == .Night {
                                ForEach(0..<viewModel.userNightProducts.count, id: \.self) { index in
                                    let userProduct = viewModel.userNightProducts[index]
                                    let productDetail = UserProductDetail.getDefaultProduct().filter{$0.ID ==  userProduct.productDetailID}
                                        .first!
                                    ProductCardItemView(isChecked: $viewModel.productDayChecked[index], productDetail: productDetail, product: userProduct)
                                }
                            }
                           
                            
                        }
                    })
                    .padding(.leading,0)
                    
                    .frame(width: 500, height: 710)
                    .edgesIgnoringSafeArea(.bottom)
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading:
              HStack{
                Button(action: {
                    //                        self.isBack = true
                    self.presentation.wrappedValue.dismiss()
                    viewModel.saveChanges()
                }){
                    HStack{
                        Image (systemName: "chevron.backward")
                            .font(.system(size:22))
                            .foregroundColor(Color ("primaryGreen"))
                        
                        Text("Your Skincare Product")
                            .foregroundColor(Color("primaryGreen"))
                            .font(.system(size:20))
                            .fontWeight(.bold)
                            .frame(alignment: .leading)
                    }
                    
                }
                
            }
                                
            )
            
        }
        .navigationViewStyle(.stack )
    }
    
    
  
}



struct ChooseProductMainView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseProductMainView(viewModel: ChooseProductViewModel())
    }
}


extension ChooseProductMainView{
    enum PageDisplayed{
        case Night
        case Day
    }
}

