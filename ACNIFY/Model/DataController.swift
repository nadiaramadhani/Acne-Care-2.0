import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "CoreDataNadia")
    
    init() {
        container.loadPersistentStores{ description, error in
            if let error = error {
            
            print("Error loading coredata \(error.localizedDescription )")
        }
            
        }
    }
    
}
