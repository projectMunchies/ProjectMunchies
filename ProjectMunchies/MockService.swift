//
//  MockData.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/27/23.
//

import Foundation
import Firebase
import FirebaseFirestore

let db = Firestore.firestore()

enum MockService {
    
    static var eventsSampleData: [EventModel] {
        [
            EventModel(
                id: "cf432344",
                title: "Itialian night with",
                location: "Magginos, Tampa,Fl",
                description: "Enjoy a great night with some great people",
                participants: ["dasfdsfweefcae","fdsafdsfessfd"],
                eventDate: Date.now
            ),
//            EventModel(
//                id: "jkhblhjkbkjbjkblk",
//                title: "Taco Tuesdays",
//                location: "Mugelitos, Tampa,Fl",
//                description: "Taco tuesdays youj already know what it be",
//                participants: ["fer3f4f3f34","faee43434343"],
//                eventDate: Date.now
//            ),
//            EventModel(
//                id: "jkhblhjkbkjbjkblk",
//                title: "Taco Tuesdays",
//                location: "Mugelitos, Tampa,Fl",
//                description: "Taco tuesdays youj already know what it be",
//                participants: ["fer3f4f3f34","faee43434343"],
//                eventDate: Date.now
//            ),
//            EventModel(
//                id: "jkhblhjkbkjbjkblk",
//                title: "Taco Tuesdays",
//                location: "Mugelitos, Tampa,Fl",
//                description: "Taco tuesdays youj already know what it be",
//                participants: ["fer3f4f3f34","faee43434343"],
//                eventDate: Date.now
//            )
        ]
    }
    
    static var userProfileSampleData: ProfileModel {
        ProfileModel(
            id: "",
            fullName: "",
            location: "",
            description: "",
            gender: "",
            age: "",
            fcmTokens: [],
            messageThreadIds: [],
            isMockData: true
        )
    }
    
    static var foodFilterSampleData: FoodFilterModel {
        FoodFilterModel(
            id: "",
            userProfileId: "",
            category: "",
            type: "",
            gender: "",
            location: "",
            ageRangeFrom: "",
            ageRangeTo: "",
            timeStamp: Date()
        )
    }
    
    static var profilesSampleData: [ProfileModel] {
        [
            //Women
            ProfileModel(
                id: "8ff57448-387d-41f4-be45-bc879be23fbf",
                fullName: "Vickie James",
                location: "Tampa,Fl",
                description: "",
                gender: "Female",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "a6ce1c0b-0cdb-4eaf-bca8-d124e39819ea",
                fullName: "Marilyn Reynolds",
                location: "Tampa,Fl",
                description: "",
                gender: "Female",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "a6f3b606-93c9-4d6b-a4f8-98ee66181206",
                fullName: "Kristina Anthony",
                location: "St.Pete,Fl",
                description: "",
                gender: "Female",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "b37b0143-d3cc-495d-bfdc-1fec2d8fcf98",
                fullName: "Kathleen Brown",
                location: "Tampa,Fl",
                description: "",
                gender: "Female",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "d21387d1-fd1d-44b2-bc9c-03dfc8aa3e39",
                fullName: "Stormy Beaulieu",
                location: "Tampa,Fl",
                description: "",
                gender: "Female",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "f244f9a3-1f31-4d02-a509-99cb00bd1481",
                fullName: "Aurelia Driscoll",
                location: "Clearwater,Fl",
                description: "",
                gender: "Female",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "339b76b7-c58e-48fe-a181-eb67bbd21b49",
                fullName: "Theresa Richey",
                location: "Tampa,Fl",
                description: "",
                gender: "Female",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "d7e891d8-b126-45c1-b878-5a3be0db7d10",
                fullName: "Jane Conti",
                location: "Tampa,Fl",
                description: "",
                gender: "Female",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "f8c341e5-4e8e-42d6-ada8-25d6f8e9530f",
                fullName: "Linda Rice",
                location: "St.Pete,Fl",
                description: "",
                gender: "Female",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "ef49e44f-1957-4690-8bcf-473f9afe73cb",
                fullName: "Ruth Campos",
                location: "Tampa,Fl",
                description: "",
                gender: "Female",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "26102e2e-0b2b-4ff9-9b9c-a2b87e9af06a",
                fullName: "Angie Dyson",
                location: "Tampa,Fl",
                description: "",
                gender: "Female",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "a8b00895-411c-4cb0-8e19-559696ce6391",
                fullName: "Ana Ramos",
                location: "Clearwater,Fl",
                description: "",
                gender: "Female",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "93cb0b79-6afc-41de-aad1-c28808de4a4a",
                fullName: "Diane Cowan",
                location: "Tampa,Fl",
                description: "",
                gender: "Female",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "9527bf1e-b5a8-4fe5-93e6-7db84ba91166",
                fullName: "Dee Klimek",
                location: "Tampa,Fl",
                description: "",
                gender: "Female",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "4f5c7f12-c290-4a8a-abf6-deb8f396e325",
                fullName: "Charolette Spiker",
                location: "St.Pete,Fl",
                description: "",
                gender: "Female",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "e53f7388-b23a-4016-9ed9-4e86d4379f30",
                fullName: "Claire Simpson",
                location: "Tampa,Fl",
                description: "",
                gender: "Female",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "25148c1d-e2f9-40c9-83ab-099c6e3c5322",
                fullName: "Cara Lowman",
                location: "Tampa,Fl",
                description: "",
                gender: "Female",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "176443d2-66ab-44d7-8ec8-cda127185a50",
                fullName: "Stella Swafford",
                location: "Clearwater,Fl",
                description: "",
                gender: "Female",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "a87d620a-e0ae-4f10-bda4-5696a41cc5ac",
                fullName: "Amy Leathers",
                location: "Tampa,Fl",
                description: "",
                gender: "Female",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "0c9004ad-623d-4575-9c1f-d192f1662f72",
                fullName: "Gemma Golden",
                location: "Tampa,Fl",
                description: "",
                gender: "Female",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "a764113f-b440-425f-bb28-7ccfb5b0b67d",
                fullName: "Sandra Herring",
                location: "St.Pete,Fl",
                description: "",
                gender: "Female",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "5850c7a9-f735-4934-a735-fcffee610ce8",
                fullName: "Mia Lewis",
                location: "Tampa,Fl",
                description: "",
                gender: "Female",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "62f36450-3711-46f6-ba0f-43ad5dca9004",
                fullName: "Alyssa Turner",
                location: "Tampa,Fl",
                description: "",
                gender: "Female",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "399e5315-6699-454f-9785-e756d78dda08",
                fullName: "Lana Taylor",
                location: "Clearwater,Fl",
                description: "",
                gender: "Female",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "3a775f5f-cfdf-49fe-9b01-e657aaf0e91c",
                fullName: "Diana Watson",
                location: "Tampa,Fl",
                description: "",
                gender: "Female",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            
            
            
        //Men
            ProfileModel(
                id: "be3597d0-f8af-4245-b45f-01d5adc75039",
                fullName: "Aaron Bates",
                location: "Tampa,Fl",
                description: "",
                gender: "Male",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "1112314d-de9c-45bd-9f95-ce46898d7a97",
                fullName: "Alexander Kennedy",
                location: "Tampa,Fl",
                description: "",
                gender: "Male",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "7c6f12f2-9cdf-404b-bfb1-3531fcba038c",
                fullName: "Ben Thomas",
                location: "Tampa,Fl",
                description: "",
                gender: "Male",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "00d1726a-cb7f-423e-aa50-533dfba961e1",
                fullName: "Billy Kwasny",
                location: "St.Pete,Fl",
                description: "",
                gender: "Male",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "50ad62b7-3c90-40d6-8baf-459509e48e07",
                fullName: "Darrel Zidar",
                location: "Tampa,Fl",
                description: "",
                gender: "Male",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "dec2cc1d-3641-4e1a-93e0-9fe763ee36ef",
                fullName: "Dean Deperro",
                location: "Tampa,Fl",
                description: "",
                gender: "Male",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "24da908a-0951-407b-abec-b0b1e44ff4c0",
                fullName: "Donnell Shryer",
                location: "Clearwater,Fl",
                description: "",
                gender: "Male",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "c2165cd3-b124-4d65-aaaf-1441e2a81bf7",
                fullName: "Erich Nabb",
                location: "Tampa,Fl",
                description: "",
                gender: "Male",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "7019b1e4-c0e9-4371-917d-2ac85c458210",
                fullName: "Frederic Zeiber",
                location: "Tampa,Fl",
                description: "",
                gender: "Male",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "77b8c5cf-aa52-4818-bdfa-b979079b1066",
                fullName: "Garret Psaila",
                location: "St.Pete,Fl",
                description: "",
                gender: "Male",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "cce32d43-65bd-4f80-81da-f8e9b58da07d",
                fullName: "Garry Buechler",
                location: "Tampa,Fl",
                description: "",
                gender: "Male",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "e2176174-56c2-48d0-8faf-aee1bd833ca7",
                fullName: "Hans Vereen",
                location: "Tampa,Fl",
                description: "",
                gender: "Male",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "2a0fff25-8ad8-4fa4-8639-2067757ebc93",
                fullName: "Hugo Storrow",
                location: "Clearwater,Fl",
                description: "",
                gender: "Male",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "c7029440-0dee-4406-99e7-31d9a5cc3027",
                fullName: "Jake Hanig",
                location: "Tampa,Fl",
                description: "",
                gender: "Male",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "82e786c0-1a04-4304-9f17-6a88cc56a8eb",
                fullName: "Jefferey Cellars",
                location: "Tampa,Fl",
                description: "",
                gender: "Male",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "c01e933d-bbe1-41de-b542-bbe64a4b2561",
                fullName: "Jim Valladares",
                location: "St.Pete,Fl",
                description: "",
                gender: "Male",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "fecada7b-4a43-4915-b131-2a0d5e08203c",
                fullName: "Kareem Bayerle",
                location: "Tampa,Fl",
                description: "",
                gender: "Male",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "d860ef2d-e354-49a9-9d5c-01fbcd17fba2",
                fullName: "Lanny Peeters",
                location: "Tampa,Fl",
                description: "",
                gender: "Male",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "ca9aca07-a8e2-4166-9a0c-15d5d74a5a78",
                fullName: "Luciano Sienkiewicz",
                location: "Clearwater,Fl",
                description: "",
                gender: "Male",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "9c7e67ee-74bf-4a82-8c13-bf13459bfdc0",
                fullName: "Luke Wachowicz",
                location: "Tampa,Fl",
                description: "",
                gender: "Male",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "c8819f16-5e27-49dc-8949-8f9aacbd2cb4",
                fullName: "Mason Baxter",
                location: "Tampa,Fl",
                description: "",
                gender: "Male",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "dbcd8e0a-9a3c-4bc7-bd0d-723705e1d95b",
                fullName: "Mitchel Hoeper",
                location: "St.Pete,Fl",
                description: "",
                gender: "Male",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "dcffd2d8-929d-4439-9728-357a7c4fe582",
                fullName: "Mohamed Stathis",
                location: "Tampa,Fl",
                description: "",
                gender: "Male",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "c115223c-c494-4a33-b914-5d00d91d3eb9",
                fullName: "Oliver Mccall",
                location: "Tampa,Fl",
                description: "",
                gender: "Male",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "70437a1b-88c9-4423-8eef-3a4afe60a592",
                fullName: "Ray Eddleston",
                location: "Clearwater,Fl",
                description: "",
                gender: "Male",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "19457ad4-3451-4316-9921-c87aadb7d9ae",
                fullName: "Rob Dominowski",
                location: "Tampa,Fl",
                description: "",
                gender: "Male",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            ),
            ProfileModel(
                id: "28527272-2ac8-42b5-8fc3-f1af5a5770cb",
                fullName: "Scottie Stefek",
                location: "Tampa,Fl",
                description: "",
                gender: "Male",
                age: "25",
                fcmTokens: [],
                messageThreadIds: [],
                isMockData: true
            )
        ]
    }
    
    // put this in another view cuase it cant run here
    public func addNewMockData() {
        let docRefs = db.collection("profiles")
        
//        let id = UUID().uuidString
//        docRefs.document(id).setData([
//            "id": "",
//            "fullName": "",
//            "location": "",
//            "description": "",
//            "gender": "",
//            "age": "",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//        ])
//
        
        
        //Women
//        docRefs.document("8ff57448-387d-41f4-be45-bc879be23fbf").setData([
//            "id": "8ff57448-387d-41f4-be45-bc879be23fbf",
//            "fullName": "Vickie James",
//            "location": "Tampa,Fl",
//            "description": "",
//            "gender": "Female",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//        ])
//
//
//        docRefs.document("a6ce1c0b-0cdb-4eaf-bca8-d124e39819ea").setData([
//            "id": "a6ce1c0b-0cdb-4eaf-bca8-d124e39819ea",
//            "fullName": "Marilyn Reynolds",
//            "location": "Tampa,Fl",
//            "description": "",
//            "gender": "Female",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//        ])
//
//        docRefs.document("a6f3b606-93c9-4d6b-a4f8-98ee66181206").setData([
//           "id" : "a6f3b606-93c9-4d6b-a4f8-98ee66181206",
//            "fullName": "Kristina Anthony",
//            "location": "St.Pete,Fl",
//            "description": "",
//            "gender": "Female",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//        ])
//            docRefs.document("b37b0143-d3cc-495d-bfdc-1fec2d8fcf98").setData([
//            "id": "b37b0143-d3cc-495d-bfdc-1fec2d8fcf98",
//            "fullName": "Kathleen Brown",
//            "location": "Tampa,Fl",
//            "description": "",
//            "gender": "Female",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("d21387d1-fd1d-44b2-bc9c-03dfc8aa3e39").setData([
//            "id": "d21387d1-fd1d-44b2-bc9c-03dfc8aa3e39",
//            "fullName": "Stormy Beaulieu",
//            "location": "Tampa,Fl",
//            "description": "",
//            "gender": "Female",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("f244f9a3-1f31-4d02-a509-99cb00bd1481").setData([
//            "id": "f244f9a3-1f31-4d02-a509-99cb00bd1481",
//            "fullName": "Aurelia Driscoll",
//            "location": "Clearwater,Fl",
//            "description": "",
//            "gender": "Female",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("339b76b7-c58e-48fe-a181-eb67bbd21b49").setData([
//            "id": "339b76b7-c58e-48fe-a181-eb67bbd21b49",
//            "fullName": "Theresa Richey",
//            "location": "Tampa,Fl",
//            "description": "",
//            "gender": "Female",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("d7e891d8-b126-45c1-b878-5a3be0db7d10").setData([
//            "id": "d7e891d8-b126-45c1-b878-5a3be0db7d10",
//            "fullName": "Jane Conti",
//            "location": "Tampa,Fl",
//            "description": "",
//            "gender": "Female",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("f8c341e5-4e8e-42d6-ada8-25d6f8e9530f").setData([
//            "id": "f8c341e5-4e8e-42d6-ada8-25d6f8e9530f",
//            "fullName": "Linda Rice",
//            "location": "St.Pete,Fl",
//            "description": "",
//            "gender": "Female",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("ef49e44f-1957-4690-8bcf-473f9afe73cb").setData([
//            "id": "ef49e44f-1957-4690-8bcf-473f9afe73cb",
//            "fullName": "Ruth Campos",
//            "location": "Tampa,Fl",
//            "description": "",
//            "gender": "Female",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("26102e2e-0b2b-4ff9-9b9c-a2b87e9af06a").setData([
//            "id": "26102e2e-0b2b-4ff9-9b9c-a2b87e9af06a",
//            "fullName": "Angie Dyson",
//            "location": "Tampa,Fl",
//            "description": "",
//            "gender": "Female",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("a8b00895-411c-4cb0-8e19-559696ce6391").setData([
//            "id": "a8b00895-411c-4cb0-8e19-559696ce6391",
//            "fullName": "Ana Ramos",
//            "location": "Clearwater,Fl",
//            "description": "",
//            "gender": "Female",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("93cb0b79-6afc-41de-aad1-c28808de4a4a").setData([
//            "id": "93cb0b79-6afc-41de-aad1-c28808de4a4a",
//            "fullName": "Diane Cowan",
//            "location": "Tampa,Fl",
//            "description": "",
//            "gender": "Female",
//            "age": "25",
//        "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("9527bf1e-b5a8-4fe5-93e6-7db84ba91166").setData([
//            "id": "9527bf1e-b5a8-4fe5-93e6-7db84ba91166",
//            "fullName": "Dee Klimek",
//            "location": "Tampa,Fl",
//            "description": "",
//            "gender": "Female",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("4f5c7f12-c290-4a8a-abf6-deb8f396e325").setData([
//            "id": "4f5c7f12-c290-4a8a-abf6-deb8f396e325",
//            "fullName": "Charolette Spiker",
//            "location": "St.Pete,Fl",
//            "description": "",
//            "gender": "Female",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("e53f7388-b23a-4016-9ed9-4e86d4379f30").setData([
//            "id": "e53f7388-b23a-4016-9ed9-4e86d4379f30",
//            "fullName": "Claire Simpson",
//            "location": "Tampa,Fl",
//            "description": "",
//            "gender": "Female",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("25148c1d-e2f9-40c9-83ab-099c6e3c5322").setData([
//            "id": "25148c1d-e2f9-40c9-83ab-099c6e3c5322",
//            "fullName": "Cara Lowman",
//            "location": "Tampa,Fl",
//            "description": "",
//            "gender": "Female",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("176443d2-66ab-44d7-8ec8-cda127185a50").setData([
//            "id": "176443d2-66ab-44d7-8ec8-cda127185a50",
//            "fullName": "Stella Swafford",
//            "location": "Clearwater,Fl",
//            "description": "",
//            "gender": "Female",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("a87d620a-e0ae-4f10-bda4-5696a41cc5ac").setData([
//            "id": "a87d620a-e0ae-4f10-bda4-5696a41cc5ac",
//            "fullName": "Amy Leathers",
//            "location": "Tampa,Fl",
//            "description": "",
//            "gender": "Female",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("0c9004ad-623d-4575-9c1f-d192f1662f72").setData([
//            "id": "0c9004ad-623d-4575-9c1f-d192f1662f72",
//            "fullName": "Gemma Golden",
//            "location": "Tampa,Fl",
//            "description": "",
//            "gender": "Female",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("a764113f-b440-425f-bb28-7ccfb5b0b67d").setData([
//            "id": "a764113f-b440-425f-bb28-7ccfb5b0b67d",
//            "fullName": "Sandra Herring",
//            "location": "St.Pete,Fl",
//            "description": "",
//            "gender": "Female",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("5850c7a9-f735-4934-a735-fcffee610ce8").setData([
//            "id": "5850c7a9-f735-4934-a735-fcffee610ce8",
//            "fullName": "Mia Lewis",
//            "location": "Tampa,Fl",
//            "description": "",
//            "gender": "Female",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("62f36450-3711-46f6-ba0f-43ad5dca9004").setData([
//            "id": "62f36450-3711-46f6-ba0f-43ad5dca9004",
//            "fullName": "Alyssa Turner",
//            "location": "Tampa,Fl",
//            "description": "",
//            "gender": "Female",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("399e5315-6699-454f-9785-e756d78dda08").setData([
//            "id": "399e5315-6699-454f-9785-e756d78dda08",
//            "fullName": "Lana Taylor",
//            "location": "Clearwater,Fl",
//            "description": "",
//            "gender": "Female",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("3a775f5f-cfdf-49fe-9b01-e657aaf0e91c").setData([
//            "id": "3a775f5f-cfdf-49fe-9b01-e657aaf0e91c",
//            "fullName": "Diana Watson",
//            "location": "Tampa,Fl",
//            "description": "",
//            "gender": "Female",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
        
        docRefs.document("2d924df2-19a7-49ca-9621-5356bf42c425").setData([
        "id": "2d924df2-19a7-49ca-9621-5356bf42c425",
        "fullName": "Wynter Lindsey",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Female",
        "age": "25",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        
        docRefs.document("9869fc83-6043-43fc-9e3f-97c5e65e3ce1").setData([
        "id": "9869fc83-6043-43fc-9e3f-97c5e65e3ce1",
        "fullName": "Phoebe Allen",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Female",
        "age": "25",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        
        docRefs.document("4f4b7c75-331e-4a99-883a-962aee62d992").setData([
        "id": "4f4b7c75-331e-4a99-883a-962aee62d992",
        "fullName": "Savannah Long",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Female",
        "age": "25",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        
        docRefs.document("66fa9627-ea35-47c9-ad02-785bbec4997b").setData([
        "id": "66fa9627-ea35-47c9-ad02-785bbec4997b",
        "fullName": "Lexi Carter",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Female",
        "age": "25",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        
        docRefs.document("a0b9c8b8-f52d-45dd-96fe-51da15dc8ca1").setData([
        "id": "a0b9c8b8-f52d-45dd-96fe-51da15dc8ca1",
        "fullName": "Alaya Kim",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Female",
        "age": "25",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        
        docRefs.document("35726856-fc5f-4a32-a1d3-0cc9a373ffa6").setData([
        "id": "35726856-fc5f-4a32-a1d3-0cc9a373ffa6",
        "fullName": "Noelle Tyler",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Female",
        "age": "25",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        
        docRefs.document("77904145-1739-4fd0-b88c-7691a463f925").setData([
        "id": "77904145-1739-4fd0-b88c-7691a463f925",
        "fullName": "Daniella Reed",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Female",
        "age": "30",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        
        docRefs.document("291ca006-fa3c-457c-8f20-e43fe30726e2").setData([
        "id": "291ca006-fa3c-457c-8f20-e43fe30726e2",
        "fullName": "Payton Hill",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Female",
        "age": "25",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        
        docRefs.document("26242486-e28a-4cc0-8519-650e584b7304").setData([
        "id": "26242486-e28a-4cc0-8519-650e584b7304",
        "fullName": "Giselle Meyer",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Female",
        "age": "25",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        docRefs.document("828f54e3-22cf-438a-8481-d5e5edaead81").setData([
        "id": "828f54e3-22cf-438a-8481-d5e5edaead81",
        "fullName": "Elle Watson",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Female",
        "age": "22",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        
        
        docRefs.document("76058066-89f2-4c5f-a77a-7a01e5331302").setData([
        "id": "76058066-89f2-4c5f-a77a-7a01e5331302",
        "fullName": "Eva Cox",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Female",
        "age": "25",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        
        docRefs.document("d78496a3-a350-47fd-8d68-861086452bf5").setData([
        "id": "d78496a3-a350-47fd-8d68-861086452bf5",
        "fullName": "Myla Mckinney",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Female",
        "age": "28",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        
        docRefs.document("ff76fd27-e5e4-48a8-b354-3bed165d2d4d").setData([
        "id": "ff76fd27-e5e4-48a8-b354-3bed165d2d4d",
        "fullName": "Ayla Reyes",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Female",
        "age": "25",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        
        docRefs.document("66be07b5-95ca-491e-b157-42f9b45433f4").setData([
        "id": "66be07b5-95ca-491e-b157-42f9b45433f4",
        "fullName": "Journey Cook",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Female",
        "age": "25",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        
        docRefs.document("aaf421ff-c89f-45d2-af59-c67c33527061").setData([
        "id": "aaf421ff-c89f-45d2-af59-c67c33527061",
        "fullName": "Sloane Roberts",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Female",
        "age": "35",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        
        docRefs.document("804394ff-9a58-41dc-b0a5-809cc66a68f6").setData([
        "id": "804394ff-9a58-41dc-b0a5-809cc66a68f6",
        "fullName": "Maria Taylor",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Female",
        "age": "25",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        
        docRefs.document("ec57dd64-f53e-493f-8489-17f3fefaba98").setData([
        "id": "ec57dd64-f53e-493f-8489-17f3fefaba98",
        "fullName": "Daniella Stewart",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Female",
        "age": "25",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        
        docRefs.document("a54bb7c2-de23-46f6-a859-eba1739cc7a1").setData([
        "id": "a54bb7c2-de23-46f6-a859-eba1739cc7a1",
        "fullName": "Elise Porter",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Female",
        "age": "25",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        docRefs.document("ec953202-d7bf-4048-8bff-b5e1088410d4").setData([
        "id": "ec953202-d7bf-4048-8bff-b5e1088410d4",
        "fullName": "Samantha Davidson",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Female",
        "age": "20",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        
        docRefs.document("a9d0f188-a238-4852-b83b-620deb3622d8").setData([
        "id": "a9d0f188-a238-4852-b83b-620deb3622d8",
        "fullName": "Elle Bennet",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Female",
        "age": "25",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        
    //Men
        docRefs.document("cb182851-bd1e-4283-bebd-41bb589fa2cf").setData([
        "id": "cb182851-bd1e-4283-bebd-41bb589fa2cf",
        "fullName": "Jameson Meyer",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Male",
        "age": "25",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        
        docRefs.document("fc3f93b3-3b4f-4e91-9d8b-d8ffff60880f").setData([
        "id": "fc3f93b3-3b4f-4e91-9d8b-d8ffff60880f",
        "fullName": "Ryan Watson",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Male",
        "age": "25",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        
        docRefs.document("5d0d1cf2-0aa3-42ff-888b-f0a42c1f2cfe").setData([
        "id": "5d0d1cf2-0aa3-42ff-888b-f0a42c1f2cfe",
        "fullName": "Liam Cox",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Male",
        "age": "25",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        
        docRefs.document("4ff33e9e-0b8a-4122-a966-c0344298d8b6").setData([
        "id": "4ff33e9e-0b8a-4122-a966-c0344298d8b6",
        "fullName": "Luka Mckinney",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Male",
        "age": "25",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        
        docRefs.document("d55c9be4-e9af-47e1-8f1e-a10bbc8f435b").setData([
        "id": "d55c9be4-e9af-47e1-8f1e-a10bbc8f435b",
        "fullName": "Jonah Reyes",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Male",
        "age": "25",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        
        docRefs.document("3b0793d7-12ca-48aa-ac3c-91697e8fb068").setData([
        "id": "3b0793d7-12ca-48aa-ac3c-91697e8fb068",
        "fullName": "George Cook",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Male",
        "age": "25",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        
        docRefs.document("4a415dd1-2ffe-4abf-b12f-bede94789bea").setData([
        "id": "4a415dd1-2ffe-4abf-b12f-bede94789bea",
        "fullName": "Cody Roberts",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Male",
        "age": "25",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        
        docRefs.document("1fc94190-9718-4c99-9651-df44028b8933").setData([
        "id": "1fc94190-9718-4c99-9651-df44028b8933",
        "fullName": "Theo Taylor",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Male",
        "age": "25",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        
        docRefs.document("6933917c-3cc4-443e-83bc-4d758d2098dc").setData([
        "id": "6933917c-3cc4-443e-83bc-4d758d2098dc",
        "fullName": "Ryan Stewart",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Male",
        "age": "25",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        
        docRefs.document("a42ec640-ccda-4d31-a4be-7e936ff91791").setData([
        "id": "a42ec640-ccda-4d31-a4be-7e936ff91791",
        "fullName": "Erick Ward",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Male",
        "age": "25",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        
        docRefs.document("ddcc77c2-9ea7-40e8-85e4-5b6c1779d492").setData([
        "id": "ddcc77c2-9ea7-40e8-85e4-5b6c1779d492",
        "fullName": "Timothy Porter",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Male",
        "age": "25",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        
        docRefs.document("1fca9d9a-56d6-4e2d-8ddc-7712aa4b2fed").setData([
        "id": "1fca9d9a-56d6-4e2d-8ddc-7712aa4b2fed",
        "fullName": "George Stewart",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Male",
        "age": "25",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        
        docRefs.document("ae95f594-81d9-4968-9be3-0112eff5c85d").setData([
        "id": "ae95f594-81d9-4968-9be3-0112eff5c85d",
        "fullName": "Peter Davidson",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Male",
        "age": "25",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        
        docRefs.document("c108fa9d-b8b8-4ae8-920d-ec9ab3f7c623").setData([
        "id": "c108fa9d-b8b8-4ae8-920d-ec9ab3f7c623",
        "fullName": "Johnny Bennet",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Male",
        "age": "25",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        
        docRefs.document("4c2e44bf-3254-46f2-873a-d7c9e7b403d8").setData([
        "id": "4c2e44bf-3254-46f2-873a-d7c9e7b403d8",
        "fullName": "Thomas Horton",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Male",
        "age": "25",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        
        docRefs.document("dd1903b9-27a7-4fbc-b5cb-30d3304ffa88").setData([
        "id": "dd1903b9-27a7-4fbc-b5cb-30d3304ffa88",
        "fullName": "Jordan Gomez",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Male",
        "age": "25",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        
        docRefs.document("93abcb16-3008-4ab6-9d6d-850b99b6e47a").setData([
        "id": "93abcb16-3008-4ab6-9d6d-850b99b6e47a",
        "fullName": "Timothy Edwards",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Male",
        "age": "25",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        
        docRefs.document("0ad3c615-f59c-4e5c-8f57-30d70d238b07").setData([
        "id": "0ad3c615-f59c-4e5c-8f57-30d70d238b07",
        "fullName": "Nathan Hill",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Male",
        "age": "25",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        
        docRefs.document("8550cd55-9114-4688-b758-f3968a0796f5").setData([
        "id": "8550cd55-9114-4688-b758-f3968a0796f5",
        "fullName": "Adam Thomas",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Male",
        "age": "25",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        
        docRefs.document("7dee6646-1268-4826-8295-efce74297c60").setData([
        "id": "7dee6646-1268-4826-8295-efce74297c60",
        "fullName": "Troy Mccarty",
        "location": "Tampa,Fl",
        "description": "",
        "gender": "Male",
        "age": "25",
        "fcmTokens": [],
        "messageThreadIds": [],
        "isMockData": true
        ])
        
        
//            docRefs.document("be3597d0-f8af-4245-b45f-01d5adc75039").setData([
//            "id": "be3597d0-f8af-4245-b45f-01d5adc75039",
//            "fullName": "Aaron Bates",
//            "location": "Tampa,Fl",
//            "description": "",
//            "gender": "Male",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//                                          docRefs.document("1112314d-de9c-45bd-9f95-ce46898d7a97").setData([
//            "id": "1112314d-de9c-45bd-9f95-ce46898d7a97",
//            "fullName": "Alexander Kennedy",
//            "location": "Tampa,Fl",
//            "description": "",
//            "gender": "Male",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//                                          ])
//            docRefs.document("7c6f12f2-9cdf-404b-bfb1-3531fcba038c").setData([
//            "id": "7c6f12f2-9cdf-404b-bfb1-3531fcba038c",
//            "fullName": "Ben Thomas",
//            "location": "Tampa,Fl",
//            "description": "",
//            "gender": "Male",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("00d1726a-cb7f-423e-aa50-533dfba961e1").setData([
//            "id": "00d1726a-cb7f-423e-aa50-533dfba961e1",
//            "fullName": "Billy Kwasny",
//            "location": "St.Pete,Fl",
//            "description": "",
//            "gender": "Male",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("50ad62b7-3c90-40d6-8baf-459509e48e07").setData([
//            "id": "50ad62b7-3c90-40d6-8baf-459509e48e07",
//            "fullName": "Darrel Zidar",
//            "location": "Tampa,Fl",
//            "description": "",
//            "gender": "Male",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("dec2cc1d-3641-4e1a-93e0-9fe763ee36ef").setData([
//            "id": "dec2cc1d-3641-4e1a-93e0-9fe763ee36ef",
//            "fullName": "Dean Deperro",
//            "location": "Tampa,Fl",
//            "description": "",
//            "gender": "Male",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("24da908a-0951-407b-abec-b0b1e44ff4c0").setData([
//            "id": "24da908a-0951-407b-abec-b0b1e44ff4c0",
//            "fullName": "Donnell Shryer",
//            "location": "Clearwater,Fl",
//            "description": "",
//            "gender": "Male",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("c2165cd3-b124-4d65-aaaf-1441e2a81bf7").setData([
//            "id": "c2165cd3-b124-4d65-aaaf-1441e2a81bf7",
//            "fullName": "Erich Nabb",
//            "location": "Tampa,Fl",
//            "description": "",
//            "gender": "Male",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("7019b1e4-c0e9-4371-917d-2ac85c458210").setData([
//            "id": "7019b1e4-c0e9-4371-917d-2ac85c458210",
//            "fullName": "Frederic Zeiber",
//            "location": "Tampa,Fl",
//            "description": "",
//            "gender": "Male",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("77b8c5cf-aa52-4818-bdfa-b979079b1066").setData([
//            "id": "77b8c5cf-aa52-4818-bdfa-b979079b1066",
//            "fullName": "Garret Psaila",
//            "location": "St.Pete,Fl",
//            "description": "",
//            "gender": "Male",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("cce32d43-65bd-4f80-81da-f8e9b58da07d").setData([
//            "id": "cce32d43-65bd-4f80-81da-f8e9b58da07d",
//            "fullName": "Garry Buechler",
//            "location": "Tampa,Fl",
//            "description": "",
//            "gender": "Male",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("e2176174-56c2-48d0-8faf-aee1bd833ca7").setData([
//            "id": "e2176174-56c2-48d0-8faf-aee1bd833ca7",
//            "fullName": "Hans Vereen",
//            "location": "Tampa,Fl",
//            "description": "",
//            "gender": "Male",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("2a0fff25-8ad8-4fa4-8639-2067757ebc93").setData([
//            "id": "2a0fff25-8ad8-4fa4-8639-2067757ebc93",
//            "fullName": "Hugo Storrow",
//            "location": "Clearwater,Fl",
//            "description": "",
//            "gender": "Male",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("c7029440-0dee-4406-99e7-31d9a5cc3027").setData([
//            "id": "c7029440-0dee-4406-99e7-31d9a5cc3027",
//            "fullName": "Jake Hanig",
//            "location": "Tampa,Fl",
//            "description": "",
//            "gender": "Male",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("82e786c0-1a04-4304-9f17-6a88cc56a8eb").setData([
//            "id": "82e786c0-1a04-4304-9f17-6a88cc56a8eb",
//            "fullName": "Jefferey Cellars",
//            "location": "Tampa,Fl",
//            "description": "",
//            "gender": "Male",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("c01e933d-bbe1-41de-b542-bbe64a4b2561").setData([
//            "id": "c01e933d-bbe1-41de-b542-bbe64a4b2561",
//            "fullName": "Jim Valladares",
//            "location": "St.Pete,Fl",
//            "description": "",
//            "gender": "Male",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("fecada7b-4a43-4915-b131-2a0d5e08203c").setData([
//            "id": "fecada7b-4a43-4915-b131-2a0d5e08203c",
//            "fullName": "Kareem Bayerle",
//            "location": "Tampa,Fl",
//            "description": "",
//            "gender": "Male",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("d860ef2d-e354-49a9-9d5c-01fbcd17fba2").setData([
//            "id": "d860ef2d-e354-49a9-9d5c-01fbcd17fba2",
//            "fullName": "Lanny Peeters",
//            "location": "Tampa,Fl",
//            "description": "",
//            "gender": "Male",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("ca9aca07-a8e2-4166-9a0c-15d5d74a5a78").setData([
//            "id": "ca9aca07-a8e2-4166-9a0c-15d5d74a5a78",
//            "fullName": "Luciano Sienkiewicz",
//            "location": "Clearwater,Fl",
//            "description": "",
//            "gender": "Male",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("9c7e67ee-74bf-4a82-8c13-bf13459bfdc0").setData([
//            "id": "9c7e67ee-74bf-4a82-8c13-bf13459bfdc0",
//            "fullName": "Luke Wachowicz",
//            "location": "Tampa,Fl",
//            "description": "",
//            "gender": "Male",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("c8819f16-5e27-49dc-8949-8f9aacbd2cb4").setData([
//            "id": "c8819f16-5e27-49dc-8949-8f9aacbd2cb4",
//            "fullName": "Mason Baxter",
//            "location": "Tampa,Fl",
//            "description": "",
//            "gender": "Male",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("dbcd8e0a-9a3c-4bc7-bd0d-723705e1d95b").setData([
//            "id": "dbcd8e0a-9a3c-4bc7-bd0d-723705e1d95b",
//            "fullName": "Mitchel Hoeper",
//            "location": "St.Pete,Fl",
//            "description": "",
//            "gender": "Male",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("dcffd2d8-929d-4439-9728-357a7c4fe582").setData([
//            "id": "dcffd2d8-929d-4439-9728-357a7c4fe582",
//            "fullName": "Mohamed Stathis",
//            "location": "Tampa,Fl",
//            "description": "",
//            "gender": "Male",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("c115223c-c494-4a33-b914-5d00d91d3eb9").setData([
//            "id": "c115223c-c494-4a33-b914-5d00d91d3eb9",
//            "fullName": "Oliver Mccall",
//            "location": "Tampa,Fl",
//            "description": "",
//            "gender": "Male",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("70437a1b-88c9-4423-8eef-3a4afe60a592").setData([
//            "id": "70437a1b-88c9-4423-8eef-3a4afe60a592",
//            "fullName": "Ray Eddleston",
//            "location": "Clearwater,Fl",
//            "description": "",
//            "gender": "Male",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//            docRefs.document("19457ad4-3451-4316-9921-c87aadb7d9ae").setData([
//            "id": "19457ad4-3451-4316-9921-c87aadb7d9ae",
//            "fullName": "Rob Dominowski",
//            "location": "Tampa,Fl",
//            "description": "",
//            "gender": "Male",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//            ])
//
//            docRefs.document("28527272-2ac8-42b5-8fc3-f1af5a5770cb").setData([
//            "id": "28527272-2ac8-42b5-8fc3-f1af5a5770cb",
//            "fullName": "Scottie Stefek",
//            "location": "Tampa,Fl",
//            "description": "",
//            "gender": "Male",
//            "age": "25",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//        ])
    }
    
    public func addMockFilterData() {
        let docRefs = db.collection("filters")
        
//        let id = UUID().uuidString
//        docRefs.document(id).setData([
//            "id": "",
//            "fullName": "",
//            "location": "",
//            "description": "",
//            "gender": "",
//            "age": "",
//            "fcmTokens": [],
//            "messageThreadIds": [],
//            "isMockData": true
//        ])
//
                let id = UUID().uuidString
                docRefs.document(id).setData([
                    "id": id,
                    "userProfileId": "e53f7388-b23a-4016-9ed9-4e86d4379f30",
                    "category": "Cuisine",
                    "type": "American",
                    "gender": "Pick",
                    "location": "Tampa",
                    "ageRangeFrom": "20",
                    "ageRangeTo": "70",
                    "isMockData": true
                ])
        
        let id2 = UUID().uuidString
        docRefs.document(id2).setData([
            "id": id2,
            "userProfileId": "ef49e44f-1957-4690-8bcf-473f9afe73cb",
            "category": "Drinks",
            "type": "Smoothies",
            "gender": "Female",
            "location": "American",
            "ageRangeFrom": "20",
            "ageRangeTo": "50",
            "isMockData": true
        ])
        
        let id3 = UUID().uuidString
        docRefs.document(id3).setData([
            "id": id3,
            "userProfileId": "f244f9a3-1f31-4d02-a509-99cb00bd1481",
            "category": "Cuisine",
            "type": "American",
            "gender": "Female",
            "location": "Tampa",
            "ageRangeFrom": "24",
            "ageRangeTo": "66",
            "isMockData": true
        ])
        
        let id4 = UUID().uuidString
        docRefs.document(id4).setData([
            "id": id4,
            "userProfileId": "f8c341e5-4e8e-42d6-ada8-25d6f8e9530f",
            "category": "Drinks",
            "type": "Soda",
            "gender": "Male",
            "location": "Tampa",
            "ageRangeFrom": "26",
            "ageRangeTo": "40",
            "isMockData": true
        ])
        
        let id5 = UUID().uuidString
        docRefs.document(id5).setData([
            "id": id5,
            "userProfileId": "fecada7b-4a43-4915-b131-2a0d5e08203c",
            "category": "Happy Hour",
            "type": "Beer",
            "gender": "Male",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        

    }
}


