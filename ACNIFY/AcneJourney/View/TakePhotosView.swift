//
//  TakePhotos.swift
//  ACNIFY
//
//  Created by Rahmat Maftuh Ihsan on 26/06/22.
//

import SwiftUI
import AVFoundation

struct TakePhotos: View {
    @ObservedObject var viewModel : TreatmentPhotoViewModel

    var body: some View {
        CameraView(viewModel: viewModel)
    }
}

struct TakePhotos_Previews: PreviewProvider {
    static var previews: some View {
        TakePhotos(viewModel: TreatmentPhotoViewModel(acneLog: nil))
    }
}

struct CameraView: View{
    
    @StateObject var camera = CameraModel()
    @State var isPhotoPreview = false
    @ObservedObject var viewModel : TreatmentPhotoViewModel
    

    var body: some View{
        if isPhotoPreview{
//            PhotoPreview(data:viewModel.acneLog?.image)
            PhotoAndUpdateView(viewModel: viewModel)
        } else {
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
                                viewModel.data = camera.picData
                                isPhotoPreview = true
                                
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
    
  
}

//Camera Model
class CameraModel: NSObject, ObservableObject, AVCapturePhotoCaptureDelegate{
    @Published var isTaken = false
    
    @Published var session = AVCaptureSession()
    
    @Published var alert = false
    
    //since were going to read pic data
    @Published var output = AVCapturePhotoOutput()
    
    //Preview
    @Published var preview: AVCaptureVideoPreviewLayer!
    
    
    //Pic Data..
    @Published var isSaved = false
    @Published var picData = Data(count:0)
    @Published var isImageSaved = false
    @Published var imageVar = UIImage(named: "0")
    


    
    func Check(){
        //first checking camera has got permission
        switch AVCaptureDevice.authorizationStatus(for: .video){
        case .authorized:
            setUp()
            return
            //Setting Up Session
        case .notDetermined:
            //restusting for permission
            AVCaptureDevice.requestAccess(for: .video) { (status) in
                if status{
                    self.setUp()
                }
                
            }
        case .denied:
            self.alert.toggle()
            return
            
        default:
            return
        }
        
    }
    
    func setUp(){
        //setting up camera
        
        do{
            //setting configs
            self.session.beginConfiguration()
            
            //Camera discovery
            let discoverySession = AVCaptureDevice.DiscoverySession(deviceTypes:
                                                                        [.builtInTrueDepthCamera, .builtInDualCamera, .builtInWideAngleCamera],
                                                                    mediaType: .video, position: .unspecified)
            
            let devices123123123 = discoverySession.devices
            
            if devices123123123.isEmpty{
                print("Kamera tidak terdeteksi")
            }else{
                print("Kamera terdeteksi")
            }
            
            //change for your own
            if let device = AVCaptureDevice.default(.builtInWideAngleCamera,
                                                    for: .video, position: .back) {
                let input = try AVCaptureDeviceInput(device:
                                                        device)
                
                // checking and adding to session
                if self.session.canAddInput(input){
                    self.session.addInput(input)
                }
                
                //same for output
                
                if self.session.canAddOutput(self.output) {
                    self.session.addOutput(self.output)
                }
                
                self.session.commitConfiguration()
                
            }
        }
        catch{
            print(error.localizedDescription)
        }
    }
    //take and retake functions
    func takePic (){
        DispatchQueue.global(qos: .background).async{
            self.output.capturePhoto(with:AVCapturePhotoSettings(), delegate: self)
            self.session.stopRunning()
            
            DispatchQueue.main.async{
                withAnimation{self.isTaken.toggle()}
            }
        }
    }
    
    func reTake(){
        DispatchQueue.global(qos: .background).async{
            self.session.startRunning()
            
            DispatchQueue.main.async{
                withAnimation{self.isTaken.toggle()}
                //clearing
                self.isSaved = false
            }
        }
    }
    
    func photoOutput(_ output:AVCapturePhotoOutput, didFinishProcessingPhoto photo:AVCapturePhoto, error: Error?){
        
        if error != nil{
            return
        }
        
        print("pic taken")
        
        guard let imageData = photo.fileDataRepresentation() else{return}
        self.picData = imageData
    }
    


    
    
   
    
   
    
    
    
}

// setting view for preview

struct CameraPreview: UIViewRepresentable{
    @ObservedObject var camera: CameraModel
    func makeUIView(context: Context) -> UIView{
        
        let view = UIView(frame: UIScreen.main.bounds)
        
        camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
        camera.preview.frame = view.frame
        
        camera.preview.videoGravity = .resizeAspectFill
        view.layer.addSublayer(camera.preview)
        
        
        camera.session.startRunning()
        
        return view
        
        
    }
    func updateUIView(_ uiView: UIView, context: Context){
        
    }
}
