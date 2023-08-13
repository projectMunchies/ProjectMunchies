//
//  MockData.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/27/23.
//

import Foundation


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
            fcmTokens: [],
            messageThreadIds: []
        )
    }
    
    static var foodFilterSampleData: FoodFilterModel {
        FoodFilterModel(
            id: "",
            category: "",
            type: "",
            gender: "",
            location: "",
            ageRangeFrom: "",
            ageRangeTo: "")
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
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "a6ce1c0b-0cdb-4eaf-bca8-d124e39819ea",
                fullName: "Marilyn Reynolds",
                location: "Tampa,Fl",
                description: "",
                gender: "Female",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "a6f3b606-93c9-4d6b-a4f8-98ee66181206",
                fullName: "Kristina Anthony",
                location: "St.Pete,Fl",
                description: "",
                gender: "Female",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "b37b0143-d3cc-495d-bfdc-1fec2d8fcf98",
                fullName: "Kathleen Brown",
                location: "Tampa,Fl",
                description: "",
                gender: "Female",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "d21387d1-fd1d-44b2-bc9c-03dfc8aa3e39",
                fullName: "Stormy Beaulieu",
                location: "Tampa,Fl",
                description: "",
                gender: "Female",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "f244f9a3-1f31-4d02-a509-99cb00bd1481",
                fullName: "Aurelia Driscoll",
                location: "Clearwater,Fl",
                description: "",
                gender: "Female",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "339b76b7-c58e-48fe-a181-eb67bbd21b49",
                fullName: "Theresa Richey",
                location: "Tampa,Fl",
                description: "",
                gender: "Female",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "d7e891d8-b126-45c1-b878-5a3be0db7d10",
                fullName: "Jane Conti",
                location: "Tampa,Fl",
                description: "",
                gender: "Female",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "f8c341e5-4e8e-42d6-ada8-25d6f8e9530f",
                fullName: "Linda Rice",
                location: "St.Pete,Fl",
                description: "",
                gender: "Female",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "ef49e44f-1957-4690-8bcf-473f9afe73cb",
                fullName: "Ruth Campos",
                location: "Tampa,Fl",
                description: "",
                gender: "Female",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "26102e2e-0b2b-4ff9-9b9c-a2b87e9af06a",
                fullName: "Angie Dyson",
                location: "Tampa,Fl",
                description: "",
                gender: "Female",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "a8b00895-411c-4cb0-8e19-559696ce6391",
                fullName: "Ana Ramos",
                location: "Clearwater,Fl",
                description: "",
                gender: "Female",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "93cb0b79-6afc-41de-aad1-c28808de4a4a",
                fullName: "Diane Cowan",
                location: "Tampa,Fl",
                description: "",
                gender: "Female",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "9527bf1e-b5a8-4fe5-93e6-7db84ba91166",
                fullName: "Dee Klimek",
                location: "Tampa,Fl",
                description: "",
                gender: "Female",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "4f5c7f12-c290-4a8a-abf6-deb8f396e325",
                fullName: "Charolette Spiker",
                location: "St.Pete,Fl",
                description: "",
                gender: "Female",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "e53f7388-b23a-4016-9ed9-4e86d4379f30",
                fullName: "Claire Simpson",
                location: "Tampa,Fl",
                description: "",
                gender: "Female",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "25148c1d-e2f9-40c9-83ab-099c6e3c5322",
                fullName: "Cara Lowman",
                location: "Tampa,Fl",
                description: "",
                gender: "Female",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "176443d2-66ab-44d7-8ec8-cda127185a50",
                fullName: "Stella Swafford",
                location: "Clearwater,Fl",
                description: "",
                gender: "Female",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "a87d620a-e0ae-4f10-bda4-5696a41cc5ac",
                fullName: "Amy Leathers",
                location: "Tampa,Fl",
                description: "",
                gender: "Female",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "0c9004ad-623d-4575-9c1f-d192f1662f72",
                fullName: "Gemma Golden",
                location: "Tampa,Fl",
                description: "",
                gender: "Female",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "a764113f-b440-425f-bb28-7ccfb5b0b67d",
                fullName: "Sandra Herring",
                location: "St.Pete,Fl",
                description: "",
                gender: "Female",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "5850c7a9-f735-4934-a735-fcffee610ce8",
                fullName: "Mia Lewis",
                location: "Tampa,Fl",
                description: "",
                gender: "Female",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "62f36450-3711-46f6-ba0f-43ad5dca9004",
                fullName: "Alyssa Turner",
                location: "Tampa,Fl",
                description: "",
                gender: "Female",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "399e5315-6699-454f-9785-e756d78dda08",
                fullName: "Lana Taylor",
                location: "Clearwater,Fl",
                description: "",
                gender: "Female",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "3a775f5f-cfdf-49fe-9b01-e657aaf0e91c",
                fullName: "Diana Watson",
                location: "Tampa,Fl",
                description: "",
                gender: "Female",
                fcmTokens: [],
                messageThreadIds: []
            ),
            
            
            
        //Men
            ProfileModel(
                id: "be3597d0-f8af-4245-b45f-01d5adc75039",
                fullName: "Aaron Bates",
                location: "Tampa,Fl",
                description: "",
                gender: "Male",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "1112314d-de9c-45bd-9f95-ce46898d7a97",
                fullName: "Alexander Kennedy",
                location: "Tampa,Fl",
                description: "",
                gender: "Male",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "7c6f12f2-9cdf-404b-bfb1-3531fcba038c",
                fullName: "Ben Thomas",
                location: "Tampa,Fl",
                description: "",
                gender: "Male",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "00d1726a-cb7f-423e-aa50-533dfba961e1",
                fullName: "Billy Kwasny",
                location: "St.Pete,Fl",
                description: "",
                gender: "Male",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "50ad62b7-3c90-40d6-8baf-459509e48e07",
                fullName: "Darrel Zidar",
                location: "Tampa,Fl",
                description: "",
                gender: "Male",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "dec2cc1d-3641-4e1a-93e0-9fe763ee36ef",
                fullName: "Dean Deperro",
                location: "Tampa,Fl",
                description: "",
                gender: "Male",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "24da908a-0951-407b-abec-b0b1e44ff4c0",
                fullName: "Donnell Shryer",
                location: "Clearwater,Fl",
                description: "",
                gender: "Male",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "c2165cd3-b124-4d65-aaaf-1441e2a81bf7",
                fullName: "Erich Nabb",
                location: "Tampa,Fl",
                description: "",
                gender: "Male",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "7019b1e4-c0e9-4371-917d-2ac85c458210",
                fullName: "Frederic Zeiber",
                location: "Tampa,Fl",
                description: "",
                gender: "Male",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "77b8c5cf-aa52-4818-bdfa-b979079b1066",
                fullName: "Garret Psaila",
                location: "St.Pete,Fl",
                description: "",
                gender: "Male",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "cce32d43-65bd-4f80-81da-f8e9b58da07d",
                fullName: "Garry Buechler",
                location: "Tampa,Fl",
                description: "",
                gender: "Male",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "e2176174-56c2-48d0-8faf-aee1bd833ca7",
                fullName: "Hans Vereen",
                location: "Tampa,Fl",
                description: "",
                gender: "Male",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "2a0fff25-8ad8-4fa4-8639-2067757ebc93",
                fullName: "Hugo Storrow",
                location: "Clearwater,Fl",
                description: "",
                gender: "Male",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "c7029440-0dee-4406-99e7-31d9a5cc3027",
                fullName: "Jake Hanig",
                location: "Tampa,Fl",
                description: "",
                gender: "Male",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "82e786c0-1a04-4304-9f17-6a88cc56a8eb",
                fullName: "Jefferey Cellars",
                location: "Tampa,Fl",
                description: "",
                gender: "Male",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "c01e933d-bbe1-41de-b542-bbe64a4b2561",
                fullName: "Jim Valladares",
                location: "St.Pete,Fl",
                description: "",
                gender: "Male",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "fecada7b-4a43-4915-b131-2a0d5e08203c",
                fullName: "Kareem Bayerle",
                location: "Tampa,Fl",
                description: "",
                gender: "Male",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "d860ef2d-e354-49a9-9d5c-01fbcd17fba2",
                fullName: "Lanny Peeters",
                location: "Tampa,Fl",
                description: "",
                gender: "Male",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "ca9aca07-a8e2-4166-9a0c-15d5d74a5a78",
                fullName: "Luciano Sienkiewicz",
                location: "Clearwater,Fl",
                description: "",
                gender: "Male",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "9c7e67ee-74bf-4a82-8c13-bf13459bfdc0",
                fullName: "Luke Wachowicz",
                location: "Tampa,Fl",
                description: "",
                gender: "Male",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "c8819f16-5e27-49dc-8949-8f9aacbd2cb4",
                fullName: "Mason Baxter",
                location: "Tampa,Fl",
                description: "",
                gender: "Male",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "dbcd8e0a-9a3c-4bc7-bd0d-723705e1d95b",
                fullName: "Mitchel Hoeper",
                location: "St.Pete,Fl",
                description: "",
                gender: "Male",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "dcffd2d8-929d-4439-9728-357a7c4fe582",
                fullName: "Mohamed Stathis",
                location: "Tampa,Fl",
                description: "",
                gender: "Male",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "c115223c-c494-4a33-b914-5d00d91d3eb9",
                fullName: "Oliver Mccall",
                location: "Tampa,Fl",
                description: "",
                gender: "Male",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "70437a1b-88c9-4423-8eef-3a4afe60a592",
                fullName: "Ray Eddleston",
                location: "Clearwater,Fl",
                description: "",
                gender: "Male",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "19457ad4-3451-4316-9921-c87aadb7d9ae",
                fullName: "Rob Dominowski",
                location: "Tampa,Fl",
                description: "",
                gender: "Male",
                fcmTokens: [],
                messageThreadIds: []
            ),
            ProfileModel(
                id: "28527272-2ac8-42b5-8fc3-f1af5a5770cb",
                fullName: "Scottie Stefek",
                location: "Tampa,Fl",
                description: "",
                gender: "Male",
                fcmTokens: [],
                messageThreadIds: []
            )
        ]
    }
}


