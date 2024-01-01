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

enum MockDataService {
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

    public func addNewVenuesChineseCusineType() {
        let docRefs = db.collection("venues")
             
        let id = UUID().uuidString
        docRefs.document(id).setData([
            "id": id,
            "name": "Oriental Express Chinese Sushu Restaurant",
            "address": "510 E Jackson St, Tampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id2 = UUID().uuidString
        docRefs.document(id2).setData([
            "id": id2,
            "name": "Ming Gardens Restaurant",
            "address": "2601 N Tampa St, Tampa, FL 33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id3 = UUID().uuidString
        docRefs.document(id3).setData([
            "id": id3,
            "name": "Wok n Roll",
            "address": "2802 W Kennedy Blvd, Tampa, FL  33609",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id4 = UUID().uuidString
        docRefs.document(id4).setData([
            "id": id4,
            "name": "China Wok",
            "address": "4230 S MacDill Ave, Tampa, FL  33611",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id5 = UUID().uuidString
        docRefs.document(id5).setData([
            "id": id5,
            "name": "China Wok",
            "address": "4058 Fiesta Plaza, Unit 104, Tampa, FL 33607",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id6 = UUID().uuidString
        docRefs.document(id6).setData([
            "id": id6,
            "name": "Plum Tree",
            "address": "215 E Davis Blvd, Tampa, FL  33606",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id7 = UUID().uuidString
        docRefs.document(id7).setData([
            "id": id7,
            "name": "YHS China Bistro",
            "address": "302 N Dale Mabry Hwy, Tampa, FL  33609",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id8 = UUID().uuidString
        docRefs.document(id8).setData([
            "id": id8,
            "name": "China 1",
            "address": "934 E Henderson Ave, Tampa, FL  33605",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id9 = UUID().uuidString
        docRefs.document(id9).setData([
            "id": id9,
            "name": "Yummy House South",
            "address": "302 N Tampa St, Tampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id10 = UUID().uuidString
        docRefs.document(id10).setData([
            "id": id10,
            "name": "Ho Ho To Go",
            "address": "2502 W Columbus Dr, Tampa, FL  33607",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id11 = UUID().uuidString
        docRefs.document(id11).setData([
            "id": id11,
            "name": "China 1",
            "address": "2535 N Dale Mabry Hwy, Tampa, FL  33607",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id12 = UUID().uuidString
        docRefs.document(id12).setData([
            "id": id12,
            "name": "China Moon Chinese Restaurant",
            "address": "1900 E Dr Martin Luther King Jr Blvd, Tampa, FL  33610",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id13 = UUID().uuidString
        docRefs.document(id13).setData([
            "id": id13,
            "name": "Far East Chinese Restaurant",
            "address": "5022 E Tenth Ave, Tampa, FL  33619",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id14 = UUID().uuidString
        docRefs.document(id14).setData([
            "id": id14,
            "name": "Hao Wah Chinese Restaurant",
            "address": "1713 S Dale Mabry Hwy, Tampa, FL  33629",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id15 = UUID().uuidString
        docRefs.document(id15).setData([
            "id": id15,
            "name": "Yummy House China Bistro - Tampa",
            "address": "2620 E Hillsborough Ave, Tampa, FL  33610",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id16 = UUID().uuidString
        docRefs.document(id16).setData([
            "id": id16,
            "name": "New China",
            "address": "3801 W Gandy Blvd, Unit E, Tampa, FL 33611",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id17 = UUID().uuidString
        docRefs.document(id17).setData([
            "id": id17,
            "name": "Shang Hai Take Out",
            "address": "3337 S West Shore Blvd, Tampa, FL  33629",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id18 = UUID().uuidString
        docRefs.document(id18).setData([
            "id": id18,
            "name": "Taste of China",
            "address": "5827 S Dale Mabry Hwy, Tampa, FL  33611",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id19 = UUID().uuidString
        docRefs.document(id19).setData([
            "id": id19,
            "name": "China Garden",
            "address": "5715 N Nebraska Ave, Tampa, FL  33604",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id20 = UUID().uuidString
        docRefs.document(id20).setData([
            "id": id20,
            "name": "Top China",
            "address": "3810 W Neptune St, Unit B1, Tampa, FL  33629",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id21 = UUID().uuidString
        docRefs.document(id21).setData([
            "id": id21,
            "name": "Hong Kong",
            "address": "1743 E Hillsborough Ave, Tampa, FL  33610",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id22 = UUID().uuidString
        docRefs.document(id22).setData([
            "id": id22,
            "name": "Top China",
            "address": "2525 E Hillsborough Ave, Tampa, FL  33610",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id23 = UUID().uuidString
        docRefs.document(id23).setData([
            "id": id23,
            "name": "China House",
            "address": "3978 W Hillsborough Ave, Tampa, FL  33614",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id24 = UUID().uuidString
        docRefs.document(id24).setData([
            "id": id24,
            "name": "Jade Garden",
            "address": "Jade Garden, 2626 W Hillsborough Ave, Tampa, FL  33614",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id25 = UUID().uuidString
        docRefs.document(id25).setData([
            "id": id25,
            "name": "Tampa Buffet",
            "address": "3904 S Dale Mabry Hwy, Tampa, FL  33611",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
    }
    
    public func addNewVenuesAmericanCusineType() {
        let docRefs = db.collection("venues")
             
        let id = UUID().uuidString
        docRefs.document(id).setData([
            "id": id,
            "name": "American Social",
            "address": "601 S Harbour Island Blvd, Unit 107, Tampa, FL 33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id2 = UUID().uuidString
        docRefs.document(id2).setData([
            "id": id2,
            "name": "Samaria Cafe",
            "address": "502 N Tampa St, Tampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id3 = UUID().uuidString
        docRefs.document(id3).setData([
            "id": id3,
            "name": "Ebbe",
            "address": "1202 N Franklin St, Tampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id4 = UUID().uuidString
        docRefs.document(id4).setData([
            "id": id4,
            "name": "211 Restaurant",
            "address": "211 N Tampa St, Tampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id5 = UUID().uuidString
        docRefs.document(id5).setData([
            "id": id5,
            "name": "SoFresh",
            "address": "512 N Franklin St, Tampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id6 = UUID().uuidString
        docRefs.document(id6).setData([
            "id": id6,
            "name": "Ponte Modern American",
            "address": "1010 Gramercy Ln, Tampa, FL 33607",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id7 = UUID().uuidString
        docRefs.document(id7).setData([
            "id": id7,
            "name": "Yard House",
            "address": "450 Channelside Dr\nTampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id8 = UUID().uuidString
        docRefs.document(id8).setData([
            "id": id8,
            "name": "The Dan",
            "address": "905 N Florida Ave, Tampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id9 = UUID().uuidString
        docRefs.document(id9).setData([
            "id": id9,
            "name": "Yummy House South",
            "address": "302 N Tampa St, Tampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id10 = UUID().uuidString
        docRefs.document(id10).setData([
            "id": id10,
            "name": "Naked Farmer",
            "address": "1001 Water St, Tampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id11 = UUID().uuidString
        docRefs.document(id11).setData([
            "id": id11,
            "name": "Hattricks",
            "address": "107 S Franklin St, Tampa, FL 33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id12 = UUID().uuidString
        docRefs.document(id12).setData([
            "id": id12,
            "name": "Corazon Restaurant And Bar",
            "address": "325 N Florida Ave, Tampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id13 = UUID().uuidString
        docRefs.document(id13).setData([
            "id": id13,
            "name": "Riveters Tampa",
            "address": "2301 N Dale Mabry Hwy, Tampa, FL  33607",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id14 = UUID().uuidString
        docRefs.document(id14).setData([
            "id": id14,
            "name": "TASTE Downtown Tampa",
            "address": "513 S Florida Ave, Tampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id15 = UUID().uuidString
        docRefs.document(id15).setData([
            "id": id15,
            "name": "The Pint and Brew - Downtown Tampa",
            "address": "200 N Tampa St, Tampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id16 = UUID().uuidString
        docRefs.document(id16).setData([
            "id": id16,
            "name": "Babushka's",
            "address": "901 W Platt St, Tampa, FL  33606",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id17 = UUID().uuidString
        docRefs.document(id17).setData([
            "id": id17,
            "name": "Oxford Exchange",
            "address": "420 W Kennedy Blvd, Tampa, FL  33606",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id18 = UUID().uuidString
        docRefs.document(id18).setData([
            "id": id18,
            "name": "Splitsville",
            "address": "615 Channelside Dr, Unit 120, Tampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id19 = UUID().uuidString
        docRefs.document(id19).setData([
            "id": id19,
            "name": "Union New American",
            "address": "1111 N West Shore Blvd, Tampa, FL  33607",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id20 = UUID().uuidString
        docRefs.document(id20).setData([
            "id": id20,
            "name": "Jackson's Bistro Bar & Sushi",
            "address": "601 S Harbour Island Blvd, Tampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id21 = UUID().uuidString
        docRefs.document(id21).setData([
            "id": id21,
            "name": "The Battery",
            "address": "615 Channelside Dr, Tampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id22 = UUID().uuidString
        docRefs.document(id22).setData([
            "id": id22,
            "name": "Ricks on the River",
            "address": "2305 N Willow Ave, Tampa, FL  33607",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id23 = UUID().uuidString
        docRefs.document(id23).setData([
            "id": id23,
            "name": "BurgerFi",
            "address": "615 Channelside Dr, Tampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id24 = UUID().uuidString
        docRefs.document(id24).setData([
            "id": id24,
            "name": "Anchor and Brine",
            "address": "505 Water St, Tampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id25 = UUID().uuidString
        docRefs.document(id25).setData([
            "id": id25,
            "name": "Metro Diner",
            "address": "4011 W Kennedy Blvd, Ste 5, Tampa, FL  33609",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id26 = UUID().uuidString
        docRefs.document(id26).setData([
            "id": id26,
            "name": "Willa's",
            "address": "1700 W Fig St, Tampa, FL  33606",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
    }
    
    public func addNewVenuesMexicanCusineType() {
        let docRefs = db.collection("venues")
             
        let id = UUID().uuidString
        docRefs.document(id).setData([
            "id": id,
            "name": "Urban Cantina",
            "address": "200 E Madison St, Tampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id2 = UUID().uuidString
        docRefs.document(id2).setData([
            "id": id2,
            "name": "Taco Bus",
            "address": "505 N Franklin St, Tampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id3 = UUID().uuidString
        docRefs.document(id3).setData([
            "id": id3,
            "name": "Green Lemon",
            "address": "915 S Howard Ave, Tampa, FL  33606",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id4 = UUID().uuidString
        docRefs.document(id4).setData([
            "id": id4,
            "name": "Jimmy's Tacos",
            "address": "1604 N 17th St, Tampa, FL  33605",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id5 = UUID().uuidString
        docRefs.document(id5).setData([
            "id": id5,
            "name": "Jotoro Kitchen & Tequila Bar",
            "address": "615 Channelside Dr, Unit 114, Tampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id6 = UUID().uuidString
        docRefs.document(id6).setData([
            "id": id6,
            "name": "Lona By Chef Richard Sandoval",
            "address": "505 Water St, Tampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id7 = UUID().uuidString
        docRefs.document(id7).setData([
            "id": id7,
            "name": "Margaritas Mexican Restaurant",
            "address": "209 E Davis Blvd, Tampa, FL 33606",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id8 = UUID().uuidString
        docRefs.document(id8).setData([
            "id": id8,
            "name": "Los Chapos Tacos",
            "address": "951 E Seventh Ave, Tampa, FL  33605",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id9 = UUID().uuidString
        docRefs.document(id9).setData([
            "id": id9,
            "name": "Crazy Burrito",
            "address": "2506 W Columbus Dr, Tampa, FL  33607",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id10 = UUID().uuidString
        docRefs.document(id10).setData([
            "id": id10,
            "name": "Chiles Mexican Restaurant",
            "address": "3247 W Columbus Dr, Tampa, FL  33607",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id11 = UUID().uuidString
        docRefs.document(id11).setData([
            "id": id11,
            "name": "Bar Taco",
            "address": "1601 W Snow Ave, Tampa, FL  33606",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id12 = UUID().uuidString
        docRefs.document(id12).setData([
            "id": id12,
            "name": "Miguelitos Taqueria Y Tequilas",
            "address": "2702 W Kennedy Blvd, Tampa, FL  33609",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id13 = UUID().uuidString
        docRefs.document(id13).setData([
            "id": id13,
            "name": "City Dog Cantina",
            "address": "1208 E Kennedy Blvd, Unit 14, Tampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id14 = UUID().uuidString
        docRefs.document(id14).setData([
            "id": id14,
            "name": "Besito Mexican",
            "address": "205 Westshore Plaza, Tampa, FL 33609",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id15 = UUID().uuidString
        docRefs.document(id15).setData([
            "id": id15,
            "name": "La Fiesta Mexican Store",
            "address": "1202 S 22nd St, Tampa, FL  33605",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id16 = UUID().uuidString
        docRefs.document(id16).setData([
            "id": id16,
            "name": "Rene's Mexican Kitchen",
            "address": "4414 N Nebraska Ave, Tampa, FL  33603",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id17 = UUID().uuidString
        docRefs.document(id17).setData([
            "id": id17,
            "name": "Muchachas",
            "address": "1910 N Ola Ave, Tampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id18 = UUID().uuidString
        docRefs.document(id18).setData([
            "id": id18,
            "name": "Lolis Mexican Cravings",
            "address": "1824 N West Shore Blvd, Tampa, FL  33607",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id19 = UUID().uuidString
        docRefs.document(id19).setData([
            "id": id19,
            "name": "Taco Dirty",
            "address": "2221 W Platt St, Tampa, FL  33606",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id20 = UUID().uuidString
        docRefs.document(id20).setData([
            "id": id20,
            "name": "Lolis Mexican Cravings",
            "address": "3324 W Gandy Blvd, Unit 2, Tampa, FL  33611",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id21 = UUID().uuidString
        docRefs.document(id21).setData([
            "id": id21,
            "name": "Izzy's Tacos",
            "address": "123 S Hyde Park Ave, Tampa, FL  33606",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id22 = UUID().uuidString
        docRefs.document(id22).setData([
            "id": id22,
            "name": "Acapulco Taqueria",
            "address": "1001 N MacDill Ave, Tampa, FL  33607",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id23 = UUID().uuidString
        docRefs.document(id23).setData([
            "id": id23,
            "name": "Taqueria Emanuel",
            "address": "2800 N MacDill Ave, Unit E, Tampa, FL  33607",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id24 = UUID().uuidString
        docRefs.document(id24).setData([
            "id": id24,
            "name": "Hector's Mexican Food",
            "address": "3121 E Hillsborough Ave, Tampa, FL  33610",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id25 = UUID().uuidString
        docRefs.document(id25).setData([
            "id": id25,
            "name": "Miguel's Mexican Seafood & Grill",
            "address": "3035 W Kennedy Blvd, Tampa, FL  33609",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
    }

    public func addNewVenuesJapaneseCusineType() {
        let docRefs = db.collection("venues")
             
        let id = UUID().uuidString
        docRefs.document(id).setData([
            "id": id,
            "name": "American Social",
            "address": "601 S Harbour Island Blvd, Unit 107, Tampa, FL 33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id2 = UUID().uuidString
        docRefs.document(id2).setData([
            "id": id2,
            "name": "Samaria Cafe",
            "address": "502 N Tampa St, Tampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id3 = UUID().uuidString
        docRefs.document(id3).setData([
            "id": id3,
            "name": "Ebbe",
            "address": "1202 N Franklin St, Tampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id4 = UUID().uuidString
        docRefs.document(id4).setData([
            "id": id4,
            "name": "211 Restaurant",
            "address": "211 N Tampa St, Tampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id5 = UUID().uuidString
        docRefs.document(id5).setData([
            "id": id5,
            "name": "SoFresh",
            "address": "512 N Franklin St, Tampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id6 = UUID().uuidString
        docRefs.document(id6).setData([
            "id": id6,
            "name": "Ponte Modern American",
            "address": "1010 Gramercy Ln, Tampa, FL 33607",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id7 = UUID().uuidString
        docRefs.document(id7).setData([
            "id": id7,
            "name": "Yard House",
            "address": "450 Channelside Dr\nTampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id8 = UUID().uuidString
        docRefs.document(id8).setData([
            "id": id8,
            "name": "The Dan",
            "address": "905 N Florida Ave, Tampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id9 = UUID().uuidString
        docRefs.document(id9).setData([
            "id": id9,
            "name": "Yummy House South",
            "address": "302 N Tampa St, Tampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id10 = UUID().uuidString
        docRefs.document(id10).setData([
            "id": id10,
            "name": "Naked Farmer",
            "address": "1001 Water St, Tampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id11 = UUID().uuidString
        docRefs.document(id11).setData([
            "id": id11,
            "name": "Hattricks",
            "address": "107 S Franklin St, Tampa, FL 33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id12 = UUID().uuidString
        docRefs.document(id12).setData([
            "id": id12,
            "name": "Corazon Restaurant And Bar",
            "address": "325 N Florida Ave, Tampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id13 = UUID().uuidString
        docRefs.document(id13).setData([
            "id": id13,
            "name": "Riveters Tampa",
            "address": "2301 N Dale Mabry Hwy, Tampa, FL  33607",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id14 = UUID().uuidString
        docRefs.document(id14).setData([
            "id": id14,
            "name": "TASTE Downtown Tampa",
            "address": "513 S Florida Ave, Tampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id15 = UUID().uuidString
        docRefs.document(id15).setData([
            "id": id15,
            "name": "The Pint and Brew - Downtown Tampa",
            "address": "200 N Tampa St, Tampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id16 = UUID().uuidString
        docRefs.document(id16).setData([
            "id": id16,
            "name": "Babushka's",
            "address": "901 W Platt St, Tampa, FL  33606",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id17 = UUID().uuidString
        docRefs.document(id17).setData([
            "id": id17,
            "name": "Oxford Exchange",
            "address": "420 W Kennedy Blvd, Tampa, FL  33606",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id18 = UUID().uuidString
        docRefs.document(id18).setData([
            "id": id18,
            "name": "Splitsville",
            "address": "615 Channelside Dr, Unit 120, Tampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id19 = UUID().uuidString
        docRefs.document(id19).setData([
            "id": id19,
            "name": "Union New American",
            "address": "1111 N West Shore Blvd, Tampa, FL  33607",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id20 = UUID().uuidString
        docRefs.document(id20).setData([
            "id": id20,
            "name": "Jackson's Bistro Bar & Sushi",
            "address": "601 S Harbour Island Blvd, Tampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id21 = UUID().uuidString
        docRefs.document(id21).setData([
            "id": id21,
            "name": "The Battery",
            "address": "615 Channelside Dr, Tampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id22 = UUID().uuidString
        docRefs.document(id22).setData([
            "id": id22,
            "name": "Ricks on the River",
            "address": "2305 N Willow Ave, Tampa, FL  33607",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id23 = UUID().uuidString
        docRefs.document(id23).setData([
            "id": id23,
            "name": "BurgerFi",
            "address": "615 Channelside Dr, Tampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id24 = UUID().uuidString
        docRefs.document(id24).setData([
            "id": id24,
            "name": "Anchor and Brine",
            "address": "505 Water St, Tampa, FL  33602",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id25 = UUID().uuidString
        docRefs.document(id25).setData([
            "id": id25,
            "name": "Metro Diner",
            "address": "4011 W Kennedy Blvd, Ste 5, Tampa, FL  33609",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id26 = UUID().uuidString
        docRefs.document(id26).setData([
            "id": id26,
            "name": "Willa's",
            "address": "1700 W Fig St, Tampa, FL  33606",
            "type": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
    }
    
}


