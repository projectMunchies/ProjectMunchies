//
//  BunchView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 9/19/23.
//

import SwiftUI
import Firebase
import FirebaseStorage

struct BunchView: View {
    let bunchId: String
    
    @State private var singleBunch: BunchModel = BunchModel(id: "", locationName: "", profileIds: [], reviewIds: [])
    @State private var bunchImage: UIImage = UIImage()
    
    
    let storage = Storage.storage()
    let db = Firestore.firestore()
    
    var body: some View {
        
        VStack{
            if singleBunch.id != "" && bunchImage.size.width > 0 {
                NavigationLink(destination: BunchProfileView(singleBunch: self.singleBunch)){
                    Image(uiImage: self.bunchImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 80)
                        .background(.gray.opacity(0.2))
                        .cornerRadius(15)
                        .dropDestination(for: Image.self) { items, locations in
                            return true
                        }
                }
                
                Text(singleBunch.locationName)
                    .font(.system(size: 12))
                    .foregroundColor(.black)
            }
                
         
        }
        .onAppear{
            getBunch(){(returnBunch) in
                if returnBunch.id != "" {
                    getBunchImageStorageFile(profileId: returnBunch.id)
                }
            }
        }
    }
    
    public func getBunch(completed: @escaping (_ bunch: BunchModel) -> Void){
        db.collection("bunches")
            .whereField("id", isEqualTo: bunchId)
            .limit(to: 1)
            .getDocuments() {(querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                    completed(BunchModel(id: "", locationName: "", profileIds: [], reviewIds: []))
                }else {
                    for document in querySnapshot!.documents {
                        let data = document.data()
                        if !data.isEmpty{
                            self.singleBunch = BunchModel(id: data["id"] as? String ?? "", locationName: data["locationName"] as? String ?? "", profileIds: data["profileIds"] as? [String] ?? [], reviewIds: data["reviewIds"] as? [String] ?? [])
                        }
                    }
                    completed(self.singleBunch)
                }
            }
    }
    
    public func getBunchImageStorageFile(profileId: String) {
        let imageRef = storage.reference().child("\(String(describing: profileId))"+"/images/image.jpg")
        
        // Download in memory with a maximum allowed size of 2MB (2 * 1024 * 1024 bytes)
        imageRef.getData(maxSize: Int64(2 * 1024 * 1024)) { data, error in
            if let error = error {
                print("Error getting file: ", error)
            } else {
                let image = UIImage(data: data!)
                self.bunchImage = image!
                
            }
        }
    }
}

struct BunchView_Previews: PreviewProvider {
    static var previews: some View {
        BunchView(bunchId: "3531B23E-3F52-4FBA-B3AC-E6DDC51AB80A")
    }
}
