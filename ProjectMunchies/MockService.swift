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
    
    //    static var userProfileSampleData: ProfileModel {
    //        ProfileModel(
    //            id: "",
    //            fullName: "",
    //            location: "",
    //            description: "",
    //            gender: "",
    //            age: "",
    //            fcmTokens: [],
    //            messageThreadIds: [],
    //            isMockData: true
    //        )
    //    }
    
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
    
    //    static var profilesSampleData: [ProfileModel] {
    //        [
    //            //Women
    //            ProfileModel(
    //                id: "8ff57448-387d-41f4-be45-bc879be23fbf",
    //                fullName: "Vickie James",
    //                location: "Tampa,Fl",
    //                description: "",
    //                gender: "Female",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "a6ce1c0b-0cdb-4eaf-bca8-d124e39819ea",
    //                fullName: "Marilyn Reynolds",
    //                location: "Tampa,Fl",
    //                description: "",
    //                gender: "Female",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "a6f3b606-93c9-4d6b-a4f8-98ee66181206",
    //                fullName: "Kristina Anthony",
    //                location: "St.Pete,Fl",
    //                description: "",
    //                gender: "Female",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "b37b0143-d3cc-495d-bfdc-1fec2d8fcf98",
    //                fullName: "Kathleen Brown",
    //                location: "Tampa,Fl",
    //                description: "",
    //                gender: "Female",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "d21387d1-fd1d-44b2-bc9c-03dfc8aa3e39",
    //                fullName: "Stormy Beaulieu",
    //                location: "Tampa,Fl",
    //                description: "",
    //                gender: "Female",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "f244f9a3-1f31-4d02-a509-99cb00bd1481",
    //                fullName: "Aurelia Driscoll",
    //                location: "Clearwater,Fl",
    //                description: "",
    //                gender: "Female",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "339b76b7-c58e-48fe-a181-eb67bbd21b49",
    //                fullName: "Theresa Richey",
    //                location: "Tampa,Fl",
    //                description: "",
    //                gender: "Female",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "d7e891d8-b126-45c1-b878-5a3be0db7d10",
    //                fullName: "Jane Conti",
    //                location: "Tampa,Fl",
    //                description: "",
    //                gender: "Female",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "f8c341e5-4e8e-42d6-ada8-25d6f8e9530f",
    //                fullName: "Linda Rice",
    //                location: "St.Pete,Fl",
    //                description: "",
    //                gender: "Female",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //
    //            ProfileModel(
    //                id: "ef49e44f-1957-4690-8bcf-473f9afe73cb",
    //                fullName: "Ruth Campos",
    //                location: "Tampa,Fl",
    //                description: "",
    //                gender: "Female",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "26102e2e-0b2b-4ff9-9b9c-a2b87e9af06a",
    //                fullName: "Angie Dyson",
    //                location: "Tampa,Fl",
    //                description: "",
    //                gender: "Female",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "a8b00895-411c-4cb0-8e19-559696ce6391",
    //                fullName: "Ana Ramos",
    //                location: "Clearwater,Fl",
    //                description: "",
    //                gender: "Female",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "93cb0b79-6afc-41de-aad1-c28808de4a4a",
    //                fullName: "Diane Cowan",
    //                location: "Tampa,Fl",
    //                description: "",
    //                gender: "Female",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "9527bf1e-b5a8-4fe5-93e6-7db84ba91166",
    //                fullName: "Dee Klimek",
    //                location: "Tampa,Fl",
    //                description: "",
    //                gender: "Female",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "4f5c7f12-c290-4a8a-abf6-deb8f396e325",
    //                fullName: "Charolette Spiker",
    //                location: "St.Pete,Fl",
    //                description: "",
    //                gender: "Female",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "e53f7388-b23a-4016-9ed9-4e86d4379f30",
    //                fullName: "Claire Simpson",
    //                location: "Tampa,Fl",
    //                description: "",
    //                gender: "Female",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "25148c1d-e2f9-40c9-83ab-099c6e3c5322",
    //                fullName: "Cara Lowman",
    //                location: "Tampa,Fl",
    //                description: "",
    //                gender: "Female",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "176443d2-66ab-44d7-8ec8-cda127185a50",
    //                fullName: "Stella Swafford",
    //                location: "Clearwater,Fl",
    //                description: "",
    //                gender: "Female",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "a87d620a-e0ae-4f10-bda4-5696a41cc5ac",
    //                fullName: "Amy Leathers",
    //                location: "Tampa,Fl",
    //                description: "",
    //                gender: "Female",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "0c9004ad-623d-4575-9c1f-d192f1662f72",
    //                fullName: "Gemma Golden",
    //                location: "Tampa,Fl",
    //                description: "",
    //                gender: "Female",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "a764113f-b440-425f-bb28-7ccfb5b0b67d",
    //                fullName: "Sandra Herring",
    //                location: "St.Pete,Fl",
    //                description: "",
    //                gender: "Female",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "5850c7a9-f735-4934-a735-fcffee610ce8",
    //                fullName: "Mia Lewis",
    //                location: "Tampa,Fl",
    //                description: "",
    //                gender: "Female",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "62f36450-3711-46f6-ba0f-43ad5dca9004",
    //                fullName: "Alyssa Turner",
    //                location: "Tampa,Fl",
    //                description: "",
    //                gender: "Female",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "399e5315-6699-454f-9785-e756d78dda08",
    //                fullName: "Lana Taylor",
    //                location: "Clearwater,Fl",
    //                description: "",
    //                gender: "Female",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "3a775f5f-cfdf-49fe-9b01-e657aaf0e91c",
    //                fullName: "Diana Watson",
    //                location: "Tampa,Fl",
    //                description: "",
    //                gender: "Female",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //
    //
    //
    //            //Men
    //            ProfileModel(
    //                id: "be3597d0-f8af-4245-b45f-01d5adc75039",
    //                fullName: "Aaron Bates",
    //                location: "Tampa,Fl",
    //                description: "",
    //                gender: "Male",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "1112314d-de9c-45bd-9f95-ce46898d7a97",
    //                fullName: "Alexander Kennedy",
    //                location: "Tampa,Fl",
    //                description: "",
    //                gender: "Male",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "7c6f12f2-9cdf-404b-bfb1-3531fcba038c",
    //                fullName: "Ben Thomas",
    //                location: "Tampa,Fl",
    //                description: "",
    //                gender: "Male",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "00d1726a-cb7f-423e-aa50-533dfba961e1",
    //                fullName: "Billy Kwasny",
    //                location: "St.Pete,Fl",
    //                description: "",
    //                gender: "Male",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "50ad62b7-3c90-40d6-8baf-459509e48e07",
    //                fullName: "Darrel Zidar",
    //                location: "Tampa,Fl",
    //                description: "",
    //                gender: "Male",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "dec2cc1d-3641-4e1a-93e0-9fe763ee36ef",
    //                fullName: "Dean Deperro",
    //                location: "Tampa,Fl",
    //                description: "",
    //                gender: "Male",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "24da908a-0951-407b-abec-b0b1e44ff4c0",
    //                fullName: "Donnell Shryer",
    //                location: "Clearwater,Fl",
    //                description: "",
    //                gender: "Male",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "c2165cd3-b124-4d65-aaaf-1441e2a81bf7",
    //                fullName: "Erich Nabb",
    //                location: "Tampa,Fl",
    //                description: "",
    //                gender: "Male",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "7019b1e4-c0e9-4371-917d-2ac85c458210",
    //                fullName: "Frederic Zeiber",
    //                location: "Tampa,Fl",
    //                description: "",
    //                gender: "Male",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "77b8c5cf-aa52-4818-bdfa-b979079b1066",
    //                fullName: "Garret Psaila",
    //                location: "St.Pete,Fl",
    //                description: "",
    //                gender: "Male",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "cce32d43-65bd-4f80-81da-f8e9b58da07d",
    //                fullName: "Garry Buechler",
    //                location: "Tampa,Fl",
    //                description: "",
    //                gender: "Male",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "e2176174-56c2-48d0-8faf-aee1bd833ca7",
    //                fullName: "Hans Vereen",
    //                location: "Tampa,Fl",
    //                description: "",
    //                gender: "Male",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "2a0fff25-8ad8-4fa4-8639-2067757ebc93",
    //                fullName: "Hugo Storrow",
    //                location: "Clearwater,Fl",
    //                description: "",
    //                gender: "Male",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "c7029440-0dee-4406-99e7-31d9a5cc3027",
    //                fullName: "Jake Hanig",
    //                location: "Tampa,Fl",
    //                description: "",
    //                gender: "Male",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "82e786c0-1a04-4304-9f17-6a88cc56a8eb",
    //                fullName: "Jefferey Cellars",
    //                location: "Tampa,Fl",
    //                description: "",
    //                gender: "Male",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "c01e933d-bbe1-41de-b542-bbe64a4b2561",
    //                fullName: "Jim Valladares",
    //                location: "St.Pete,Fl",
    //                description: "",
    //                gender: "Male",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "fecada7b-4a43-4915-b131-2a0d5e08203c",
    //                fullName: "Kareem Bayerle",
    //                location: "Tampa,Fl",
    //                description: "",
    //                gender: "Male",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "d860ef2d-e354-49a9-9d5c-01fbcd17fba2",
    //                fullName: "Lanny Peeters",
    //                location: "Tampa,Fl",
    //                description: "",
    //                gender: "Male",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "ca9aca07-a8e2-4166-9a0c-15d5d74a5a78",
    //                fullName: "Luciano Sienkiewicz",
    //                location: "Clearwater,Fl",
    //                description: "",
    //                gender: "Male",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "9c7e67ee-74bf-4a82-8c13-bf13459bfdc0",
    //                fullName: "Luke Wachowicz",
    //                location: "Tampa,Fl",
    //                description: "",
    //                gender: "Male",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "c8819f16-5e27-49dc-8949-8f9aacbd2cb4",
    //                fullName: "Mason Baxter",
    //                location: "Tampa,Fl",
    //                description: "",
    //                gender: "Male",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "dbcd8e0a-9a3c-4bc7-bd0d-723705e1d95b",
    //                fullName: "Mitchel Hoeper",
    //                location: "St.Pete,Fl",
    //                description: "",
    //                gender: "Male",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "dcffd2d8-929d-4439-9728-357a7c4fe582",
    //                fullName: "Mohamed Stathis",
    //                location: "Tampa,Fl",
    //                description: "",
    //                gender: "Male",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "c115223c-c494-4a33-b914-5d00d91d3eb9",
    //                fullName: "Oliver Mccall",
    //                location: "Tampa,Fl",
    //                description: "",
    //                gender: "Male",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "70437a1b-88c9-4423-8eef-3a4afe60a592",
    //                fullName: "Ray Eddleston",
    //                location: "Clearwater,Fl",
    //                description: "",
    //                gender: "Male",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "19457ad4-3451-4316-9921-c87aadb7d9ae",
    //                fullName: "Rob Dominowski",
    //                location: "Tampa,Fl",
    //                description: "",
    //                gender: "Male",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            ),
    //            ProfileModel(
    //                id: "28527272-2ac8-42b5-8fc3-f1af5a5770cb",
    //                fullName: "Scottie Stefek",
    //                location: "Tampa,Fl",
    //                description: "",
    //                gender: "Male",
    //                age: "25",
    //                fcmTokens: [],
    //                messageThreadIds: [],
    //                isMockData: true
    //            )
    //        ]
    //    }
    
    static var feedSampleData: [FeedModel] {
        [
            FeedModel(
                id: "",
                text: "",
                timeStamp: Date()
            ),
            FeedModel(
                id: "",
                text: "",
                timeStamp: Date()
            ),
            FeedModel(
                id: "",
                text: "",
                timeStamp: Date()
            ),
            FeedModel(
                id: "",
                text: "",
                timeStamp: Date()
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
        //ALREADY DONE
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
        //ALREADY DONE
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
        //ALREADY DONE
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
        
        //ALREADY DONE
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
        
        //        docRefs.document("2d924df2-19a7-49ca-9621-5356bf42c425").setData([
        //        "id": "2d924df2-19a7-49ca-9621-5356bf42c425",
        //        "fullName": "Wynter Lindsey",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Female",
        //        "age": "25",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        //
        //        docRefs.document("9869fc83-6043-43fc-9e3f-97c5e65e3ce1").setData([
        //        "id": "9869fc83-6043-43fc-9e3f-97c5e65e3ce1",
        //        "fullName": "Phoebe Allen",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Female",
        //        "age": "25",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        //
        //        docRefs.document("4f4b7c75-331e-4a99-883a-962aee62d992").setData([
        //        "id": "4f4b7c75-331e-4a99-883a-962aee62d992",
        //        "fullName": "Savannah Long",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Female",
        //        "age": "25",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        //
        //        docRefs.document("66fa9627-ea35-47c9-ad02-785bbec4997b").setData([
        //        "id": "66fa9627-ea35-47c9-ad02-785bbec4997b",
        //        "fullName": "Lexi Carter",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Female",
        //        "age": "25",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        //
        //        docRefs.document("a0b9c8b8-f52d-45dd-96fe-51da15dc8ca1").setData([
        //        "id": "a0b9c8b8-f52d-45dd-96fe-51da15dc8ca1",
        //        "fullName": "Alaya Kim",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Female",
        //        "age": "25",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        //
        //        docRefs.document("35726856-fc5f-4a32-a1d3-0cc9a373ffa6").setData([
        //        "id": "35726856-fc5f-4a32-a1d3-0cc9a373ffa6",
        //        "fullName": "Noelle Tyler",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Female",
        //        "age": "25",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        //
        //        docRefs.document("77904145-1739-4fd0-b88c-7691a463f925").setData([
        //        "id": "77904145-1739-4fd0-b88c-7691a463f925",
        //        "fullName": "Daniella Reed",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Female",
        //        "age": "30",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        //
        //        docRefs.document("291ca006-fa3c-457c-8f20-e43fe30726e2").setData([
        //        "id": "291ca006-fa3c-457c-8f20-e43fe30726e2",
        //        "fullName": "Payton Hill",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Female",
        //        "age": "25",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        //
        //        docRefs.document("26242486-e28a-4cc0-8519-650e584b7304").setData([
        //        "id": "26242486-e28a-4cc0-8519-650e584b7304",
        //        "fullName": "Giselle Meyer",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Female",
        //        "age": "25",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        //        docRefs.document("828f54e3-22cf-438a-8481-d5e5edaead81").setData([
        //        "id": "828f54e3-22cf-438a-8481-d5e5edaead81",
        //        "fullName": "Elle Watson",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Female",
        //        "age": "22",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        //
        //
        //        docRefs.document("76058066-89f2-4c5f-a77a-7a01e5331302").setData([
        //        "id": "76058066-89f2-4c5f-a77a-7a01e5331302",
        //        "fullName": "Eva Cox",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Female",
        //        "age": "25",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        //
        //        docRefs.document("d78496a3-a350-47fd-8d68-861086452bf5").setData([
        //        "id": "d78496a3-a350-47fd-8d68-861086452bf5",
        //        "fullName": "Myla Mckinney",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Female",
        //        "age": "28",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        //
        //        docRefs.document("ff76fd27-e5e4-48a8-b354-3bed165d2d4d").setData([
        //        "id": "ff76fd27-e5e4-48a8-b354-3bed165d2d4d",
        //        "fullName": "Ayla Reyes",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Female",
        //        "age": "25",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        //
        //        docRefs.document("66be07b5-95ca-491e-b157-42f9b45433f4").setData([
        //        "id": "66be07b5-95ca-491e-b157-42f9b45433f4",
        //        "fullName": "Journey Cook",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Female",
        //        "age": "25",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        //
        //        docRefs.document("aaf421ff-c89f-45d2-af59-c67c33527061").setData([
        //        "id": "aaf421ff-c89f-45d2-af59-c67c33527061",
        //        "fullName": "Sloane Roberts",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Female",
        //        "age": "35",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        //
        //        docRefs.document("804394ff-9a58-41dc-b0a5-809cc66a68f6").setData([
        //        "id": "804394ff-9a58-41dc-b0a5-809cc66a68f6",
        //        "fullName": "Maria Taylor",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Female",
        //        "age": "25",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        //
        //        docRefs.document("ec57dd64-f53e-493f-8489-17f3fefaba98").setData([
        //        "id": "ec57dd64-f53e-493f-8489-17f3fefaba98",
        //        "fullName": "Daniella Stewart",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Female",
        //        "age": "25",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        //
        //        docRefs.document("a54bb7c2-de23-46f6-a859-eba1739cc7a1").setData([
        //        "id": "a54bb7c2-de23-46f6-a859-eba1739cc7a1",
        //        "fullName": "Elise Porter",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Female",
        //        "age": "25",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        //        docRefs.document("ec953202-d7bf-4048-8bff-b5e1088410d4").setData([
        //        "id": "ec953202-d7bf-4048-8bff-b5e1088410d4",
        //        "fullName": "Samantha Davidson",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Female",
        //        "age": "20",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        //
        //        docRefs.document("a9d0f188-a238-4852-b83b-620deb3622d8").setData([
        //        "id": "a9d0f188-a238-4852-b83b-620deb3622d8",
        //        "fullName": "Elle Bennet",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Female",
        //        "age": "25",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        
        
        
        
        
        //Men
        //        docRefs.document("cb182851-bd1e-4283-bebd-41bb589fa2cf").setData([
        //        "id": "cb182851-bd1e-4283-bebd-41bb589fa2cf",
        //        "fullName": "Jameson Meyer",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Male",
        //        "age": "25",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        //
        //        docRefs.document("fc3f93b3-3b4f-4e91-9d8b-d8ffff60880f").setData([
        //        "id": "fc3f93b3-3b4f-4e91-9d8b-d8ffff60880f",
        //        "fullName": "Ryan Watson",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Male",
        //        "age": "25",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        //
        //        docRefs.document("5d0d1cf2-0aa3-42ff-888b-f0a42c1f2cfe").setData([
        //        "id": "5d0d1cf2-0aa3-42ff-888b-f0a42c1f2cfe",
        //        "fullName": "Liam Cox",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Male",
        //        "age": "25",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        //
        //        docRefs.document("4ff33e9e-0b8a-4122-a966-c0344298d8b6").setData([
        //        "id": "4ff33e9e-0b8a-4122-a966-c0344298d8b6",
        //        "fullName": "Luka Mckinney",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Male",
        //        "age": "25",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        //
        //        docRefs.document("d55c9be4-e9af-47e1-8f1e-a10bbc8f435b").setData([
        //        "id": "d55c9be4-e9af-47e1-8f1e-a10bbc8f435b",
        //        "fullName": "Jonah Reyes",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Male",
        //        "age": "25",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        //
        //        docRefs.document("3b0793d7-12ca-48aa-ac3c-91697e8fb068").setData([
        //        "id": "3b0793d7-12ca-48aa-ac3c-91697e8fb068",
        //        "fullName": "George Cook",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Male",
        //        "age": "25",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        //
        //        docRefs.document("4a415dd1-2ffe-4abf-b12f-bede94789bea").setData([
        //        "id": "4a415dd1-2ffe-4abf-b12f-bede94789bea",
        //        "fullName": "Cody Roberts",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Male",
        //        "age": "25",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        //
        //        docRefs.document("1fc94190-9718-4c99-9651-df44028b8933").setData([
        //        "id": "1fc94190-9718-4c99-9651-df44028b8933",
        //        "fullName": "Theo Taylor",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Male",
        //        "age": "25",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        //
        //        docRefs.document("6933917c-3cc4-443e-83bc-4d758d2098dc").setData([
        //        "id": "6933917c-3cc4-443e-83bc-4d758d2098dc",
        //        "fullName": "Ryan Stewart",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Male",
        //        "age": "25",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        //
        //        docRefs.document("a42ec640-ccda-4d31-a4be-7e936ff91791").setData([
        //        "id": "a42ec640-ccda-4d31-a4be-7e936ff91791",
        //        "fullName": "Erick Ward",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Male",
        //        "age": "25",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        //
        //        docRefs.document("ddcc77c2-9ea7-40e8-85e4-5b6c1779d492").setData([
        //        "id": "ddcc77c2-9ea7-40e8-85e4-5b6c1779d492",
        //        "fullName": "Timothy Porter",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Male",
        //        "age": "25",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        //
        //        docRefs.document("1fca9d9a-56d6-4e2d-8ddc-7712aa4b2fed").setData([
        //        "id": "1fca9d9a-56d6-4e2d-8ddc-7712aa4b2fed",
        //        "fullName": "George Stewart",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Male",
        //        "age": "25",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        //
        //        docRefs.document("ae95f594-81d9-4968-9be3-0112eff5c85d").setData([
        //        "id": "ae95f594-81d9-4968-9be3-0112eff5c85d",
        //        "fullName": "Peter Davidson",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Male",
        //        "age": "25",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        //
        //        docRefs.document("c108fa9d-b8b8-4ae8-920d-ec9ab3f7c623").setData([
        //        "id": "c108fa9d-b8b8-4ae8-920d-ec9ab3f7c623",
        //        "fullName": "Johnny Bennet",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Male",
        //        "age": "25",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        //
        //        docRefs.document("4c2e44bf-3254-46f2-873a-d7c9e7b403d8").setData([
        //        "id": "4c2e44bf-3254-46f2-873a-d7c9e7b403d8",
        //        "fullName": "Thomas Horton",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Male",
        //        "age": "25",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        //
        //        docRefs.document("dd1903b9-27a7-4fbc-b5cb-30d3304ffa88").setData([
        //        "id": "dd1903b9-27a7-4fbc-b5cb-30d3304ffa88",
        //        "fullName": "Jordan Gomez",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Male",
        //        "age": "25",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        //
        //        docRefs.document("93abcb16-3008-4ab6-9d6d-850b99b6e47a").setData([
        //        "id": "93abcb16-3008-4ab6-9d6d-850b99b6e47a",
        //        "fullName": "Timothy Edwards",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Male",
        //        "age": "25",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        //
        //        docRefs.document("0ad3c615-f59c-4e5c-8f57-30d70d238b07").setData([
        //        "id": "0ad3c615-f59c-4e5c-8f57-30d70d238b07",
        //        "fullName": "Nathan Hill",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Male",
        //        "age": "25",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        //
        //        docRefs.document("8550cd55-9114-4688-b758-f3968a0796f5").setData([
        //        "id": "8550cd55-9114-4688-b758-f3968a0796f5",
        //        "fullName": "Adam Thomas",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Male",
        //        "age": "25",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        //
        //        docRefs.document("7dee6646-1268-4826-8295-efce74297c60").setData([
        //        "id": "7dee6646-1268-4826-8295-efce74297c60",
        //        "fullName": "Troy Mccarty",
        //        "location": "Tampa,Fl",
        //        "description": "",
        //        "gender": "Male",
        //        "age": "25",
        //        "fcmTokens": [],
        //        "messageThreadIds": [],
        //        "isMockData": true
        //        ])
        
        
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
        //ALREADY DONE
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
        //                let id = UUID().uuidString
        //                docRefs.document(id).setData([
        //                    "id": id,
        //                    "userProfileId": "e53f7388-b23a-4016-9ed9-4e86d4379f30",
        //                    "category": "Cuisine",
        //                    "type": "American",
        //                    "gender": "Pick",
        //                    "location": "Tampa",
        //                    "ageRangeFrom": "20",
        //                    "ageRangeTo": "70",
        //                    "isMockData": true
        //                ])
        //
        //        let id2 = UUID().uuidString
        //        docRefs.document(id2).setData([
        //            "id": id2,
        //            "userProfileId": "ef49e44f-1957-4690-8bcf-473f9afe73cb",
        //            "category": "Drinks",
        //            "type": "Smoothies",
        //            "gender": "Female",
        //            "location": "American",
        //            "ageRangeFrom": "20",
        //            "ageRangeTo": "50",
        //            "isMockData": true
        //        ])
        //
        //        let id3 = UUID().uuidString
        //        docRefs.document(id3).setData([
        //            "id": id3,
        //            "userProfileId": "f244f9a3-1f31-4d02-a509-99cb00bd1481",
        //            "category": "Cuisine",
        //            "type": "American",
        //            "gender": "Female",
        //            "location": "Tampa",
        //            "ageRangeFrom": "24",
        //            "ageRangeTo": "66",
        //            "isMockData": true
        //        ])
        //
        //        let id4 = UUID().uuidString
        //        docRefs.document(id4).setData([
        //            "id": id4,
        //            "userProfileId": "f8c341e5-4e8e-42d6-ada8-25d6f8e9530f",
        //            "category": "Drinks",
        //            "type": "Soda",
        //            "gender": "Male",
        //            "location": "Tampa",
        //            "ageRangeFrom": "26",
        //            "ageRangeTo": "40",
        //            "isMockData": true
        //        ])
        //
        //        let id5 = UUID().uuidString
        //        docRefs.document(id5).setData([
        //            "id": id5,
        //            "userProfileId": "fecada7b-4a43-4915-b131-2a0d5e08203c",
        //            "category": "Happy Hour",
        //            "type": "Beer",
        //            "gender": "Male",
        //            "location": "Tampa",
        //            "ageRangeFrom": "18",
        //            "ageRangeTo": "70",
        //            "isMockData": true
        //        ])
        //
        
        let id6 = UUID().uuidString
        docRefs.document(id6).setData([
            "id": id6,
            "userProfileId": "8ff57448-387d-41f4-be45-bc879be23fbf",
            "category": "Happy Hour",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id7 = UUID().uuidString
        docRefs.document(id7).setData([
            "id": id7,
            "userProfileId": "a6ce1c0b-0cdb-4eaf-bca8-d124e39819ea",
            "category": "Cuisine",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id8 = UUID().uuidString
        docRefs.document(id8).setData([
            "id": id8,
            "userProfileId": "a6f3b606-93c9-4d6b-a4f8-98ee66181206",
            "category": "Cuisine",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id9 = UUID().uuidString
        docRefs.document(id9).setData([
            "id": id9,
            "userProfileId": "b37b0143-d3cc-495d-bfdc-1fec2d8fcf98",
            "category": "Happy Hour",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id10 = UUID().uuidString
        docRefs.document(id10).setData([
            "id": id10,
            "userProfileId": "d21387d1-fd1d-44b2-bc9c-03dfc8aa3e39",
            "category": "Cuisine",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id11 = UUID().uuidString
        docRefs.document(id11).setData([
            "id": id11,
            "userProfileId": "339b76b7-c58e-48fe-a181-eb67bbd21b49",
            "category": "Happy Hour",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id12 = UUID().uuidString
        docRefs.document(id12).setData([
            "id": id12,
            "userProfileId": "d7e891d8-b126-45c1-b878-5a3be0db7d10",
            "category": "Cuisine",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id13 = UUID().uuidString
        docRefs.document(id13).setData([
            "id": id13,
            "userProfileId": "26102e2e-0b2b-4ff9-9b9c-a2b87e9af06a",
            "category": "Cuisine",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id14 = UUID().uuidString
        docRefs.document(id14).setData([
            "id": id14,
            "userProfileId": "a8b00895-411c-4cb0-8e19-559696ce6391",
            "category": "Cuisine",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id15 = UUID().uuidString
        docRefs.document(id15).setData([
            "id": id15,
            "userProfileId": "93cb0b79-6afc-41de-aad1-c28808de4a4a",
            "category": "Happy Hour",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id16 = UUID().uuidString
        docRefs.document(id16).setData([
            "id": id16,
            "userProfileId": "9527bf1e-b5a8-4fe5-93e6-7db84ba91166",
            "category": "Cuisine",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id17 = UUID().uuidString
        docRefs.document(id17).setData([
            "id": id17,
            "userProfileId": "4f5c7f12-c290-4a8a-abf6-deb8f396e325",
            "category": "Cuisine",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        
        let id18 = UUID().uuidString
        docRefs.document(id18).setData([
            "id": id18,
            "userProfileId": "25148c1d-e2f9-40c9-83ab-099c6e3c5322",
            "category": "Drinks",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id19 = UUID().uuidString
        docRefs.document(id19).setData([
            "id": id19,
            "userProfileId": "176443d2-66ab-44d7-8ec8-cda127185a50",
            "category": "Happy Hour",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id20 = UUID().uuidString
        docRefs.document(id20).setData([
            "id": id20,
            "userProfileId": "a87d620a-e0ae-4f10-bda4-5696a41cc5ac",
            "category": "Cuisine",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id21 = UUID().uuidString
        docRefs.document(id21).setData([
            "id": id21,
            "userProfileId": "0c9004ad-623d-4575-9c1f-d192f1662f72",
            "category": "Cuisine",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id22 = UUID().uuidString
        docRefs.document(id22).setData([
            "id": id22,
            "userProfileId": "a764113f-b440-425f-bb28-7ccfb5b0b67d",
            "category": "Happy Hour",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id23 = UUID().uuidString
        docRefs.document(id23).setData([
            "id": id23,
            "userProfileId": "5850c7a9-f735-4934-a735-fcffee610ce8",
            "category": "Drinks",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id24 = UUID().uuidString
        docRefs.document(id24).setData([
            "id": id24,
            "userProfileId": "62f36450-3711-46f6-ba0f-43ad5dca9004",
            "category": "Cuisine",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id25 = UUID().uuidString
        docRefs.document(id25).setData([
            "id": id25,
            "userProfileId": "399e5315-6699-454f-9785-e756d78dda08",
            "category": "Drinks",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id26 = UUID().uuidString
        docRefs.document(id26).setData([
            "id": id26,
            "userProfileId": "3a775f5f-cfdf-49fe-9b01-e657aaf0e91c",
            "category": "Happy Hour",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id27 = UUID().uuidString
        docRefs.document(id27).setData([
            "id": id27,
            "userProfileId": "2d924df2-19a7-49ca-9621-5356bf42c425",
            "category": "Cuisine",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id28 = UUID().uuidString
        docRefs.document(id28).setData([
            "id": id28,
            "userProfileId": "9869fc83-6043-43fc-9e3f-97c5e65e3ce1",
            "category": "Cuisine",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id29 = UUID().uuidString
        docRefs.document(id29).setData([
            "id": id29,
            "userProfileId": "4f4b7c75-331e-4a99-883a-962aee62d992",
            "category": "Happy Hour",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        
        let id30 = UUID().uuidString
        docRefs.document(id30).setData([
            "id": id30,
            "userProfileId": "66fa9627-ea35-47c9-ad02-785bbec4997b",
            "category": "Drinks",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id31 = UUID().uuidString
        docRefs.document(id31).setData([
            "id": id31,
            "userProfileId": "a0b9c8b8-f52d-45dd-96fe-51da15dc8ca1",
            "category": "Happy Hour",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id32 = UUID().uuidString
        docRefs.document(id32).setData([
            "id": id32,
            "userProfileId": "35726856-fc5f-4a32-a1d3-0cc9a373ffa6",
            "category": "Cuisine",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id33 = UUID().uuidString
        docRefs.document(id33).setData([
            "id": id33,
            "userProfileId": "77904145-1739-4fd0-b88c-7691a463f925",
            "category": "Cuisine",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id34 = UUID().uuidString
        docRefs.document(id34).setData([
            "id": id34,
            "userProfileId": "291ca006-fa3c-457c-8f20-e43fe30726e2",
            "category": "Drinks",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id35 = UUID().uuidString
        docRefs.document(id35).setData([
            "id": id35,
            "userProfileId": "26242486-e28a-4cc0-8519-650e584b7304",
            "category": "Drinks",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id36 = UUID().uuidString
        docRefs.document(id36).setData([
            "id": id36,
            "userProfileId": "828f54e3-22cf-438a-8481-d5e5edaead81",
            "category": "Cuisine",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id37 = UUID().uuidString
        docRefs.document(id37).setData([
            "id": id37,
            "userProfileId": "76058066-89f2-4c5f-a77a-7a01e5331302",
            "category": "Happy Hour",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id38 = UUID().uuidString
        docRefs.document(id38).setData([
            "id": id38,
            "userProfileId": "d78496a3-a350-47fd-8d68-861086452bf5",
            "category": "Cuisine",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id39 = UUID().uuidString
        docRefs.document(id39).setData([
            "id": id39,
            "userProfileId": "ff76fd27-e5e4-48a8-b354-3bed165d2d4d",
            "category": "Drinks",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id40 = UUID().uuidString
        docRefs.document(id40).setData([
            "id": id40,
            "userProfileId": "66be07b5-95ca-491e-b157-42f9b45433f4",
            "category": "Drinks",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id41 = UUID().uuidString
        docRefs.document(id41).setData([
            "id": id41,
            "userProfileId": "aaf421ff-c89f-45d2-af59-c67c33527061",
            "category": "Cuisine",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        
        let id42 = UUID().uuidString
        docRefs.document(id42).setData([
            "id": id42,
            "userProfileId": "804394ff-9a58-41dc-b0a5-809cc66a68f6",
            "category": "Cuisine",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id43 = UUID().uuidString
        docRefs.document(id43).setData([
            "id": id43,
            "userProfileId": "ec57dd64-f53e-493f-8489-17f3fefaba98",
            "category": "Cuisine",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id44 = UUID().uuidString
        docRefs.document(id44).setData([
            "id": id44,
            "userProfileId": "a54bb7c2-de23-46f6-a859-eba1739cc7a1",
            "category": "Happy Hour",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id45 = UUID().uuidString
        docRefs.document(id45).setData([
            "id": id45,
            "userProfileId": "ec953202-d7bf-4048-8bff-b5e1088410d4",
            "category": "Drinks",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id46 = UUID().uuidString
        docRefs.document(id46).setData([
            "id": id46,
            "userProfileId": "a9d0f188-a238-4852-b83b-620deb3622d8",
            "category": "Cuisine",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id47 = UUID().uuidString
        docRefs.document(id47).setData([
            "id": id47,
            "userProfileId": "cb182851-bd1e-4283-bebd-41bb589fa2cf",
            "category": "Drinks",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id48 = UUID().uuidString
        docRefs.document(id48).setData([
            "id": id48,
            "userProfileId": "fc3f93b3-3b4f-4e91-9d8b-d8ffff60880f",
            "category": "Cuisine",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id49 = UUID().uuidString
        docRefs.document(id49).setData([
            "id": id49,
            "userProfileId": "5d0d1cf2-0aa3-42ff-888b-f0a42c1f2cfe",
            "category": "Happy Hour",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id50 = UUID().uuidString
        docRefs.document(id50).setData([
            "id": id50,
            "userProfileId": "4ff33e9e-0b8a-4122-a966-c0344298d8b6",
            "category": "Drinks",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id51 = UUID().uuidString
        docRefs.document(id51).setData([
            "id": id51,
            "userProfileId": "d55c9be4-e9af-47e1-8f1e-a10bbc8f435b",
            "category": "Cuisine",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id52 = UUID().uuidString
        docRefs.document(id52).setData([
            "id": id52,
            "userProfileId": "3b0793d7-12ca-48aa-ac3c-91697e8fb068",
            "category": "Happy Hour",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id53 = UUID().uuidString
        docRefs.document(id53).setData([
            "id": id53,
            "userProfileId": "4a415dd1-2ffe-4abf-b12f-bede94789bea",
            "category": "Drinks",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        
        
        
        
        
        
        let id54 = UUID().uuidString
        docRefs.document(id54).setData([
            "id": id54,
            "userProfileId": "1fc94190-9718-4c99-9651-df44028b8933",
            "category": "Cuisine",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id55 = UUID().uuidString
        docRefs.document(id55).setData([
            "id": id55,
            "userProfileId": "6933917c-3cc4-443e-83bc-4d758d2098dc",
            "category": "Happy Hour",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id56 = UUID().uuidString
        docRefs.document(id56).setData([
            "id": id56,
            "userProfileId": "a42ec640-ccda-4d31-a4be-7e936ff91791",
            "category": "Drinks",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id57 = UUID().uuidString
        docRefs.document(id57).setData([
            "id": id57,
            "userProfileId": "ddcc77c2-9ea7-40e8-85e4-5b6c1779d492",
            "category": "Cuisine",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id58 = UUID().uuidString
        docRefs.document(id58).setData([
            "id": id58,
            "userProfileId": "1fca9d9a-56d6-4e2d-8ddc-7712aa4b2fed",
            "category": "Happy Hour",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id59 = UUID().uuidString
        docRefs.document(id59).setData([
            "id": id59,
            "userProfileId": "ae95f594-81d9-4968-9be3-0112eff5c85d",
            "category": "Drinks",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id60 = UUID().uuidString
        docRefs.document(id60).setData([
            "id": id60,
            "userProfileId": "c108fa9d-b8b8-4ae8-920d-ec9ab3f7c623",
            "category": "Cuisine",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id61 = UUID().uuidString
        docRefs.document(id61).setData([
            "id": id61,
            "userProfileId": "4c2e44bf-3254-46f2-873a-d7c9e7b403d8",
            "category": "Cuisine",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id62 = UUID().uuidString
        docRefs.document(id62).setData([
            "id": id62,
            "userProfileId": "dd1903b9-27a7-4fbc-b5cb-30d3304ffa88",
            "category": "Drinks",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id63 = UUID().uuidString
        docRefs.document(id63).setData([
            "id": id63,
            "userProfileId": "93abcb16-3008-4ab6-9d6d-850b99b6e47a",
            "category": "Cuisine",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id64 = UUID().uuidString
        docRefs.document(id64).setData([
            "id": id64,
            "userProfileId": "0ad3c615-f59c-4e5c-8f57-30d70d238b07",
            "category": "Happy Hour",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id65 = UUID().uuidString
        docRefs.document(id65).setData([
            "id": id65,
            "userProfileId": "8550cd55-9114-4688-b758-f3968a0796f5",
            "category": "Drinks",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id66 = UUID().uuidString
        docRefs.document(id66).setData([
            "id": id66,
            "userProfileId": "7dee6646-1268-4826-8295-efce74297c60",
            "category": "Cuisine",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id67 = UUID().uuidString
        docRefs.document(id67).setData([
            "id": id67,
            "userProfileId": "be3597d0-f8af-4245-b45f-01d5adc75039",
            "category": "Drinks",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id68 = UUID().uuidString
        docRefs.document(id68).setData([
            "id": id68,
            "userProfileId": "1112314d-de9c-45bd-9f95-ce46898d7a97",
            "category": "Cuisine",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id69 = UUID().uuidString
        docRefs.document(id69).setData([
            "id": id69,
            "userProfileId": "7c6f12f2-9cdf-404b-bfb1-3531fcba038c",
            "category": "Happy Hour",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id70 = UUID().uuidString
        docRefs.document(id70).setData([
            "id": id70,
            "userProfileId": "00d1726a-cb7f-423e-aa50-533dfba961e1",
            "category": "Drinks",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id71 = UUID().uuidString
        docRefs.document(id71).setData([
            "id": id71,
            "userProfileId": "50ad62b7-3c90-40d6-8baf-459509e48e07",
            "category": "Cuisine",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id72 = UUID().uuidString
        docRefs.document(id72).setData([
            "id": id72,
            "userProfileId": "dec2cc1d-3641-4e1a-93e0-9fe763ee36ef",
            "category": "Happy Hour",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id73 = UUID().uuidString
        docRefs.document(id73).setData([
            "id": id73,
            "userProfileId": "24da908a-0951-407b-abec-b0b1e44ff4c0",
            "category": "Cuisine",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id74 = UUID().uuidString
        docRefs.document(id74).setData([
            "id": id74,
            "userProfileId": "c2165cd3-b124-4d65-aaaf-1441e2a81bf7",
            "category": "Drinks",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id75 = UUID().uuidString
        docRefs.document(id75).setData([
            "id": id75,
            "userProfileId": "7019b1e4-c0e9-4371-917d-2ac85c458210",
            "category": "Cuisine",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id76 = UUID().uuidString
        docRefs.document(id76).setData([
            "id": id76,
            "userProfileId": "77b8c5cf-aa52-4818-bdfa-b979079b1066",
            "category": "Happy Hour",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id77 = UUID().uuidString
        docRefs.document(id77).setData([
            "id": id77,
            "userProfileId": "cce32d43-65bd-4f80-81da-f8e9b58da07d",
            "category": "Drinks",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id78 = UUID().uuidString
        docRefs.document(id78).setData([
            "id": id78,
            "userProfileId": "e2176174-56c2-48d0-8faf-aee1bd833ca7",
            "category": "Happy Hour",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id79 = UUID().uuidString
        docRefs.document(id79).setData([
            "id": id79,
            "userProfileId": "2a0fff25-8ad8-4fa4-8639-2067757ebc93",
            "category": "Happy Hour",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id80 = UUID().uuidString
        docRefs.document(id80).setData([
            "id": id80,
            "userProfileId": "c7029440-0dee-4406-99e7-31d9a5cc3027",
            "category": "Cuisine",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id81 = UUID().uuidString
        docRefs.document(id81).setData([
            "id": id81,
            "userProfileId": "82e786c0-1a04-4304-9f17-6a88cc56a8eb",
            "category": "Drinks",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id82 = UUID().uuidString
        docRefs.document(id82).setData([
            "id": id82,
            "userProfileId": "c01e933d-bbe1-41de-b542-bbe64a4b2561",
            "category": "Happy Hour",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id83 = UUID().uuidString
        docRefs.document(id83).setData([
            "id": id83,
            "userProfileId": "fecada7b-4a43-4915-b131-2a0d5e08203c",
            "category": "Cuisine",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id84 = UUID().uuidString
        docRefs.document(id84).setData([
            "id": id84,
            "userProfileId": "d860ef2d-e354-49a9-9d5c-01fbcd17fba2",
            "category": "Drinks",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id85 = UUID().uuidString
        docRefs.document(id85).setData([
            "id": id85,
            "userProfileId": "ca9aca07-a8e2-4166-9a0c-15d5d74a5a78",
            "category": "Cuisine",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id86 = UUID().uuidString
        docRefs.document(id86).setData([
            "id": id86,
            "userProfileId": "9c7e67ee-74bf-4a82-8c13-bf13459bfdc0",
            "category": "Happy Hour",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id87 = UUID().uuidString
        docRefs.document(id87).setData([
            "id": id87,
            "userProfileId": "c8819f16-5e27-49dc-8949-8f9aacbd2cb4",
            "category": "Drinks",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id88 = UUID().uuidString
        docRefs.document(id88).setData([
            "id": id88,
            "userProfileId": "dbcd8e0a-9a3c-4bc7-bd0d-723705e1d95b",
            "category": "Cuisine",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id89 = UUID().uuidString
        docRefs.document(id89).setData([
            "id": id89,
            "userProfileId": "dcffd2d8-929d-4439-9728-357a7c4fe582",
            "category": "Happy Hour",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id90 = UUID().uuidString
        docRefs.document(id90).setData([
            "id": id90,
            "userProfileId": "c115223c-c494-4a33-b914-5d00d91d3eb9",
            "category": "Cuisine",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id91 = UUID().uuidString
        docRefs.document(id91).setData([
            "id": id91,
            "userProfileId": "70437a1b-88c9-4423-8eef-3a4afe60a592",
            "category": "Drinks",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id92 = UUID().uuidString
        docRefs.document(id92).setData([
            "id": id92,
            "userProfileId": "19457ad4-3451-4316-9921-c87aadb7d9ae",
            "category": "Drinks",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        let id93 = UUID().uuidString
        docRefs.document(id93).setData([
            "id": id93,
            "userProfileId": "28527272-2ac8-42b5-8fc3-f1af5a5770cb",
            "category": "Cuisine",
            "type": "Pick",
            "gender": "Pick",
            "location": "Tampa",
            "ageRangeFrom": "18",
            "ageRangeTo": "70",
            "isMockData": true
        ])
        
        
    }
    
    public func updateMockFIlterData(){
        
        let docRefs = db.collection("filters")
        
        docRefs.document("02128136-E47F-4ABF-A654-15D1D80EF384").updateData([
            "location": "Tampa, Fl",
            "timeStamp": Date()
        ])
        docRefs.document("05854EC3-412B-430E-A980-97E894BBD9A2").updateData([
            "location": "St.Petersburg, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("0A9F3A5F-4867-4A16-A437-FBCFC10CDE95").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("0DC95FBB-BD2C-4BAB-BB74-E8044E534CCE").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("0FD1CB9E-1AE5-444E-BBD9-54C4DD494AA5").updateData([
            "location": "St.Petersburg, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("1041980C-8BC6-40CE-AA63-0E9C8EDA5AC9").updateData([
            "location": "Tampa, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("1527A5E8-8AA6-4978-8271-D3F37056D794").updateData([
            "location": "Tampa, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("167B1269-B98C-4FD4-9698-15CABAD0BDD6").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("1DF819B7-61AB-47A4-A1D0-A7373CBA45CD").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("1F74A8D7-7364-4A2F-8E44-60B54A00F381").updateData([
            "location": "St.Petersburg, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("217AA313-3742-42E0-B395-6B52EB4AEF24").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("23854BD4-2A59-40D1-BCB3-3EE9F8BE7860").updateData([
            "location": "Tampa, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("23D23828-22AD-4FC3-A6A3-50CB82C50F80").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("26A7C58D-775A-4558-954A-6AE1D7488F61").updateData([
            "location": "St.Petersburg, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("26AB67F1-147E-464C-BA7E-22F0E8A7F95F").updateData([
            "location": "Tampa, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("ACFCF-7DC0-4800-97D0-7B3A2AEB4338").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("36AB4B84-6C9F-40A1-888F-F8D0570D3299").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("3AED010C-5AEF-41C5-A547-A3F73F142862").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("3C3FC65A-CBFB-4676-A07A-0464CEC7DB90").updateData([
            "location": "Tampa, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("4045614A-543F-4190-A1A7-22FBFDE41662").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("41C32AEA-6822-46E7-B87F-F0BEDAFB832F").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("45610C63-C28C-444B-81D0-5369B9CB3554").updateData([
            "location": "St.Petersburg, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("47388C30-70C7-43EC-B840-E200745D6C59").updateData([
            "location": "Tampa, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("4763D89E-4235-432E-B71C-3829FAAF3C46").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("481C55D8-3A69-4D84-BCC5-DDC1B518119D").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("4A4D9060-89DB-43DC-9E74-6D8229BE939F").updateData([
            "location": "St.Petersburg, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("4AE43F2F-FABD-4BDD-8211-545CFAE2CCB0").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("4B6FA7EE-E0B9-40E3-A8AE-9AA6980C3F0F").updateData([
            "location": "St.Petersburg, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("50AD214E-BAA5-433D-ABD3-5FCFBE7E6629").updateData([
            "location": "Tampa, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("50E6A69A-5D6E-4F57-8CC5-DF8C29E165DC").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("555504AE-E6A4-4734-AE43-D205379C71DC").updateData([
            "location": "Tampa, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("559A79E3-EF61-4359-B055-1828D3765038").updateData([
            "location": "Tampa, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("559BCF78-50D7-4B8C-927B-321757773C25").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("587C5D0F-2FAE-40F3-A280-82E13AC6572C").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("6161FB7B-98E6-4522-9585-4EFC97CC8E59").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("61963653-023A-4B41-B954-62CDF3E1FD42").updateData([
            "location": "St.Petersburg, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("62B4F6E5-3CAA-48D5-BCAE-2FF557E914DD").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("633C7D0E-2AD3-4686-ABF5-60FF476A8027").updateData([
            "location": "Tampa, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("66A18DE9-C0CE-4B80-9FC5-7CEE1D1E380D").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("67741465-E764-4F80-81DE-A278C41E4B07").updateData([
            "location": "Tampa, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("692C3647-9346-408D-9093-81AC1B889B6F").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("69D06067-3A50-4415-A0BD-822204EED901").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("73E2D17F-D581-45B3-8365-C0A9DEC6C4F2").updateData([
            "location": "Tampa, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("77EB6031-5D64-4CEE-9C8D-541BE440BBEA").updateData([
            "location": "St.Petersburg, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("7893FBC2-C522-458C-9DC8-46BD83257B33").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("78A5BE26-022F-460A-AFD6-A0B02F63282E").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("7D467170-1852-47B8-8C4D-2DC910F1B440").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("80072181-BAA8-4DD6-BC5A-0A30DF393349").updateData([
            "location": "Tampa, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("8066546E-D26C-472E-BDE7-5F7BD59DB3EC").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("80897FFD-209A-41CA-AAD6-6F8C48806518").updateData([
            "location": "Tampa, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("80FBF1FC-BE10-4116-AD5D-0E40C9D4D264").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("8142ED55-513F-49A8-9E89-89F16D418EF6").updateData([
            "location": "St.Petersburg, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("8308286C-E8E2-47BE-859A-3B4A5AFCAF5F").updateData([
            "location": "Tampa, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("83BEBDE2-1399-4602-B948-6DE447BECE90").updateData([
            "location": "Tampa, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("8984A162-7E71-4634-9B71-7650978703A5").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("8C493900-74C5-4EFC-9847-CF02AC53FB4B").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("939AF985-77E8-49B1-9DC3-3D8FBDE7EED7").updateData([
            "location": "Tampa, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("94837057-D939-4FF9-BD2E-9CA4B7CE6D79").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("949D4547-BA6F-41E1-9FC7-49551764685E").updateData([
            "location": "Tampa, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("9E0675A3-7961-4912-896E-60917725E1DE").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("A3DF5EE3-B184-4C48-BB2B-022EEE754831").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("A575D0DB-9BAD-4E54-90D8-E782FF653AF5").updateData([
            "location": "St.Petersburg, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("AB5499BE-6C96-4F52-AE28-144F3310C364").updateData([
            "location": "Tampa, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("AEF9C081-A431-4573-8E96-206526E0021D").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("B1F008DF-041F-48E0-A3C0-CC66F46AD206").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("B22035B6-F1DE-4207-9372-9F66009BDB81").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("B3DB1B71-1D86-4253-808A-8A60EEB2A486").updateData([
            "location": "Tampa, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("B71D6AE0-2181-42B2-8BA9-6B89269F31EE").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("B9CA0011-CDAA-4087-A7D5-530950C0BDA9").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("BA03B672-316F-41DF-8983-F8B0CA6B4D3C").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("BABBF09A-7B26-432E-BFAC-6894E50C142B").updateData([
            "location": "St.Petersburg, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("BBC7618D-81DF-43F7-B64E-8E2136F4ADA1").updateData([
            "location": "Tampa, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("C12E3FCD-ED8F-4ABE-B18C-C5A9CBF3FC88").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("C20A01BA-EBFF-4D23-8A2F-1C81DC23C316").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("C2A503A6-21A0-4816-BC4A-45670D26B1C9").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("C2A57912-FBA8-4B67-A82C-C967D2A6AED9").updateData([
            "location": "Tampa, Fl",
            "timeStamp": Date()
        ])
        
        
        docRefs.document("C79ADB79-2C6D-4AD2-9E49-08F5A3DE3F44").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("CAE55CF5-4F95-48FF-B107-9798AB26E083").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("CB2EF22B-E8A2-443B-AFAB-35BD47C999B2").updateData([
            "location": "Tampa, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("D23F8FDE-B4BC-4EA7-9FC4-4D25691BEF75").updateData([
            "location": "St.Petersburg, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("D4820EB3-7CD2-464F-A516-0091457D9186").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("D6235667-5FEF-4182-88E9-4824DA71EC47").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("ED1EA7A7-85C6-4799-9B95-5E6C3DEF4853").updateData([
            "location": "Tampa, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("ED7087AC-E4DD-43EA-BA9B-7696AA067F32").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("EDCBC130-A8B2-499E-8BB0-BCFDB03BAAFA").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("F1E04C7A-4D14-4A60-A01D-4910A3F85AC8").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("F1E2185C-3E67-483C-9C67-05288668C361").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("F562A56D-3E32-4FC5-AD8F-F75CC56DDEA2").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("F666A098-B232-4815-A9A3-5E82FB85B506").updateData([
            "location": "Tampa, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("F811D306-5539-49BC-B6B0-C07A5CBDAEC4").updateData([
            "location": "St.Petersburg, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("F840172C-B606-4F8B-A708-0DD5CABC6166").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("F8F20C9B-1FA9-4FF5-8520-0C4BE5D0667C").updateData([
            "location": "Tampa, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("F9538A96-ED41-43FB-B8FE-40CB4AD28572").updateData([
            "location": "Tampa, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("FB54D5AB-0051-49D1-B447-F2019FAC005C").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
        
        docRefs.document("FEB767A3-5D0A-4C71-955F-36924D49D63E").updateData([
            "location": "Clearwater, Fl",
            "timeStamp": Date()
        ])
    }
    
    
    
    public func addNewMockBunches() {
        let docRefs = db.collection("bunches")
             
        let id = UUID().uuidString
        docRefs.document(id).setData([
            "id": id,
            "locationName": "Saho Saloon",
            "profileIds": ["00d1726a-cb7f-423e-aa50-533dfba961e1"],
            "reviewIds": [],
            "isMockData": true
        ])
        
        let id2 = UUID().uuidString
        docRefs.document(id2).setData([
            "id": id2,
            "locationName": "McDonalds",
            "profileIds": ["ec953202-d7bf-4048-8bff-b5e1088410d4"],
            "reviewIds": [],
            "isMockData": true
        ])
        
        let id3 = UUID().uuidString
        docRefs.document(id3).setData([
            "id": id3,
            "locationName": "Chipotle",
            "profileIds": ["fc3f93b3-3b4f-4e91-9d8b-d8ffff60880f"],
            "reviewIds": [],
            "isMockData": true
        ])
        
        let id4 = UUID().uuidString
        docRefs.document(id4).setData([
            "id": id4,
            "locationName": "Bar Taco",
            "profileIds": ["a42ec640-ccda-4d31-a4be-7e936ff91791"],
            "reviewIds": [],
            "isMockData": true
        ])
        

    }
}


