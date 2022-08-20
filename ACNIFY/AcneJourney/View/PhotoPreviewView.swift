//
//  Nadia9.swift
//  ACNIFY
//
//  Created by Rahmat Maftuh Ihsan on 29/06/22.
//
import SwiftUI
struct PhotoPreview : View {
    var data: Data?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Photo preview")
            if let dataImage = data {
                
                Image(uiImage: UIImage(data: dataImage)!)
                    .resizable()
                    .scaledToFit()
            } else {
            }
        }
    }
    
    func loadImageFromDiskWith(fileName: String) -> UIImage? {
        let documentDirectory = FileManager.SearchPathDirectory.documentDirectory
        
        let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)
        if let dirPath = paths.first {
            let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent(fileName)
            let image = UIImage(contentsOfFile: imageURL.path)
            return image
            
        }
        
        return nil
        
    }
    
}

struct PhotoPreview_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPreview(data: nil)
    }
}
