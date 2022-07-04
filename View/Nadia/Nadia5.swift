//
//  Nadia5.swift
//  ACNIFY
//
//  Created by Rahmat Maftuh Ihsan on 27/06/22.
//

import SwiftUI

class FileManagerViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    let imageName: String = "skintype1"

    init() {
        getImage()
    }
    
    func getImage () {
        image = UIImage(named: imageName)
    }
}

struct FileManagerView: View {
    @StateObject var vm = FileManagerViewModel()

    var body: some View {
        NavigationView{
            VStack{
                if let image = vm.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Save")
                    })
                }
                
            }.navigationTitle("FileManager")
        }
    }
}

struct FileManager_Preview : PreviewProvider {
    
   
    static var previews: some View {
        FileManagerView()    }
}

