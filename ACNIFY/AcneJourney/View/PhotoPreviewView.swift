//
//  Nadia9.swift
//  ACNIFY
//
//  Created by Rahmat Maftuh Ihsan on 29/06/22.
//
import SwiftUI
struct PhotoPreview : View {
//    let image = UIImage(data: self.picData)!

    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            //Populate text with info from notification.
            
            //Bisa pake airtable as database, nanti di fetch
            
            Text("Photo preview")
            if let image = loadImageFromDiskWith(fileName: "Acnify2022-07-04%2008:30:57%20+0000") {
                
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else {
               // Put some placeholder image here
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
        PhotoPreview()
    }
}
