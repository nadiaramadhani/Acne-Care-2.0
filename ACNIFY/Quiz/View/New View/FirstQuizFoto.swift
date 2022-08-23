//
//  FirstQuizFoto.swift
//  ACNIFY
//
//  Created by Agus Budianto on 23/08/22.
//

import SwiftUI

struct FirstQuizFoto: View {
    @ObservedObject var viewModel : TreatmentPhotoViewModel
    @ObservedObject var quizViewModel : NewQuizViewModel
    
    var body: some View {
        QuizCameraView(viewModel: viewModel, quizViewModel : quizViewModel)
    }
}


struct QuizCameraView: View{
    
    @StateObject var camera = CameraModel()
    @ObservedObject var viewModel : TreatmentPhotoViewModel
    @ObservedObject var quizViewModel : NewQuizViewModel
    
    
    var body: some View{
        ZStack{
            //Going to be camera preview
            CameraPreview(camera: camera)
                .ignoresSafeArea(.all, edges: .all)
            
            VStack{
                HStack{
                    if camera.isTaken{
                        HStack{
                            
                            Spacer()
                            
                            Button(action:camera.reTake,label:{
                                Image(systemName:"arrow.triangle.2.circlepath.camera")
                                    .foregroundColor(.black)
                                    .padding()
                                    .background(Color.white)
                                    .clipShape(Circle())
                                
                            })
                            .padding(.trailing,10)
                            
                            
                        }
                        
                    }
                    
                }
                
                Spacer()
                HStack{
                    
                    if camera.isTaken{
                        Spacer()
                        Button(action: {
                            viewModel.acneLog?.image = camera.picData
                            viewModel.saveChanges()
                            quizViewModel.saveSkinPersona()
                        }, label: {
                            Text("Save")
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                                .padding(.vertical,10)
                                .padding(.horizontal, 20)
                                .background(Color.white)
                                .clipShape(Capsule())
                        })
                        .padding(.trailing)
                        
                        
                    }else{
                        Button(action:camera.takePic,
                               label:{
                            ZStack{
                                
                                Circle()
                                    .fill(Color.white)
                                    .frame(width:65, height:65)
                                
                                Circle()
                                    .stroke(Color.white,lineWidth: 2)
                                    .frame(width:75, height:75)
                            }
                        })
                    }
                    
                }
                .frame(height:75)
            }
        }
        .onAppear(perform: {
            
            camera.Check()
        })
    }
}
