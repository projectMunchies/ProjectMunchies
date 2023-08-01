//
//  CardViewModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 8/1/23.
//

import Foundation
import FirebaseStorage
import UIKit

class CardViewModel: ObservableObject {
    @Published var profileImages: [UIImage] = []
    @Published var profileImage: UIImage = UIImage()
    
    let storage = Storage.storage()
    //
    //    init(){
    //        self.clearData()
    //    }
    
//    public func clearData(){
//
//    }
    
    
    public func getStorageFile(profileId: String) {
        let imageRef = storage.reference().child("\(String(describing: profileId))"+"/images/image.jpg")
        
        imageRef.getData(maxSize: Int64(1 * 1024 * 1024)) {data, error in
            if let error = error {
                print("Error getting file: ",error)
            } else {
                let image = UIImage(data: data!)
                self.profileImage = image!
            }
            
        }
    }
    
    public func getCardImages(cardImages: [ProfileModel]){
        for profile in cardImages {
            let imageRef = storage.reference().child("\(String(describing: profile.id))"+"/images/image.jpg")
            
            imageRef.getData(maxSize: Int64(1 * 1024 * 1024)) {data, error in
                if let error = error {
                    print("Error getting file: ",error)
                } else {
                    let image = UIImage(data: data!)
                    self.profileImages.append(image!)
                }
                
            }
        }
    }
    
}
