//
//  FbStorageRepository.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 5/27/24.
//

import Foundation
import UIKit
import FirebaseStorage

class FbStorageRepository: ObservableObject {
    let storage = Storage.storage()
    
    public func Get(profileId: String) async throws -> UIImage {
        var responseImage = UIImage()
        let imageRef = storage.reference().child("\(String(describing: profileId))"+"/images/image.jpg")
        
        // Download in memory with a maximum allowed size of 2MB (2 * 1024 * 1024 bytes)
        imageRef.getData(maxSize: Int64(2 * 1024 * 1024)) { data, error in
            if let error = error {
                print("Error getting file: ", error)
            } else {
                let image = UIImage(data: data!)
                responseImage = image!
                
            }
        }
        
        return responseImage
    }
    
    public func uploadStorageFile(image: UIImage, profileId: String,completed: @escaping (_ message: String) -> Void){
        let storageRef = storage.reference().child("\(String(describing: profileId))"+"/images/image.jpg")
        
        // cut image mb in half
        let data = image.jpegData(compressionQuality: 0.5)
        
        // if data is less than 2mb, save image; if not display alert
        if data?.count ?? 0 < 2000000{
            let metadata = StorageMetadata()
            metadata.contentType = "image/jpg"
            
            if let data = data {
                storageRef.putData(data, metadata: metadata) { (metadata, error) in
                    if let error = error {
                        print("Error while uploading file: ", error)
                        completed("error")
                    }
                    
                    if let metadata = metadata {
                        print("Metadata: ", metadata)
                    }
                }
                completed("success")
            }
        }
        else {
            //will display alert
            completed("image too large")
        }
    }
}
