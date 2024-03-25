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
    public func addNewVenuesChineseCusineType() {
        let docRefs = db.collection("venues")
             
        let id = UUID().uuidString
        docRefs.document(id).setData([
            "id": id,
            "name": "Oriental Express Chinese Sushu Restaurant",
            "address": "510 E Jackson St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id2 = UUID().uuidString
        docRefs.document(id2).setData([
            "id": id2,
            "name": "Ming Gardens Restaurant",
            "address": "2601 N Tampa St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id3 = UUID().uuidString
        docRefs.document(id3).setData([
            "id": id3,
            "name": "Wok n Roll",
            "address": "2802 W Kennedy Blvd, Tampa, FL 33609",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id4 = UUID().uuidString
        docRefs.document(id4).setData([
            "id": id4,
            "name": "China Wok",
            "address": "4230 S MacDill Ave, Tampa, FL 33611",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id5 = UUID().uuidString
        docRefs.document(id5).setData([
            "id": id5,
            "name": "China Wok",
            "address": "4058 Fiesta Plaza, Unit 104, Tampa, FL 33607",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id6 = UUID().uuidString
        docRefs.document(id6).setData([
            "id": id6,
            "name": "Plum Tree",
            "address": "215 E Davis Blvd, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id7 = UUID().uuidString
        docRefs.document(id7).setData([
            "id": id7,
            "name": "YHS China Bistro",
            "address": "302 N Dale Mabry Hwy, Tampa, FL 33609",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id8 = UUID().uuidString
        docRefs.document(id8).setData([
            "id": id8,
            "name": "China 1",
            "address": "934 E Henderson Ave, Tampa, FL 33605",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id9 = UUID().uuidString
        docRefs.document(id9).setData([
            "id": id9,
            "name": "Yummy House South",
            "address": "302 N Tampa St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id10 = UUID().uuidString
        docRefs.document(id10).setData([
            "id": id10,
            "name": "Ho Ho To Go",
            "address": "2502 W Columbus Dr, Tampa, FL 33607",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id11 = UUID().uuidString
        docRefs.document(id11).setData([
            "id": id11,
            "name": "China 1",
            "address": "2535 N Dale Mabry Hwy, Tampa, FL 33607",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id12 = UUID().uuidString
        docRefs.document(id12).setData([
            "id": id12,
            "name": "China Moon Chinese Restaurant",
            "address": "1900 E Dr Martin Luther King Jr Blvd, Tampa, FL 33610",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id13 = UUID().uuidString
        docRefs.document(id13).setData([
            "id": id13,
            "name": "Far East Chinese Restaurant",
            "address": "5022 E Tenth Ave, Tampa, FL 33619",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id14 = UUID().uuidString
        docRefs.document(id14).setData([
            "id": id14,
            "name": "Hao Wah Chinese Restaurant",
            "address": "1713 S Dale Mabry Hwy, Tampa, FL 33629",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id15 = UUID().uuidString
        docRefs.document(id15).setData([
            "id": id15,
            "name": "Yummy House China Bistro - Tampa",
            "address": "2620 E Hillsborough Ave, Tampa, FL 33610",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id16 = UUID().uuidString
        docRefs.document(id16).setData([
            "id": id16,
            "name": "New China",
            "address": "3801 W Gandy Blvd, Unit E, Tampa, FL 33611",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id17 = UUID().uuidString
        docRefs.document(id17).setData([
            "id": id17,
            "name": "Shang Hai Take Out",
            "address": "3337 S West Shore Blvd, Tampa, FL 33629",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id18 = UUID().uuidString
        docRefs.document(id18).setData([
            "id": id18,
            "name": "Taste of China",
            "address": "5827 S Dale Mabry Hwy, Tampa, FL 33611",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id19 = UUID().uuidString
        docRefs.document(id19).setData([
            "id": id19,
            "name": "China Garden",
            "address": "5715 N Nebraska Ave, Tampa, FL 33604",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id20 = UUID().uuidString
        docRefs.document(id20).setData([
            "id": id20,
            "name": "Top China",
            "address": "3810 W Neptune St, Unit B1, Tampa, FL 33629",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id21 = UUID().uuidString
        docRefs.document(id21).setData([
            "id": id21,
            "name": "Hong Kong",
            "address": "1743 E Hillsborough Ave, Tampa, FL 33610",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id22 = UUID().uuidString
        docRefs.document(id22).setData([
            "id": id22,
            "name": "Top China",
            "address": "2525 E Hillsborough Ave, Tampa, FL 33610",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id23 = UUID().uuidString
        docRefs.document(id23).setData([
            "id": id23,
            "name": "China House",
            "address": "3978 W Hillsborough Ave, Tampa, FL 33614",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id24 = UUID().uuidString
        docRefs.document(id24).setData([
            "id": id24,
            "name": "Jade Garden",
            "address": "Jade Garden, 2626 W Hillsborough Ave, Tampa, FL 33614",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id25 = UUID().uuidString
        docRefs.document(id25).setData([
            "id": id25,
            "name": "Tampa Buffet",
            "address": "3904 S Dale Mabry Hwy, Tampa, FL 33611",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id26 = UUID().uuidString
        docRefs.document(id26).setData([
            "id": id26,
            "name": "China King Chinese Restaurant",
            "address": "3163 Curlew Rd, Unit 3, Oldsmar, FL 34677",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id27 = UUID().uuidString
        docRefs.document(id27).setData([
            "id": id27,
            "name": "Chef Li",
            "address": "4013 Tampa Rd, Unit 16, Oldsmar, FL 34677",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id28 = UUID().uuidString
        docRefs.document(id28).setData([
            "id": id28,
            "name": "Kang's Garden",
            "address": "12221 W Linebaugh Ave, Tampa, FL 33626",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id29 = UUID().uuidString
        docRefs.document(id29).setData([
            "id": id29,
            "name": "Beijing House",
            "address": "5103 E Fowler Ave, Tampa, FL 33617",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id30 = UUID().uuidString
        docRefs.document(id30).setData([
            "id": id30,
            "name": "Taste Of China",
            "address": "8476 Sheldon Rd, Tampa, FL 33615",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id31 = UUID().uuidString
        docRefs.document(id31).setData([
            "id": id31,
            "name": "Hong Kong Chinese Restaurant",
            "address": "7026 W Waters Ave, Tampa, FL 33634",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id32 = UUID().uuidString
        docRefs.document(id32).setData([
            "id": id32,
            "name": "China Wok",
            "address": "8490 W Hillsborough Ave, Tampa, FL 33615",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id33 = UUID().uuidString
        docRefs.document(id33).setData([
            "id": id33,
            "name": "China Legend",
            "address": "4537 Gunn Hwy, Tampa, FL 33624",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id34 = UUID().uuidString
        docRefs.document(id34).setData([
            "id": id34,
            "name": "Chine Garden Chinese Restaurant",
            "address": "1550 N McMullen Booth Rd, Clearwater, FL 33759",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id35 = UUID().uuidString
        docRefs.document(id35).setData([
            "id": id35,
            "name": "China King Chinese Restaurant",
            "address": "3163 Curlew Rd, Unit 3, Oldsmar, FL 34677",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id36 = UUID().uuidString
        docRefs.document(id36).setData([
            "id": id36,
            "name": "Asian Pearl",
            "address": "2551 Drew St, Clearwater, FL 33765",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id37 = UUID().uuidString
        docRefs.document(id37).setData([
            "id": id37,
            "name": "Wok-N-Roll",
            "address": "2519 N McMullen Booth Rd, Unit 206, Clearwater, FL 33761",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id38 = UUID().uuidString
        docRefs.document(id38).setData([
            "id": id38,
            "name": "Ha Long Bistro",
            "address": "2192 Main St, Dunedin, FL 34698",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id39 = UUID().uuidString
        docRefs.document(id39).setData([
            "id": id39,
            "name": "Kue's Cafe",
            "address": "1452 Main St, Dunedin, FL 34698",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id40 = UUID().uuidString
        docRefs.document(id40).setData([
            "id": id40,
            "name": "Hibachi Buffet",
            "address": "2456 Gulf to Bay Blvd, Clearwater, FL 33765",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id41 = UUID().uuidString
        docRefs.document(id41).setData([
            "id": id41,
            "name": "Asian Kitchen",
            "address": "30611 US-19 N, Palm Harbor, FL 34684",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id42 = UUID().uuidString
        docRefs.document(id42).setData([
            "id": id42,
            "name": "P.F. Chang's",
            "address": "27001 US-19 Frontage Rd N, Clearwater, FL 33761",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id43 = UUID().uuidString
        docRefs.document(id43).setData([
            "id": id43,
            "name": "Chef Li",
            "address": "4013 Tampa Rd, Unit 16, Oldsmar, FL 34677",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id44 = UUID().uuidString
        docRefs.document(id44).setData([
            "id": id44,
            "name": "China 88",
            "address": "1969 Sunset Point Rd, Clearwater, FL 33765",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id45 = UUID().uuidString
        docRefs.document(id45).setData([
            "id": id45,
            "name": "China Taste",
            "address": "658 E Lake Rd, Palm Harbor, FL 34685",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id46 = UUID().uuidString
        docRefs.document(id46).setData([
            "id": id46,
            "name": "YHS China Bistro",
            "address": "302 N Dale Mabry Hwy, Tampa, FL 33609",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id47 = UUID().uuidString
        docRefs.document(id47).setData([
            "id": id47,
            "name": "China One",
            "address": "3665 E Bay Dr, Largo, FL 33771",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id48 = UUID().uuidString
        docRefs.document(id48).setData([
            "id": id48,
            "name": "Wok n Roll",
            "address": "2802 W Kennedy Blvd, Tampa, FL 33609",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id49 = UUID().uuidString
        docRefs.document(id49).setData([
            "id": id49,
            "name": "Happi China Chinese Restaurant",
            "address": "1314 Tampa Rd, Palm Harbor, FL 34683",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id50 = UUID().uuidString
        docRefs.document(id50).setData([
            "id": id50,
            "name": "Oriental Express Chinese Sushi Restaurant",
            "address": "510 E Jackson St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id51 = UUID().uuidString
        docRefs.document(id51).setData([
            "id": id51,
            "name": "Hong Kong City",
            "address": "2198 NE Coachman Rd, Clearwater, FL 33765",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id52 = UUID().uuidString
        docRefs.document(id52).setData([
            "id": id52,
            "name": "Fountain Plus",
            "address": "11245 Causeway Blvd, Brandon, FL 33511",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id53 = UUID().uuidString
        docRefs.document(id53).setData([
            "id": id53,
            "name": "Happi Wok",
            "address": "1252 CR-1, Dunedin, FL 34698",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id54 = UUID().uuidString
        docRefs.document(id54).setData([
            "id": id54,
            "name": "China Wok Clearwater",
            "address": "1506 Gulf to Bay Blvd, Clearwater, FL 33755",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id55 = UUID().uuidString
        docRefs.document(id55).setData([
            "id": id55,
            "name": "China 1",
            "address": "33389 US Highway 19 N, Palm Harbor, FL 34684",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id56 = UUID().uuidString
        docRefs.document(id56).setData([
            "id": id56,
            "name": "Kang's Garden",
            "address": "12221 W Linebaugh Ave, Tampa, FL 33626",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id57 = UUID().uuidString
        docRefs.document(id57).setData([
            "id": id57,
            "name": "Great Wall Chinese",
            "address": "3424 Tampa Rd, Palm Harbor, FL 34684",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id58 = UUID().uuidString
        docRefs.document(id58).setData([
            "id": id58,
            "name": "Zom Hee Chinese Restaurant",
            "address": "9015 Park Blvd, Seminole, FL 33777",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id59 = UUID().uuidString
        docRefs.document(id59).setData([
            "id": id59,
            "name": "Wok & Roll",
            "address": "4725 66th St N, Kenneth City, FL 33709",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id60 = UUID().uuidString
        docRefs.document(id60).setData([
            "id": id60,
            "name": "China Garden",
            "address": "10525 Park Blvd N, Unit 104, Seminole, FL 33772",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id61 = UUID().uuidString
        docRefs.document(id61).setData([
            "id": id61,
            "name": "New Hong Kong Chinese Restaurant",
            "address": "10801 Starkey Rd, Largo, FL 33777",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id62 = UUID().uuidString
        docRefs.document(id62).setData([
            "id": id62,
            "name": "Hong Kong",
            "address": "11204 N Pk Blvd, Seminole, FL 33772",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id63 = UUID().uuidString
        docRefs.document(id63).setData([
            "id": id63,
            "name": "ABC Chinese Cuisine",
            "address": "2705 54th Ave N Unit 3, Saint Petersburg, FL 33714",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id64 = UUID().uuidString
        docRefs.document(id64).setData([
            "id": id64,
            "name": "Lucky Star Chinese Restaurant",
            "address": "4175 66th St N, Saint Petersburg, FL 33709",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id65 = UUID().uuidString
        docRefs.document(id65).setData([
            "id": id65,
            "name": "New China",
            "address": "5448 58th St N, Kenneth City, FL 33709",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id66 = UUID().uuidString
        docRefs.document(id66).setData([
            "id": id66,
            "name": "Dragon Phoenix Chinese Cuisine",
            "address": "9621 Bay Pines Blvd, Saint Petersburg, FL 33708",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id67 = UUID().uuidString
        docRefs.document(id67).setData([
            "id": id67,
            "name": "China 1 Wok",
            "address": "2014 34th St N, Saint Petersburg, FL 33713",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id68 = UUID().uuidString
        docRefs.document(id68).setData([
            "id": id68,
            "name": "China One",
            "address": "3665 E Bay Dr, Largo, FL 33771",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id69 = UUID().uuidString
        docRefs.document(id69).setData([
            "id": id69,
            "name": "New China",
            "address": "928 58th St N, Saint Petersburg, FL 33710",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id70 = UUID().uuidString
        docRefs.document(id70).setData([
            "id": id70,
            "name": "China Garden",
            "address": "10391 66th St N, Pinellas Park, FL 33782",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id71 = UUID().uuidString
        docRefs.document(id71).setData([
            "id": id71,
            "name": "Big Apple Buffet",
            "address": "1030 58th St N, Saint Petersburg, FL 337104",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id72 = UUID().uuidString
        docRefs.document(id72).setData([
            "id": id72,
            "name": "China One of Pinellas Park",
            "address": "7675 49th St N, Pinellas Park, FL 33781",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id73 = UUID().uuidString
        docRefs.document(id73).setData([
            "id": id73,
            "name": "Ha Long Bay",
            "address": "5944 34th St N, St. Petersburg FL 33714",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id74 = UUID().uuidString
        docRefs.document(id74).setData([
            "id": id74,
            "name": "Golden Star Chinese Restaurant",
            "address": "10805 102nd Ave, Seminole, FL 33778",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id75 = UUID().uuidString
        docRefs.document(id75).setData([
            "id": id75,
            "name": "China Gate",
            "address": "12919 Walsingham Rd, Largo, FL 33774",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id76 = UUID().uuidString
        docRefs.document(id76).setData([
            "id": id76,
            "name": "Super Buffet",
            "address": "1035 62nd Ave N, Saint Petersburg, FL 33702",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id77 = UUID().uuidString
        docRefs.document(id77).setData([
            "id": id77,
            "name": "New China Beach",
            "address": "6170 Ulmerton Rd, Unit 4, Clearwater, FL 33760",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id78 = UUID().uuidString
        docRefs.document(id78).setData([
            "id": id78,
            "name": "Hibachi Buffet",
            "address": "2456 Gulf to Bay Blvd, Clearwater, FL 33765",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id79 = UUID().uuidString
        docRefs.document(id79).setData([
            "id": id79,
            "name": "China King",
            "address": "6816 22nd Ave N, Saint Petersburg, FL 33710",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id80 = UUID().uuidString
        docRefs.document(id80).setData([
            "id": id80,
            "name": "China 1",
            "address": "3841 S US Highway 301, Riverview, FL 33578",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id81 = UUID().uuidString
        docRefs.document(id81).setData([
            "id": id81,
            "name": "Shang Hai",
            "address": "10831 Bloomingdale Ave, Riverview, FL 33578",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id82 = UUID().uuidString
        docRefs.document(id82).setData([
            "id": id82,
            "name": "Taiwan Express",
            "address": "11022 S US Highway 41, Gibsonton, FL 33534",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Chinese"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
    }
    
    public func addNewVenuesAmericanCusineType() {
        let docRefs = db.collection("venues")
             
        let id = UUID().uuidString
        docRefs.document(id).setData([
            "id": id,
            "name": "American Social",
            "address": "601 S Harbour Island Blvd, Unit 107, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id2 = UUID().uuidString
        docRefs.document(id2).setData([
            "id": id2,
            "name": "Samaria Cafe",
            "address": "502 N Tampa St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id3 = UUID().uuidString
        docRefs.document(id3).setData([
            "id": id3,
            "name": "Ebbe",
            "address": "1202 N Franklin St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id4 = UUID().uuidString
        docRefs.document(id4).setData([
            "id": id4,
            "name": "211 Restaurant",
            "address": "211 N Tampa St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id5 = UUID().uuidString
        docRefs.document(id5).setData([
            "id": id5,
            "name": "SoFresh",
            "address": "512 N Franklin St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id6 = UUID().uuidString
        docRefs.document(id6).setData([
            "id": id6,
            "name": "Ponte Modern American",
            "address": "1010 Gramercy Ln, Tampa, FL 33607",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id7 = UUID().uuidString
        docRefs.document(id7).setData([
            "id": id7,
            "name": "Yard House",
            "address": "450 Channelside Dr\nTampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id8 = UUID().uuidString
        docRefs.document(id8).setData([
            "id": id8,
            "name": "The Dog Saloon",
            "address": "3311 W Bay to Bay Blvd, Tampa, FL  33629",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id9 = UUID().uuidString
        docRefs.document(id9).setData([
            "id": id9,
            "name": "Yummy House South",
            "address": "302 N Tampa St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id10 = UUID().uuidString
        docRefs.document(id10).setData([
            "id": id10,
            "name": "Naked Farmer",
            "address": "1001 Water St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id11 = UUID().uuidString
        docRefs.document(id11).setData([
            "id": id11,
            "name": "Hattricks",
            "address": "107 S Franklin St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id12 = UUID().uuidString
        docRefs.document(id12).setData([
            "id": id12,
            "name": "Corazon Restaurant And Bar",
            "address": "325 N Florida Ave, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id13 = UUID().uuidString
        docRefs.document(id13).setData([
            "id": id13,
            "name": "Riveters Tampa",
            "address": "2301 N Dale Mabry Hwy, Tampa, FL 33607",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id14 = UUID().uuidString
        docRefs.document(id14).setData([
            "id": id14,
            "name": "TASTE Downtown Tampa",
            "address": "513 S Florida Ave, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id15 = UUID().uuidString
        docRefs.document(id15).setData([
            "id": id15,
            "name": "The Pint and Brew - Downtown Tampa",
            "address": "200 N Tampa St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id16 = UUID().uuidString
        docRefs.document(id16).setData([
            "id": id16,
            "name": "Babushka's",
            "address": "901 W Platt St, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id17 = UUID().uuidString
        docRefs.document(id17).setData([
            "id": id17,
            "name": "Oxford Exchange",
            "address": "420 W Kennedy Blvd, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id18 = UUID().uuidString
        docRefs.document(id18).setData([
            "id": id18,
            "name": "Splitsville",
            "address": "615 Channelside Dr, Unit 120, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id19 = UUID().uuidString
        docRefs.document(id19).setData([
            "id": id19,
            "name": "Union New American",
            "address": "1111 N West Shore Blvd, Tampa, FL 33607",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id20 = UUID().uuidString
        docRefs.document(id20).setData([
            "id": id20,
            "name": "Jackson's Bistro Bar & Sushi",
            "address": "601 S Harbour Island Blvd, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id21 = UUID().uuidString
        docRefs.document(id21).setData([
            "id": id21,
            "name": "The Battery",
            "address": "615 Channelside Dr, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id22 = UUID().uuidString
        docRefs.document(id22).setData([
            "id": id22,
            "name": "Ricks on the River",
            "address": "2305 N Willow Ave, Tampa, FL 33607",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id23 = UUID().uuidString
        docRefs.document(id23).setData([
            "id": id23,
            "name": "BurgerFi",
            "address": "615 Channelside Dr, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id24 = UUID().uuidString
        docRefs.document(id24).setData([
            "id": id24,
            "name": "Anchor and Brine",
            "address": "505 Water St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id25 = UUID().uuidString
        docRefs.document(id25).setData([
            "id": id25,
            "name": "Metro Diner",
            "address": "4011 W Kennedy Blvd, Ste 5, Tampa, FL 33609",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id26 = UUID().uuidString
        docRefs.document(id26).setData([
            "id": id26,
            "name": "Willa's",
            "address": "1700 W Fig St, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id27 = UUID().uuidString
        docRefs.document(id27).setData([
            "id": id27,
            "name": "Naked Farmer",
            "address": "4306 W Gandy Blvd, Tampa, FL 33611",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id28 = UUID().uuidString
        docRefs.document(id28).setData([
            "id": id28,
            "name": "District South Kitchen & Craft",
            "address": "3301 S Dale Mabry Hwy, Tampa, FL 33629",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id29 = UUID().uuidString
        docRefs.document(id29).setData([
            "id": id29,
            "name": "Bare Naked Kitchen",
            "address": "3915 Henderson Blvd, Tampa, FL 33629",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id30 = UUID().uuidString
        docRefs.document(id30).setData([
            "id": id30,
            "name": "Turntable",
            "address": "510 Water St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id31 = UUID().uuidString
        docRefs.document(id31).setData([
            "id": id31,
            "name": "Mise En Place",
            "address": "401 Channelside Dr, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id32 = UUID().uuidString
        docRefs.document(id32).setData([
            "id": id32,
            "name": "Coasis Restaurant & Bar",
            "address": "7701 N Nebraska Ave, Tampa, FL 33604",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id33 = UUID().uuidString
        docRefs.document(id33).setData([
            "id": id33,
            "name": "The C House",
            "address": "6005 N Florida Ave, Tampa, FL 33604",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id34 = UUID().uuidString
        docRefs.document(id34).setData([
            "id": id34,
            "name": "King State",
            "address": "520 E Floribraska Ave, Tampa, FL 33603",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id35 = UUID().uuidString
        docRefs.document(id35).setData([
            "id": id35,
            "name": "Bolay",
            "address": "402 S Dale Mabry Hwy, Tampa, FL 33609",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id36 = UUID().uuidString
        docRefs.document(id36).setData([
            "id": id36,
            "name": "Ulele",
            "address": "1810 N Highland Ave, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id37 = UUID().uuidString
        docRefs.document(id37).setData([
            "id": id37,
            "name": "Graze",
            "address": "2219 S Dale Mabry, Tampa, FL 33629",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id38 = UUID().uuidString
        docRefs.document(id38).setData([
            "id": id38,
            "name": "Noble Crust",
            "address": "11618 N Dale Mabry Hwy, Tampa, FL  33618",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id39 = UUID().uuidString
        docRefs.document(id39).setData([
            "id": id39,
            "name": "Sacred Pepper",
            "address": "15405 N Dale Mabry Hwy, Tampa, FL  33618",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id40 = UUID().uuidString
        docRefs.document(id40).setData([
            "id": id40,
            "name": "Florida Cracker Fish Company",
            "address": "7604 Ehrlich Rd, Tampa, FL  33625",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id41 = UUID().uuidString
        docRefs.document(id41).setData([
            "id": id41,
            "name": "Seaglass Tavern",
            "address": "11935 Sheldon Rd, Tampa, FL  33626",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id42 = UUID().uuidString
        docRefs.document(id42).setData([
            "id": id42,
            "name": "BurgerFi",
            "address": "10647 Sheldon Rd, Tampa, FL  33626",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id43 = UUID().uuidString
        docRefs.document(id43).setData([
            "id": id43,
            "name": "Mother's",
            "address": "12227 W Linebaugh Ave, Tampa, FL  33626",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id44 = UUID().uuidString
        docRefs.document(id44).setData([
            "id": id44,
            "name": "Tampa Bay Brewing Company - Westchase",
            "address": "13937 Monroes Business Park, Tampa, FL  33635",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id45 = UUID().uuidString
        docRefs.document(id45).setData([
            "id": id45,
            "name": "Cody's",
            "address": "11202 W Hillsborough Ave, Tampa, FL  33635",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id46 = UUID().uuidString
        docRefs.document(id46).setData([
            "id": id46,
            "name": "Flamestone America Grill",
            "address": "4009 Tampa Rd, Oldsmar, FL  34677",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id47 = UUID().uuidString
        docRefs.document(id47).setData([
            "id": id47,
            "name": "Kazba Cafe",
            "address": "300 State St E, Oldsmar, FL  34677",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id48 = UUID().uuidString
        docRefs.document(id48).setData([
            "id": id48,
            "name": "The Brinehouse",
            "address": "100 Main St, Unit 104, Safety Harbor, FL  34695",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id49 = UUID().uuidString
        docRefs.document(id49).setData([
            "id": id49,
            "name": "Big Bamboo Bayside",
            "address": "2506 N Rocky Point Dr, Tampa, FL  33607",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id50 = UUID().uuidString
        docRefs.document(id50).setData([
            "id": id50,
            "name": "Whiskey Joe's Bar&Grill",
            "address": "7720 W Courtney Campbell Cswy, Tampa, FL  33607",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id51 = UUID().uuidString
        docRefs.document(id51).setData([
            "id": id51,
            "name": "AQUA",
            "address": "7627 W Courtney Campbell Cswy, Tampa, FL  33607",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id52 = UUID().uuidString
        docRefs.document(id52).setData([
            "id": id52,
            "name": "Oystercatchers",
            "address": "2900 Bayport Dr, Tampa, FL  33607",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id53 = UUID().uuidString
        docRefs.document(id53).setData([
            "id": id53,
            "name": "1823 Kitchen & Bar",
            "address": "2900 Bayport Dr, Tampa, FL  33607",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id54 = UUID().uuidString
        docRefs.document(id54).setData([
            "id": id54,
            "name": "Diesel Garage Grill & Bar",
            "address": "34200 US Highway 19 S, Palm Harbor, FL 34684",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id55 = UUID().uuidString
        docRefs.document(id55).setData([
            "id": id55,
            "name": "Ozona Blue Grilling Co.",
            "address": "125 Orange St, Palm Harbor, FL  34683",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id56 = UUID().uuidString
        docRefs.document(id56).setData([
            "id": id56,
            "name": "Frenchy's Outpost Bar & Grill",
            "address": "466 Causeway Blvd, Dunedin, FL  34698",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id57 = UUID().uuidString
        docRefs.document(id57).setData([
            "id": id57,
            "name": "Marker 8 On the Water",
            "address": "1420 Bayshore Blvd, Dunedin, FL  34698",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id58 = UUID().uuidString
        docRefs.document(id58).setData([
            "id": id58,
            "name": "Bon Appetit",
            "address": "148 Marina Pl, Dunedin, FL  34698",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id59 = UUID().uuidString
        docRefs.document(id59).setData([
            "id": id59,
            "name": "Clear Sky Draught Haus",
            "address": "680 Main St, Dunedin, FL 34698",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id60 = UUID().uuidString
        docRefs.document(id60).setData([
            "id": id60,
            "name": "Miggs Craft Kitchen",
            "address": "1582 Main St, Dunedin, FL  34698",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id61 = UUID().uuidString
        docRefs.document(id61).setData([
            "id": id61,
            "name": "Delco's Original Steaks And Hoagies",
            "address": "1701 Main St, Dunedin, FL  34698",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id62 = UUID().uuidString
        docRefs.document(id62).setData([
            "id": id62,
            "name": "Bacon Street Diner",
            "address": "27001 US-19 Frontage Rd N, Unit 1065",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id63 = UUID().uuidString
        docRefs.document(id63).setData([
            "id": id63,
            "name": "Outpost 611 Eatery & Taphouse",
            "address": "2454 N McMullen Booth Rd, Unit 103, Clearwater, FL 33759",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id64 = UUID().uuidString
        docRefs.document(id64).setData([
            "id": id64,
            "name": "Craft Street Kitchen",
            "address": "3153 Curlew Rd, Oldsmar, FL 34677",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id65 = UUID().uuidString
        docRefs.document(id65).setData([
            "id": id65,
            "name": "Salt Rock Tavern",
            "address": "3689 Tampa Rd, Oldsmar, FL  34677",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id66 = UUID().uuidString
        docRefs.document(id66).setData([
            "id": id66,
            "name": "Gigglewaters",
            "address": "737 Main St, Safety Harbor, FL  34695",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id67 = UUID().uuidString
        docRefs.document(id67).setData([
            "id": id67,
            "name": "The Kitchen Bar and Bistro",
            "address": "156 Fourth Ave N, Safety Harbor, FL  34695",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id68 = UUID().uuidString
        docRefs.document(id68).setData([
            "id": id68,
            "name": "Lenny's Restaurant",
            "address": "21220 US Highway 19 N, Clearwater, FL  33765",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id69 = UUID().uuidString
        docRefs.document(id69).setData([
            "id": id69,
            "name": "Raising Cane's Chicken Fingers",
            "address": "2525 Gulf to Bay Blvd, Clearwater, FL  33765",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id70 = UUID().uuidString
        docRefs.document(id70).setData([
            "id": id70,
            "name": "Papa's New York Diner",
            "address": "1764 Gulf to Bay Blvd, Clearwater, FL  33755",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id71 = UUID().uuidString
        docRefs.document(id71).setData([
            "id": id71,
            "name": "Clear Sky on Cleveland",
            "address": "418 Cleveland St, Clearwater, FL  33755",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id72 = UUID().uuidString
        docRefs.document(id72).setData([
            "id": id72,
            "name": "Frenchy's Rockaway Grill",
            "address": "7 Rockaway St, Clearwater, FL 33767",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id73 = UUID().uuidString
        docRefs.document(id73).setData([
            "id": id73,
            "name": "C&J Bar-B-Que",
            "address": "117th St & Ulmerton Rd, Largo, FL  3377",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id74 = UUID().uuidString
        docRefs.document(id74).setData([
            "id": id74,
            "name": "La Mordida Restaurant Bar & Grill",
            "address": "14100 US Highway 19, Clearwater, FL 33764",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id75 = UUID().uuidString
        docRefs.document(id75).setData([
            "id": id75,
            "name": "Big Jim's Famous Steaks Tavern & Tap",
            "address": "10395 Seminole Blvd, Largo, FL  33778",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id76 = UUID().uuidString
        docRefs.document(id76).setData([
            "id": id76,
            "name": "Studio Movie Grill",
            "address": "7718 113th St N, Seminole, FL 33772",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id77 = UUID().uuidString
        docRefs.document(id77).setData([
            "id": id77,
            "name": "Green Market Cafe",
            "address": "7839C 113th St, Seminole, FL 33772",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id78 = UUID().uuidString
        docRefs.document(id78).setData([
            "id": id78,
            "name": "Clear Sky on Park",
            "address": "13079 Park Blvd N, Seminole, FL 33776",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id79 = UUID().uuidString
        docRefs.document(id79).setData([
            "id": id79,
            "name": "Salt Rock Grill",
            "address": "19325 Gulf Blvd, Indian Shores, FL 33785",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id80 = UUID().uuidString
        docRefs.document(id80).setData([
            "id": id80,
            "name": "Broke N Bored Grill",
            "address": "35 182nd Ave W, Redington Shores, FL 33708",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id81 = UUID().uuidString
        docRefs.document(id81).setData([
            "id": id81,
            "name": "Five Bucks Drinkery",
            "address": "7402 49th St N, Pinellas Park, FL  33781",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American","Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id82 = UUID().uuidString
        docRefs.document(id82).setData([
            "id": id82,
            "name": "Sesh Brewing Company",
            "address": "2221 Fourth St N, Saint Petersburg, FL  33704",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id83 = UUID().uuidString
        docRefs.document(id83).setData([
            "id": id83,
            "name": "Stillwaters Tavern",
            "address": "224 Beach Dr NE, Saint Petersburg, FL  33701",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id84 = UUID().uuidString
        docRefs.document(id84).setData([
            "id": id84,
            "name": "Lucky Lizard Tap House",
            "address": "14953 Gulf Blvd, Madeira Beach, FL 33708",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id85 = UUID().uuidString
        docRefs.document(id85).setData([
            "id": id85,
            "name": "Daiquiri Shak Raw Bar & Grille",
            "address": "14995 Gulf Blvd, Madeira Beach, FL 33708",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id86 = UUID().uuidString
        docRefs.document(id86).setData([
            "id": id86,
            "name": "Angry Pepper",
            "address": "4330 Duhme Rd, Madeira Beach, FL 33708",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id87 = UUID().uuidString
        docRefs.document(id87).setData([
            "id": id87,
            "name": "Cody's",
            "address": "4360 N Park St, Saint Petersburg, FL 33709",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id88 = UUID().uuidString
        docRefs.document(id88).setData([
            "id": id88,
            "name": "Egg Haven Cafe",
            "address": "3601 66th St N, Saint Petersburg, FL  33710",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id89 = UUID().uuidString
        docRefs.document(id89).setData([
            "id": id89,
            "name": "Mad Beach Cantina",
            "address": "13205 Gulf Ln, Madeira Beach, FL 33708",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id90 = UUID().uuidString
        docRefs.document(id90).setData([
            "id": id90,
            "name": "The Boardwalk Grill",
            "address": "204 Johns Pass Boardwalk E, Madeira Beach, FL 33708",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id91 = UUID().uuidString
        docRefs.document(id91).setData([
            "id": id91,
            "name": "Crabby's On The Pass",
            "address": "12754 Kingfish Dr, Treasure Island, FL 33706",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id92 = UUID().uuidString
        docRefs.document(id92).setData([
            "id": id92,
            "name": "Sloppy Joe's",
            "address": "10650 Gulf Blvd, Treasure Island, FL  33706",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id93 = UUID().uuidString
        docRefs.document(id93).setData([
            "id": id93,
            "name": "The Toasted Monkey",
            "address": "678 75th Ave, St. Pete Beach, FL 33706",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id94 = UUID().uuidString
        docRefs.document(id94).setData([
            "id": id94,
            "name": "The Wheelhouse",
            "address": "7220 Central Ave, Saint Petersburg, FL 33707",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id95 = UUID().uuidString
        docRefs.document(id95).setData([
            "id": id95,
            "name": "Dead Bob's",
            "address": "6716 Central Ave S, Saint Petersburg, FL  33707",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["American"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
    }
    
    public func addNewVenuesMexicanCusineType() {
        let docRefs = db.collection("venues")
             
        let id = UUID().uuidString
        docRefs.document(id).setData([
            "id": id,
            "name": "Urban Cantina",
            "address": "200 E Madison St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id2 = UUID().uuidString
        docRefs.document(id2).setData([
            "id": id2,
            "name": "Taco Bus",
            "address": "505 N Franklin St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id3 = UUID().uuidString
        docRefs.document(id3).setData([
            "id": id3,
            "name": "Green Lemon",
            "address": "915 S Howard Ave, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id4 = UUID().uuidString
        docRefs.document(id4).setData([
            "id": id4,
            "name": "Jimmy's Tacos",
            "address": "1604 N 17th St, Tampa, FL 33605",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id5 = UUID().uuidString
        docRefs.document(id5).setData([
            "id": id5,
            "name": "Jotoro Kitchen & Tequila Bar",
            "address": "615 Channelside Dr, Unit 114, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id6 = UUID().uuidString
        docRefs.document(id6).setData([
            "id": id6,
            "name": "Lona By Chef Richard Sandoval",
            "address": "505 Water St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id7 = UUID().uuidString
        docRefs.document(id7).setData([
            "id": id7,
            "name": "Margaritas Mexican Restaurant",
            "address": "209 E Davis Blvd, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id8 = UUID().uuidString
        docRefs.document(id8).setData([
            "id": id8,
            "name": "Los Chapos Tacos",
            "address": "951 E Seventh Ave, Tampa, FL 33605",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id9 = UUID().uuidString
        docRefs.document(id9).setData([
            "id": id9,
            "name": "Crazy Burrito",
            "address": "2506 W Columbus Dr, Tampa, FL 33607",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id10 = UUID().uuidString
        docRefs.document(id10).setData([
            "id": id10,
            "name": "Chiles Mexican Restaurant",
            "address": "3247 W Columbus Dr, Tampa, FL 33607",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id11 = UUID().uuidString
        docRefs.document(id11).setData([
            "id": id11,
            "name": "Bar Taco",
            "address": "1601 W Snow Ave, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id12 = UUID().uuidString
        docRefs.document(id12).setData([
            "id": id12,
            "name": "Miguelitos Taqueria Y Tequilas",
            "address": "2702 W Kennedy Blvd, Tampa, FL 33609",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id13 = UUID().uuidString
        docRefs.document(id13).setData([
            "id": id13,
            "name": "City Dog Cantina",
            "address": "1208 E Kennedy Blvd, Unit 14, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id14 = UUID().uuidString
        docRefs.document(id14).setData([
            "id": id14,
            "name": "Besito Mexican",
            "address": "205 Westshore Plaza, Tampa, FL 33609",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id15 = UUID().uuidString
        docRefs.document(id15).setData([
            "id": id15,
            "name": "La Fiesta Mexican Store",
            "address": "1202 S 22nd St, Tampa, FL 33605",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id16 = UUID().uuidString
        docRefs.document(id16).setData([
            "id": id16,
            "name": "Rene's Mexican Kitchen",
            "address": "4414 N Nebraska Ave, Tampa, FL 33603",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id17 = UUID().uuidString
        docRefs.document(id17).setData([
            "id": id17,
            "name": "Muchachas",
            "address": "1910 N Ola Ave, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id18 = UUID().uuidString
        docRefs.document(id18).setData([
            "id": id18,
            "name": "Lolis Mexican Cravings",
            "address": "1824 N West Shore Blvd, Tampa, FL 33607",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id19 = UUID().uuidString
        docRefs.document(id19).setData([
            "id": id19,
            "name": "Taco Dirty",
            "address": "2221 W Platt St, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id20 = UUID().uuidString
        docRefs.document(id20).setData([
            "id": id20,
            "name": "Lolis Mexican Cravings",
            "address": "3324 W Gandy Blvd, Unit 2, Tampa, FL 33611",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id21 = UUID().uuidString
        docRefs.document(id21).setData([
            "id": id21,
            "name": "Izzy's Tacos",
            "address": "123 S Hyde Park Ave, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id22 = UUID().uuidString
        docRefs.document(id22).setData([
            "id": id22,
            "name": "Acapulco Taqueria",
            "address": "1001 N MacDill Ave, Tampa, FL 33607",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id23 = UUID().uuidString
        docRefs.document(id23).setData([
            "id": id23,
            "name": "Taqueria Emanuel",
            "address": "2800 N MacDill Ave, Unit E, Tampa, FL 33607",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id24 = UUID().uuidString
        docRefs.document(id24).setData([
            "id": id24,
            "name": "Hector's Mexican Food",
            "address": "3121 E Hillsborough Ave, Tampa, FL 33610",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id25 = UUID().uuidString
        docRefs.document(id25).setData([
            "id": id25,
            "name": "Miguel's Mexican Seafood & Grill",
            "address": "3035 W Kennedy Blvd, Tampa, FL 33609",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id26 = UUID().uuidString
        docRefs.document(id26).setData([
            "id": id26,
            "name": "Casita Taqueria",
            "address": "2663 Central Ave, Saint Petersburg, FL 33713",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id27 = UUID().uuidString
        docRefs.document(id27).setData([
            "id": id27,
            "name": "Casita Taqueria",
            "address": "2701 Fourth St N, Saint Petersburg, FL 33704",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id28 = UUID().uuidString
        docRefs.document(id28).setData([
            "id": id28,
            "name": "Chile Verde",
            "address": "2801 22nd Ave N, St. Petersburg, FL 33713",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id29 = UUID().uuidString
        docRefs.document(id29).setData([
            "id": id29,
            "name": "Red Mesa Cantina",
            "address": "128 Third St S, Saint Petersburg, FL 33701",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id30 = UUID().uuidString
        docRefs.document(id30).setData([
            "id": id30,
            "name": "Grand Hacienda",
            "address": "399 11th Ave N, Saint Petersburg, FL 33701",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id31 = UUID().uuidString
        docRefs.document(id31).setData([
            "id": id31,
            "name": "Grumpy Gringo",
            "address": "2510 22nd Ave N, Saint Petersburg, FL 33713",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id32 = UUID().uuidString
        docRefs.document(id32).setData([
            "id": id32,
            "name": "Red Mesa Mercado",
            "address": "1100 First Ave N, Saint Petersburg, FL 33705",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id33 = UUID().uuidString
        docRefs.document(id33).setData([
            "id": id33,
            "name": "Los Homies Taqueria",
            "address": "7625 49th St N, Pinellas Park, FL 33781",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id34 = UUID().uuidString
        docRefs.document(id34).setData([
            "id": id34,
            "name": "Casita Taqueria",
            "address": "2991 66th St N, St. Petersburg, FL 33710",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id35 = UUID().uuidString
        docRefs.document(id35).setData([
            "id": id35,
            "name": "Poppo's Taqueria",
            "address": "1033 Central Ave, Saint Petersburg, FL 33705",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id36 = UUID().uuidString
        docRefs.document(id36).setData([
            "id": id36,
            "name": "Red Mesa Restaurant",
            "address": "4912 Fourth St N, Saint Petersburg, FL  33703",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id37 = UUID().uuidString
        docRefs.document(id37).setData([
            "id": id37,
            "name": "Nueva Cantina",
            "address": "1625 Fourth St, Saint Petersburg, FL 33701",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id38 = UUID().uuidString
        docRefs.document(id38).setData([
            "id": id38,
            "name": "Nuevo Vallarta The Authentic Mexican Food",
            "address": "9359 US Highway 19 N, Pinellas Park, FL 33782",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id39 = UUID().uuidString
        docRefs.document(id39).setData([
            "id": id39,
            "name": "VIP Lounge & Mexican Restaurant",
            "address": "10625 Gulf Blvd, Treasure Island, FL 33706",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id40 = UUID().uuidString
        docRefs.document(id40).setData([
            "id": id40,
            "name": "Que Pasa Mexican Cantina",
            "address": "10478 Roosevelt Blvd N, Saint Petersburg, FL 33716",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id41 = UUID().uuidString
        docRefs.document(id41).setData([
            "id": id41,
            "name": "La Gloria Mexican Restaurant",
            "address": "4505 Park Blvd N, Pinellas Park, FL 33781",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id42 = UUID().uuidString
        docRefs.document(id42).setData([
            "id": id42,
            "name": "El Guerrero Mexican Grill",
            "address": "9727 66th St N, Pinellas Park, FL 33782",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id43 = UUID().uuidString
        docRefs.document(id43).setData([
            "id": id43,
            "name": "Chinelos Taqueria",
            "address": "6210 54th Ave N, Saint Petersburg, FL 33709",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id44 = UUID().uuidString
        docRefs.document(id44).setData([
            "id": id44,
            "name": "Prima Cantina",
            "address": "4945 Gulf Blvd, St Pete Beach, FL 33706",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id45 = UUID().uuidString
        docRefs.document(id45).setData([
            "id": id45,
            "name": "The Floribbean",
            "address": "2410 Central Ave, Saint Petersburg, FL 33712",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id46 = UUID().uuidString
        docRefs.document(id46).setData([
            "id": id46,
            "name": "Grand Hacienda",
            "address": "4393 Gulf Blvd, St Pete Beach, FL 33706",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id47 = UUID().uuidString
        docRefs.document(id47).setData([
            "id": id47,
            "name": "Grand Hacienda",
            "address": "2325 Ulmerton Rd, Unit 3, Clearwater, FL 33762",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id48 = UUID().uuidString
        docRefs.document(id48).setData([
            "id": id48,
            "name": "Martha's Mexican Restaurant",
            "address": "4747 66th St N, Kenneth City, FL 33709",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id49 = UUID().uuidString
        docRefs.document(id49).setData([
            "id": id49,
            "name": "El Huarache Veloz Restaurant Authentic Mexican Food",
            "address": "7100 49th St N, Pinellas Park, FL 33781",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id50 = UUID().uuidString
        docRefs.document(id50).setData([
            "id": id50,
            "name": "Don Pancho Villa",
            "address": "21565 US Highway 19 N, Clearwater, FL 33765",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id51 = UUID().uuidString
        docRefs.document(id51).setData([
            "id": id51,
            "name": "Hacienda Corralejo Mexican kitchen",
            "address": "1228 Cleveland St, Clearwater, FL 33755",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id52 = UUID().uuidString
        docRefs.document(id52).setData([
            "id": id52,
            "name": "Gorditas Don Huicho Mexican Restaurant",
            "address": "2071 Drew St, Clearwater, FL 33765",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id53 = UUID().uuidString
        docRefs.document(id53).setData([
            "id": id53,
            "name": "Taco-Quila",
            "address": "22996 US Highway 19 N, Clearwater, FL 33765",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id54 = UUID().uuidString
        docRefs.document(id54).setData([
            "id": id54,
            "name": "Antojitos Dona Chirris",
            "address": "2095 N Highland Ave, Clearwater, FL 33755",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id55 = UUID().uuidString
        docRefs.document(id55).setData([
            "id": id55,
            "name": "Tequila's Mexican Grill & Cantina",
            "address": "422 Cleveland St, Clearwater, FL 33755",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id56 = UUID().uuidString
        docRefs.document(id56).setData([
            "id": id56,
            "name": "Poblanos Mexican Grill & Bar",
            "address": "2451 N McMullen Booth Rd, Clearwater, FL 33759",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id57 = UUID().uuidString
        docRefs.document(id57).setData([
            "id": id57,
            "name": "Casa Tina",
            "address": "365 Main St, Dunedin, FL 34698",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id58 = UUID().uuidString
        docRefs.document(id58).setData([
            "id": id58,
            "name": "Huarache Azteca",
            "address": "22097 US-19 Frontage Rd N, Clearwater, FL 33765",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id59 = UUID().uuidString
        docRefs.document(id59).setData([
            "id": id59,
            "name": "Santa Fe Mexican Grill",
            "address": "800 Clearwater Largo Rd N, Largo, FL 33770",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id60 = UUID().uuidString
        docRefs.document(id60).setData([
            "id": id60,
            "name": "La Pasadita",
            "address": "1385 Belcher Rd S, Unit e, Largo, FL 33771",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id61 = UUID().uuidString
        docRefs.document(id61).setData([
            "id": id61,
            "name": "Los Magueyes Mexican Grill",
            "address": "9100 Ulmerton Rd, Largo, FL 33771",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id62 = UUID().uuidString
        docRefs.document(id62).setData([
            "id": id62,
            "name": "Carmelita's Mexican Restaurant",
            "address": "7705 Ulmerton Rd, Largo, FL 33771",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id63 = UUID().uuidString
        docRefs.document(id63).setData([
            "id": id63,
            "name": "Julis Mexican Restaurant",
            "address": "3675 SR-580 E, Oldsmar, FL 34677",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id64 = UUID().uuidString
        docRefs.document(id64).setData([
            "id": id64,
            "name": "El Huarache Azteca Restaurant",
            "address": "2908 Roosevelt Blvd, Clearwater, FL 33760",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id65 = UUID().uuidString
        docRefs.document(id65).setData([
            "id": id65,
            "name": "Urban Cantina",
            "address": "200 E Madison St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id66 = UUID().uuidString
        docRefs.document(id66).setData([
            "id": id66,
            "name": "Screaming Jalapeno",
            "address": "100 Main St, Unit 109, Safety Harbor, FL 34695",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id67 = UUID().uuidString
        docRefs.document(id67).setData([
            "id": id67,
            "name": "Senor Rita's Tequileria",
            "address": "923 Broadway, Dunedin, FL 34698",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id68 = UUID().uuidString
        docRefs.document(id68).setData([
            "id": id68,
            "name": "Tia Neni Fiesta Taqueria",
            "address": "1479 Belcher Rd S, Unit AA, Largo, FL 33771",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id69 = UUID().uuidString
        docRefs.document(id69).setData([
            "id": id69,
            "name": "Los Amigos Taqueria Y Tienda",
            "address": "1632 Missouri Ave N, Largo, FL 33770",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id70 = UUID().uuidString
        docRefs.document(id70).setData([
            "id": id70,
            "name": "Happy Cactus Mexican Cocina",
            "address": "2676 Bayshore Blvd, Unit H, Dunedin, FL 34698",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id71 = UUID().uuidString
        docRefs.document(id71).setData([
            "id": id71,
            "name": "Marina Cantina Tequila Bar & Grille",
            "address": "25 Causeway Blvd, Clearwater, FL 33767",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id72 = UUID().uuidString
        docRefs.document(id72).setData([
            "id": id72,
            "name": "Los Chatinos Mexican Cuisine",
            "address": "700 S Missouri Ave, Clearwater, FL 33756",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id73 = UUID().uuidString
        docRefs.document(id73).setData([
            "id": id73,
            "name": "VIP Lounge & Mexican Restaurant",
            "address": "213 Gulf Blvd, Indian Rocks Beach, FL 33785",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
        
        let id74 = UUID().uuidString
        docRefs.document(id74).setData([
            "id": id74,
            "name": "Senor Tequila",
            "address": "486 Poinsettia Ave, Clearwater Beach, FL 33767",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": [],
            "cuisineType": ["Mexican"],
            "drinkType": [],
            "happyHourType": [],
            "brunchType": []
        ])
    }

    public func addNewVenuesJapaneseCusineType() {
        let docRefs = db.collection("venues")
             
        let id = UUID().uuidString
        docRefs.document(id).setData([
            "id": id,
            "name": "Haiku",
            "address": "808 N Franklin St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id2 = UUID().uuidString
        docRefs.document(id2).setData([
            "id": id2,
            "name": "Junmai Station",
            "address": "325 N Florida Ave, Unit C, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id3 = UUID().uuidString
        docRefs.document(id3).setData([
            "id": id3,
            "name": "Dosunco RAMEN",
            "address": "3310 W Kennedy Blvd, Tampa, FL 33609",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id4 = UUID().uuidString
        docRefs.document(id4).setData([
            "id": id4,
            "name": "Koto Japanese Steak house & Sushi Bar",
            "address": "533 S Howard Ave, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id5 = UUID().uuidString
        docRefs.document(id5).setData([
            "id": id5,
            "name": "Noble Rice",
            "address": "615 Channelside Dr, Unit 112, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id6 = UUID().uuidString
        docRefs.document(id6).setData([
            "id": id6,
            "name": "Koya",
            "address": "807 W Platt St, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id7 = UUID().uuidString
        docRefs.document(id7).setData([
            "id": id7,
            "name": "Oriental Express Chinese Sushi Restaurant",
            "address": "510 E Jackson St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id8 = UUID().uuidString
        docRefs.document(id8).setData([
            "id": id8,
            "name": "Kosen",
            "address": "307 W Palm Ave, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id9 = UUID().uuidString
        docRefs.document(id9).setData([
            "id": id9,
            "name": "Secret Garden",
            "address": "505 N Florida Ave, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id10 = UUID().uuidString
        docRefs.document(id10).setData([
            "id": id10,
            "name": "wagamama",
            "address": "1050 Water St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id11 = UUID().uuidString
        docRefs.document(id11).setData([
            "id": id11,
            "name": "Yoko's",
            "address": "3217 S Macdill Ave, Unit D, Tampa, FL 33629",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id12 = UUID().uuidString
        docRefs.document(id12).setData([
            "id": id12,
            "name": "On A Roll Sushi",
            "address": "101 N Franklin St, Suite C, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id13 = UUID().uuidString
        docRefs.document(id13).setData([
            "id": id13,
            "name": "Samurai Blue Ybor",
            "address": "1600 E Eighth Ave, Unit C208, Tampa, FL 33605",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id14 = UUID().uuidString
        docRefs.document(id14).setData([
            "id": id14,
            "name": "Tori Bar",
            "address": "442 W Grand Central Ave, Unit 190, Tampa Bay, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id15 = UUID().uuidString
        docRefs.document(id15).setData([
            "id": id15,
            "name": "Chanko",
            "address": "4603 N Florida Ave, Tampa, FL 33603",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id16 = UUID().uuidString
        docRefs.document(id16).setData([
            "id": id16,
            "name": "Ro Hyde Park",
            "address": "1500 W Swann Ave, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id17 = UUID().uuidString
        docRefs.document(id17).setData([
            "id": id17,
            "name": "Izakaya Tori",
            "address": "310 S Dale Mabry Hwy, Unit 160, Tampa, FL 33609",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id18 = UUID().uuidString
        docRefs.document(id18).setData([
            "id": id18,
            "name": "Sushi Ninja - Tampa",
            "address": "3018 W Kennedy Blvd, Tampa, FL 33609",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id19 = UUID().uuidString
        docRefs.document(id19).setData([
            "id": id19,
            "name": "Ebisu Sushi Shack",
            "address": "5116 N Nebraska Ave, Tampa, FL 33603",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id20 = UUID().uuidString
        docRefs.document(id20).setData([
            "id": id20,
            "name": "Zukku Sushi",
            "address": "1910 N Ola Ave, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id21 = UUID().uuidString
        docRefs.document(id21).setData([
            "id": id21,
            "name": "Ko",
            "address": "306 W Palm Ave, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id22 = UUID().uuidString
        docRefs.document(id22).setData([
            "id": id22,
            "name": "Sushi BRB: Bao, Rolls and Bowls",
            "address": "1500 W Cass St, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id23 = UUID().uuidString
        docRefs.document(id23).setData([
            "id": id23,
            "name": "Soho Sushi",
            "address": "3218 W Kennedy Blvd, Tampa, FL 33609",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id24 = UUID().uuidString
        docRefs.document(id24).setData([
            "id": id24,
            "name": "Ybor City Sushi House",
            "address": "1901 N 19th St, Tampa, FL 33605",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id25 = UUID().uuidString
        docRefs.document(id25).setData([
            "id": id25,
            "name": "Harpoon Harry's Crab House",
            "address": "225 S Franklin St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
    }
    
    public func addNewVenuesIndianCusineType() {
        let docRefs = db.collection("venues")
             
        let id = UUID().uuidString
        docRefs.document(id).setData([
            "id": id,
            "name": "Rasoi Indian Cuisine",
            "address": "1701 E Eighth Ave, Tampa, FL 33605",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id2 = UUID().uuidString
        docRefs.document(id2).setData([
            "id": id2,
            "name": "India's Grill Tampa",
            "address": "3437 W Kennedy Blvd, Tampa, FL 33609",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id3 = UUID().uuidString
        docRefs.document(id3).setData([
            "id": id3,
            "name": "Curry Leaves Indian Cuisine",
            "address": "4843 W Kennedy Blvd, Tampa, FL 33609",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id4 = UUID().uuidString
        docRefs.document(id4).setData([
            "id": id4,
            "name": "Flames Indian Cuisine",
            "address": "2601 S MacDill Ave, Tampa, FL 33629",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id5 = UUID().uuidString
        docRefs.document(id5).setData([
            "id": id5,
            "name": "Bang Bang Bowls",
            "address": "5214 N Nebraska Ave, Tampa, FL 33603",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id6 = UUID().uuidString
        docRefs.document(id6).setData([
            "id": id6,
            "name": "Naans Indian Grill & Bar",
            "address": "2010 Town Center Blvd, Brandon, FL 33511",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id7 = UUID().uuidString
        docRefs.document(id7).setData([
            "id": id7,
            "name": "Taj Indian Cuisine",
            "address": "2734 E Fowler Ave, Tampa, FL 33612",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id8 = UUID().uuidString
        docRefs.document(id8).setData([
            "id": id8,
            "name": "Haveli Indian Kitchen",
            "address": "12908 N Dale Mabry Hwy, Tampa, FL 33618",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id9 = UUID().uuidString
        docRefs.document(id9).setData([
            "id": id9,
            "name": "Tandoor Indian Cuisine",
            "address": "805 E Brandon Blvd, Brandon, FL 33511",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id10 = UUID().uuidString
        docRefs.document(id10).setData([
            "id": id10,
            "name": "Bay Leaves Indian Cuisine",
            "address": "4023 W Waters Ave, Tampa, FL 33614",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id11 = UUID().uuidString
        docRefs.document(id11).setData([
            "id": id11,
            "name": "Curry N Vegan",
            "address": "720 S West Shore Blvd, Tampa, FL 33609",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id12 = UUID().uuidString
        docRefs.document(id12).setData([
            "id": id12,
            "name": "Satkar Indian Cuisine",
            "address": "14422 N Dale Mabry Hwy, Tampa, FL 33618",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id13 = UUID().uuidString
        docRefs.document(id13).setData([
            "id": id13,
            "name": "Pastries N Chaat",
            "address": "1811 E Fowler Ave, Tampa, FL 33612",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id14 = UUID().uuidString
        docRefs.document(id14).setData([
            "id": id14,
            "name": "Kwality Fusion",
            "address": "2025 E Fowler Ave, Tampa, FL 33612",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id15 = UUID().uuidString
        docRefs.document(id15).setData([
            "id": id15,
            "name": "Kurry Xpress",
            "address": "10069 E Adamo Dr, Tampa, FL 33619",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id16 = UUID().uuidString
        docRefs.document(id16).setData([
            "id": id16,
            "name": "India's Grill Brandon",
            "address": "902 E Brandon Blvd, Brandon, FL 33511",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id17 = UUID().uuidString
        docRefs.document(id17).setData([
            "id": id17,
            "name": "Curries Indian Cuisine",
            "address": "29000 US-19 N, Clearwater, FL 33761",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id18 = UUID().uuidString
        docRefs.document(id18).setData([
            "id": id18,
            "name": "Godavari - Tampa",
            "address": "1251 E Fowler Ave, Tampa, FL 33612",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id19 = UUID().uuidString
        docRefs.document(id19).setData([
            "id": id19,
            "name": "Jaiho's The Indian kitchen",
            "address": "12309 University Mall Ct, Tampa, FL 33612",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id20 = UUID().uuidString
        docRefs.document(id20).setData([
            "id": id20,
            "name": "Hyderabad Biryani House",
            "address": "6810 E Fowler Ave, Temple Terrace, FL 33617",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id21 = UUID().uuidString
        docRefs.document(id21).setData([
            "id": id21,
            "name": "Martin's Indian Cuisine",
            "address": "1219 Kingsway Rd, Brandon, FL 33510",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id22 = UUID().uuidString
        docRefs.document(id22).setData([
            "id": id22,
            "name": "Ruchi Indian Kitchen",
            "address": "14546 Bruce B Downs Blvd, Tampa, FL 33613",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id23 = UUID().uuidString
        docRefs.document(id23).setData([
            "id": id23,
            "name": "Apna Bazar",
            "address": "1730 E Fowler Ave, Tampa, FL 33612",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id24 = UUID().uuidString
        docRefs.document(id24).setData([
            "id": id24,
            "name": "Tikka Masalaa Indian Cuisine",
            "address": "10029 W Hillsborough Ave, Tampa, FL 33615",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id25 = UUID().uuidString
        docRefs.document(id25).setData([
            "id": id25,
            "name": "Bawarchi Indian Grill & Bar",
            "address": "2020 W Brandon Blvd, Unit 140, Tampa, FL 33511",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
    }
    
    public func addNewVenuesItalianCusineType() {
        let docRefs = db.collection("venues")
             
        let id = UUID().uuidString
        docRefs.document(id).setData([
            "id": id,
            "name": "Bavaro's",
            "address": "514 N Franklin, Unit 101, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id2 = UUID().uuidString
        docRefs.document(id2).setData([
            "id": id2,
            "name": "Devito's Italian Specialties",
            "address": "200 N Tampa St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id3 = UUID().uuidString
        docRefs.document(id3).setData([
            "id": id3,
            "name": "Bella's Italian Cafe",
            "address": "1413 S Howard Ave, Unit 100, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id4 = UUID().uuidString
        docRefs.document(id4).setData([
            "id": id4,
            "name": "Rocca",
            "address": "323 W Palm Ave, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id5 = UUID().uuidString
        docRefs.document(id5).setData([
            "id": id5,
            "name": "Forbici Modern Italian",
            "address": "1633 W Snow Ave, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id6 = UUID().uuidString
        docRefs.document(id6).setData([
            "id": id6,
            "name": "Oggi Italian",
            "address": "236 E Davis Blvd, Davis Islands, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id7 = UUID().uuidString
        docRefs.document(id7).setData([
            "id": id7,
            "name": "Olivia",
            "address": "3601 W Swann Ave, Tampa, FL 33609",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id8 = UUID().uuidString
        docRefs.document(id8).setData([
            "id": id8,
            "name": "Bernini",
            "address": "1702 E Seventh Ave, Tampa, FL 33605",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id9 = UUID().uuidString
        docRefs.document(id9).setData([
            "id": id9,
            "name": "Tampa Pizza Company",
            "address": "777 N Ashley Dr, Unit C, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id10 = UUID().uuidString
        docRefs.document(id10).setData([
            "id": id10,
            "name": "Don Rigatoni",
            "address": "219 S Packwood Ave, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id11 = UUID().uuidString
        docRefs.document(id11).setData([
            "id": id11,
            "name": "The Brother Trattoria",
            "address": "2402 S MacDill Ave, Tampa, FL 33629",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id12 = UUID().uuidString
        docRefs.document(id12).setData([
            "id": id12,
            "name": "Precinct Pizza",
            "address": "1218 Ray Charles Blvd, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id13 = UUID().uuidString
        docRefs.document(id13).setData([
            "id": id13,
            "name": "Piccola Italia Bistro",
            "address": "2140 W Dr Martin Luther King Jr Blvd, Tampa, FL 33607",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id14 = UUID().uuidString
        docRefs.document(id14).setData([
            "id": id14,
            "name": "Donatello",
            "address": "232 N Dale Mabry Hwy, Tampa, FL 33609",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id15 = UUID().uuidString
        docRefs.document(id15).setData([
            "id": id15,
            "name": "Ava",
            "address": "718 S Howard Ave, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id16 = UUID().uuidString
        docRefs.document(id16).setData([
            "id": id16,
            "name": "Aristotle's Food For Thought",
            "address": "500 N Florida Ave, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id17 = UUID().uuidString
        docRefs.document(id17).setData([
            "id": id17,
            "name": "Market at EDITION",
            "address": "500 Channelside Dr, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id18 = UUID().uuidString
        docRefs.document(id18).setData([
            "id": id18,
            "name": "Brio Italian Grille",
            "address": "2223 N West Shore Blvd, Tampa, FL 33607",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id19 = UUID().uuidString
        docRefs.document(id19).setData([
            "id": id19,
            "name": "Amaretto Ristorante - Tampa",
            "address": "2501 W Tampa Bay Blvd, Tampa, FL 33607",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id20 = UUID().uuidString
        docRefs.document(id20).setData([
            "id": id20,
            "name": "Carmine's Ybor",
            "address": "1802 E Seventh Ave, Tampa, FL 33605",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id21 = UUID().uuidString
        docRefs.document(id21).setData([
            "id": id21,
            "name": "La Terrazza Ristorante Italiano",
            "address": "1727 E Seventh Ave, Tampa, FL 33605",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id22 = UUID().uuidString
        docRefs.document(id22).setData([
            "id": id22,
            "name": "717 South",
            "address": "717 S Howard Ave, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id23 = UUID().uuidString
        docRefs.document(id23).setData([
            "id": id23,
            "name": "Maggiano's Little Italy",
            "address": "203 Westshore Plaza, Tampa, FL 33609",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id24 = UUID().uuidString
        docRefs.document(id24).setData([
            "id": id24,
            "name": "Oronzo",
            "address": "1120 Gramercy Lane, Unit D-200, Tampa, FL 33607",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id25 = UUID().uuidString
        docRefs.document(id25).setData([
            "id": id25,
            "name": "Carrabba's Italian Grill",
            "address": "700 N Dale Mabry Hwy, Tampa, FL 33609",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
    }
    
    public func addNewVenuesThaiCusineType() {
        let docRefs = db.collection("venues")
             
        let id = UUID().uuidString
        docRefs.document(id).setData([
            "id": id,
            "name": "Si-Am Thaimerican Restaurant",
            "address": "713 N Franklin St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id2 = UUID().uuidString
        docRefs.document(id2).setData([
            "id": id2,
            "name": "Lemon Grass Thai Kitchen",
            "address": "3635 W Kennedy Blvd, Tampa, FL 33609",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id3 = UUID().uuidString
        docRefs.document(id3).setData([
            "id": id3,
            "name": "Royal Palace Thai Restaurant",
            "address": "811 S Howard Ave, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id4 = UUID().uuidString
        docRefs.document(id4).setData([
            "id": id4,
            "name": "On A Roll Sushi",
            "address": "101 N Franklin St, Suite C, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id5 = UUID().uuidString
        docRefs.document(id5).setData([
            "id": id5,
            "name": "Pinto Thai Restaurant",
            "address": "4205 S MacDill Ave, Unit F-G, Tampa, FL 33611",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id6 = UUID().uuidString
        docRefs.document(id6).setData([
            "id": id6,
            "name": "Asiatic",
            "address": "1600 E Eighth Ave, Unit D101, Tampa, FL 33605",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id7 = UUID().uuidString
        docRefs.document(id7).setData([
            "id": id7,
            "name": "Thai Island",
            "address": "210 E Davis Blvd, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id8 = UUID().uuidString
        docRefs.document(id8).setData([
            "id": id8,
            "name": "Thai Prime Kitchen & Bar",
            "address": "4142 W Boy Scout Blvd, Unit 5&6, Tampa, FL 33607",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id9 = UUID().uuidString
        docRefs.document(id9).setData([
            "id": id9,
            "name": "Kombo Kitchen",
            "address": "5009 S MacDill Ave, Tampa, FL 33611",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id10 = UUID().uuidString
        docRefs.document(id10).setData([
            "id": id10,
            "name": "Rouen Thai",
            "address": "3324 W Gandy Blvd, Tampa, FL 33611",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id11 = UUID().uuidString
        docRefs.document(id11).setData([
            "id": id11,
            "name": "Chef Thai & Sushi",
            "address": "1155 S Dale Mabry Hwy, Unit 22, Tampa, FL 33629",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id12 = UUID().uuidString
        docRefs.document(id12).setData([
            "id": id12,
            "name": "Thai-Licious",
            "address": "1801-1899 N Angel Oliva Sr St, Tampa, FL 33605",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id13 = UUID().uuidString
        docRefs.document(id13).setData([
            "id": id13,
            "name": "Thai 5 Fast Food",
            "address": "3424 S Dale Mabry Hwy, Tampa, FL 33629",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id14 = UUID().uuidString
        docRefs.document(id14).setData([
            "id": id14,
            "name": "Wandee Asian Fusion",
            "address": "5915 Memorial Hwy, Unit 101, Tampa, FL 33615",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id15 = UUID().uuidString
        docRefs.document(id15).setData([
            "id": id15,
            "name": "Tuk Tuk Thai Fusion",
            "address": "10471 Gibsonton Dr, Riverview, FL 33578",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id16 = UUID().uuidString
        docRefs.document(id16).setData([
            "id": id16,
            "name": "Lemon Grass Thai Kitchen",
            "address": "11106 Bloomingdale Ave, Riverview, FL 33578",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id17 = UUID().uuidString
        docRefs.document(id17).setData([
            "id": id17,
            "name": "Siam Thai Restaurant",
            "address": "9546 W Linebaugh Ave, Tampa, FL 33626",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id18 = UUID().uuidString
        docRefs.document(id18).setData([
            "id": id18,
            "name": "Top China",
            "address": "3810 W Neptune St, Unit B1, Tampa, FL 33629",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id19 = UUID().uuidString
        docRefs.document(id19).setData([
            "id": id19,
            "name": "Jasmine Thai",
            "address": "13248 N Dale Mabry Hwy, Tampa, FL 33618",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id20 = UUID().uuidString
        docRefs.document(id20).setData([
            "id": id20,
            "name": "Jasmine Thai",
            "address": "1947 W Lumsden Rd, Brandon, FL 33511",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id21 = UUID().uuidString
        docRefs.document(id21).setData([
            "id": id21,
            "name": "Asiatic Thai & Sushi Northdale",
            "address": "3825 Northdale Blvd, Tampa, FL 33618",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id22 = UUID().uuidString
        docRefs.document(id22).setData([
            "id": id22,
            "name": "Sawatdee Thai Cuisine",
            "address": "10938 N 56th St, Tampa, FL 33617",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id23 = UUID().uuidString
        docRefs.document(id23).setData([
            "id": id23,
            "name": "Chai Yo Thai",
            "address": "11695 Boyette Rd, Riverview, FL 33569",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id24 = UUID().uuidString
        docRefs.document(id24).setData([
            "id": id24,
            "name": "Tampa Muay Thai",
            "address": "1622 N Franklin St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id25 = UUID().uuidString
        docRefs.document(id25).setData([
            "id": id25,
            "name": "Wat Tampa",
            "address": "5306 Palm River Rd, Tampa, FL 33619",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
    }
    
    public func addNewVenuesFrenchCusineType() {
        let docRefs = db.collection("venues")
             
        let id = UUID().uuidString
        docRefs.document(id).setData([
            "id": id,
            "name": "Chez Faby",
            "address": "500 N Tampa St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id2 = UUID().uuidString
        docRefs.document(id2).setData([
            "id": id2,
            "name": "Boulon Brasserie",
            "address": "1001 Water St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id3 = UUID().uuidString
        docRefs.document(id3).setData([
            "id": id3,
            "name": "The Attic Cafe",
            "address": "500 E Kennedy Blvd, Unit 400, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id4 = UUID().uuidString
        docRefs.document(id4).setData([
            "id": id4,
            "name": "La Creperia Cafe",
            "address": "1729 E Seventh Ave, Tampa, FL 33605",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id5 = UUID().uuidString
        docRefs.document(id5).setData([
            "id": id5,
            "name": "Restaurant BT",
            "address": "2507 S MacDill Ave, Tampa, FL 33629",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id6 = UUID().uuidString
        docRefs.document(id6).setData([
            "id": id6,
            "name": "Parts of Paris Bistro & Bar",
            "address": "146 Fourth Ave N, Safety Harbor, FL 34695",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id7 = UUID().uuidString
        docRefs.document(id7).setData([
            "id": id7,
            "name": "Bistro BT",
            "address": "4267 Henderson Blvd, Tampa, FL 33629",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id8 = UUID().uuidString
        docRefs.document(id8).setData([
            "id": id8,
            "name": "The Left Bank Bistro",
            "address": "1225 Dr Martin Luther King Jr St N, Saint Petersburg, FL 33701",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id9 = UUID().uuidString
        docRefs.document(id9).setData([
            "id": id9,
            "name": "Cassis",
            "address": "170 Beach Dr NE, Saint Petersburg, FL 33701",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id10 = UUID().uuidString
        docRefs.document(id10).setData([
            "id": id10,
            "name": "Big E's Famous Mac and Cheese",
            "address": "2223 N West Shore Blvd, Unit 1002A, Tampa, FL 33607",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id11 = UUID().uuidString
        docRefs.document(id11).setData([
            "id": id11,
            "name": "LALA St Pete",
            "address": "2324 Central Ave, Saint Petersburg, FL 33712",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id12 = UUID().uuidString
        docRefs.document(id12).setData([
            "id": id12,
            "name": "Cafe De Paris Bakery",
            "address": "2300 Gulf Blvd, Indian Rocks Beach, FL 33785",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id13 = UUID().uuidString
        docRefs.document(id13).setData([
            "id": id13,
            "name": "Circles Bistro Carrollwood",
            "address": "13002 N Dale Mabry Hwy, Tampa, FL 33618",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id14 = UUID().uuidString
        docRefs.document(id14).setData([
            "id": id14,
            "name": "Parlor House Bistro",
            "address": "1757 Main St, Dunedin, FL 34698",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id15 = UUID().uuidString
        docRefs.document(id15).setData([
            "id": id15,
            "name": "Renee's Bistro",
            "address": "4010 Boy Scout Blvd, Unit 185, Tampa, FL 33607",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id16 = UUID().uuidString
        docRefs.document(id16).setData([
            "id": id16,
            "name": "Bacchus Wine Bistro",
            "address": "124 Second Ave NE, Saint Petersburg, FL 33701",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id17 = UUID().uuidString
        docRefs.document(id17).setData([
            "id": id17,
            "name": "Liang's Bistro Asian Cuisine",
            "address": "17515 Bruce B Downs Blvd, Tampa, FL 33647",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id18 = UUID().uuidString
        docRefs.document(id18).setData([
            "id": id18,
            "name": "Lottie",
            "address": "501 Fifth Ave NE, Saint Petersburg, FL 33701",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id19 = UUID().uuidString
        docRefs.document(id19).setData([
            "id": id19,
            "name": "Massimo's Eclectic Fine Dining",
            "address": "31876 US Highway 19 North, Palm Harbor, FL 34684",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id20 = UUID().uuidString
        docRefs.document(id20).setData([
            "id": id20,
            "name": "Novu Bistro Bar",
            "address": "95 Central Ave, St. Petersburg, FL 33701",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id21 = UUID().uuidString
        docRefs.document(id21).setData([
            "id": id21,
            "name": "French Quarter Apartments",
            "address": "6423 N Armenia Ave, Tampa, FL 33603",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id22 = UUID().uuidString
        docRefs.document(id22).setData([
            "id": id22,
            "name": "French Accent Salon",
            "address": "4830 W Kennedy Blvd, Unit 195, Tampa, FL 33609",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id23 = UUID().uuidString
        docRefs.document(id23).setData([
            "id": id23,
            "name": "Le Macaron French Pastries",
            "address": "459 Brandon Town Center Drive, Brandon, FL 33511",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id24 = UUID().uuidString
        docRefs.document(id24).setData([
            "id": id24,
            "name": "On French",
            "address": "364 First St N, Saint Petersburg, FL 33701",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
    }
    
    public func addNewVenuesJuiceDrinkType() {
        let docRefs = db.collection("venues")
             
        let id = UUID().uuidString
        docRefs.document(id).setData([
            "id": id,
            "name": "The Blind Tiger Cafe - Coffee Shop",
            "address": "201 N Franklin St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id2 = UUID().uuidString
        docRefs.document(id2).setData([
            "id": id2,
            "name": "Xtreme Juice",
            "address": "619 S Dale Mabry Hwy, Tampa, FL 33609",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id3 = UUID().uuidString
        docRefs.document(id3).setData([
            "id": id3,
            "name": "SOHO Juice Co.",
            "address": "500 S Howard Ave, Unit C, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id4 = UUID().uuidString
        docRefs.document(id4).setData([
            "id": id4,
            "name": "Robeks",
            "address": "1211 E Kennedy Blvd, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id5 = UUID().uuidString
        docRefs.document(id5).setData([
            "id": id5,
            "name": "Toastique",
            "address": "1011 E Cumberland Ave, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id6 = UUID().uuidString
        docRefs.document(id6).setData([
            "id": id6,
            "name": "Clean Juice",
            "address": "1634 W Snow Ave, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id7 = UUID().uuidString
        docRefs.document(id7).setData([
            "id": id7,
            "name": "Nana's Restaurant & Juice Bar",
            "address": "1601 E 4th Ave, Tampa, FL 33605",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id8 = UUID().uuidString
        docRefs.document(id8).setData([
            "id": id8,
            "name": "Tropical Smoothie Cafe",
            "address": "200 N Tampa St, Ste G-120, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id9 = UUID().uuidString
        docRefs.document(id9).setData([
            "id": id9,
            "name": "Fit Bowl Co.",
            "address": "615 Channelside Dr, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id10 = UUID().uuidString
        docRefs.document(id10).setData([
            "id": id10,
            "name": "Raw Smoothie Co.",
            "address": "408 N Howard Ave, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id11 = UUID().uuidString
        docRefs.document(id11).setData([
            "id": id11,
            "name": "Lunch Lady",
            "address": "615 Channelside Dr, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id12 = UUID().uuidString
        docRefs.document(id12).setData([
            "id": id12,
            "name": "Crisp & Green",
            "address": "1055 E Cumberland Ave, Unit H2-115, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id13 = UUID().uuidString
        docRefs.document(id13).setData([
            "id": id13,
            "name": "Grain & Berry",
            "address": "1155 S Dale Mabry Hwy, Tampa, FL 33629",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id14 = UUID().uuidString
        docRefs.document(id14).setData([
            "id": id14,
            "name": "Dwntwn Social",
            "address": "1000 W Kennedy Blvd, Unit 100, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id15 = UUID().uuidString
        docRefs.document(id15).setData([
            "id": id15,
            "name": "Kale Me Crazy",
            "address": "1110 Gramercy Lane, Tampa, FL 33607",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id16 = UUID().uuidString
        docRefs.document(id16).setData([
            "id": id16,
            "name": "Swami Juice",
            "address": "2832 S MacDill Ave, Tampa, FL 33629",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id17 = UUID().uuidString
        docRefs.document(id17).setData([
            "id": id17,
            "name": "Jet City Espresso Hyde Park",
            "address": "318 S Edison Ave, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id18 = UUID().uuidString
        docRefs.document(id18).setData([
            "id": id18,
            "name": "Planet Smoothie",
            "address": "506 W Grand Central Ave, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id19 = UUID().uuidString
        docRefs.document(id19).setData([
            "id": id19,
            "name": "Sweet Soul",
            "address": "1101 S Howard Ave, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id20 = UUID().uuidString
        docRefs.document(id20).setData([
            "id": id20,
            "name": "Rocstar Fitness",
            "address": "100 S Ashley Dr, Unit 600, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id21 = UUID().uuidString
        docRefs.document(id21).setData([
            "id": id21,
            "name": "Fruitwood Standup Market",
            "address": "2203 W Swann Ave, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id22 = UUID().uuidString
        docRefs.document(id22).setData([
            "id": id22,
            "name": "Quattro Empanadas",
            "address": "874 N Tampa St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id23 = UUID().uuidString
        docRefs.document(id23).setData([
            "id": id23,
            "name": "The Exchange Kitchen + Bar",
            "address": "100 E Madison St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id24 = UUID().uuidString
        docRefs.document(id24).setData([
            "id": id24,
            "name": "Magnanimous Brewing",
            "address": "1420 N Florida Ave, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id25 = UUID().uuidString
        docRefs.document(id25).setData([
            "id": id25,
            "name": "Cafe Hey",
            "address": "1540 N Franklin St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
    }
    
    public func addNewVenuesSmoothieDrinkType() {
        let docRefs = db.collection("venues")
             
        let id = UUID().uuidString
        docRefs.document(id).setData([
            "id": id,
            "name": "Tropical Smoothie Cafe",
            "address": "200 N Tampa St, Ste G-120, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id2 = UUID().uuidString
        docRefs.document(id2).setData([
            "id": id2,
            "name": "SOHO Juice Co.",
            "address": "500 S Howard Ave, Unit C, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id3 = UUID().uuidString
        docRefs.document(id3).setData([
            "id": id3,
            "name": "Toastique",
            "address": "1011 E Cumberland Ave, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id4 = UUID().uuidString
        docRefs.document(id4).setData([
            "id": id4,
            "name": "Xtreme Juice",
            "address": "619 S Dale Mabry Hwy, Tampa, FL 33609",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id5 = UUID().uuidString
        docRefs.document(id5).setData([
            "id": id5,
            "name": "Planet Smoothie",
            "address": "506 W Grand Central Ave, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id6 = UUID().uuidString
        docRefs.document(id6).setData([
            "id": id6,
            "name": "The Blind Tiger Cafe - Coffee Shop",
            "address": "201 N Franklin St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id7 = UUID().uuidString
        docRefs.document(id7).setData([
            "id": id7,
            "name": "Dwntwn Social",
            "address": "1000 W Kennedy Blvd, Unit 100, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id8 = UUID().uuidString
        docRefs.document(id8).setData([
            "id": id8,
            "name": "Robeks",
            "address": "1211 E Kennedy Blvd, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id9 = UUID().uuidString
        docRefs.document(id9).setData([
            "id": id9,
            "name": "Raw Smoothie Co.",
            "address": "408 N Howard Ave, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id10 = UUID().uuidString
        docRefs.document(id10).setData([
            "id": id10,
            "name": "Sweet Soul",
            "address": "1101 S Howard Ave, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id11 = UUID().uuidString
        docRefs.document(id11).setData([
            "id": id11,
            "name": "Kale Me Crazy",
            "address": "1110 Gramercy Lane, Tampa, FL 33607",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id12 = UUID().uuidString
        docRefs.document(id12).setData([
            "id": id12,
            "name": "Fit Bowl Co.",
            "address": "615 Channelside Dr, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id13 = UUID().uuidString
        docRefs.document(id13).setData([
            "id": id13,
            "name": "Clean Juice",
            "address": "1634 W Snow Ave, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id14 = UUID().uuidString
        docRefs.document(id14).setData([
            "id": id14,
            "name": "Nana's Restaurant & Juice Bar",
            "address": "1601 E 4th Ave, Tampa, FL 33605",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id15 = UUID().uuidString
        docRefs.document(id15).setData([
            "id": id15,
            "name": "Crisp & Green",
            "address": "1055 E Cumberland Ave\nUnit H2-115\nTampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id16 = UUID().uuidString
        docRefs.document(id16).setData([
            "id": id16,
            "name": "Lunch Lady",
            "address": "615 Channelside Dr, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id17 = UUID().uuidString
        docRefs.document(id17).setData([
            "id": id17,
            "name": "Smoothie King",
            "address": "2205 W Swann Ave, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id18 = UUID().uuidString
        docRefs.document(id18).setData([
            "id": id18,
            "name": "Jet City Espresso Hyde Park",
            "address": "318 S Edison Ave, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id19 = UUID().uuidString
        docRefs.document(id19).setData([
            "id": id19,
            "name": "Tropical Smoothie Cafe",
            "address": "2911 N Dale Mabry Hwy, Tampa, FL 33607",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id20 = UUID().uuidString
        docRefs.document(id20).setData([
            "id": id20,
            "name": "Grain & Berry",
            "address": "1155 S Dale Mabry Hwy, Tampa, FL 33629",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id21 = UUID().uuidString
        docRefs.document(id21).setData([
            "id": id21,
            "name": "Rocstar Fitness",
            "address": "100 S Ashley Dr, Unit 600, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id22 = UUID().uuidString
        docRefs.document(id22).setData([
            "id": id22,
            "name": "City Cafe Of Tampa",
            "address": "410 E Madison St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id23 = UUID().uuidString
        docRefs.document(id23).setData([
            "id": id23,
            "name": "Kava Culture Kava Bar",
            "address": "514 N Franklin St, Unit 102, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id24 = UUID().uuidString
        docRefs.document(id24).setData([
            "id": id24,
            "name": "International Cafe",
            "address": "601 E Twiggs St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id25 = UUID().uuidString
        docRefs.document(id25).setData([
            "id": id25,
            "name": "Farmacy Vegan Kitchen & Bakery",
            "address": "803 N Tampa St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
    }
    
    public func addNewVenuesSodaDrinkType() {
        let docRefs = db.collection("venues")
             
        let id = UUID().uuidString
        docRefs.document(id).setData([
            "id": id,
            "name": "Domino's Pizza",
            "address": "320 E Cass St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id2 = UUID().uuidString
        docRefs.document(id2).setData([
            "id": id2,
            "name": "Paddy Wagon Irish Pub",
            "address": "813 N Tampa St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id3 = UUID().uuidString
        docRefs.document(id3).setData([
            "id": id3,
            "name": "International Cafe",
            "address": "601 E Twiggs St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id4 = UUID().uuidString
        docRefs.document(id4).setData([
            "id": id4,
            "name": "Four Green Fields",
            "address": "702 N Ashley Dr, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id5 = UUID().uuidString
        docRefs.document(id5).setData([
            "id": id5,
            "name": "Sip",
            "address": "1010 N Wc Maciness Pl, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id6 = UUID().uuidString
        docRefs.document(id6).setData([
            "id": id6,
            "name": "sweetgreen",
            "address": "301 W Palm Ave, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id7 = UUID().uuidString
        docRefs.document(id7).setData([
            "id": id7,
            "name": "Salem's Fresh Eats",
            "address": "1611 N Nebraska Ave, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id8 = UUID().uuidString
        docRefs.document(id8).setData([
            "id": id8,
            "name": "Chick-fil-A",
            "address": "401 W Kennedy Blvd, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id9 = UUID().uuidString
        docRefs.document(id9).setData([
            "id": id9,
            "name": "McDonald's",
            "address": "1520 W Kennedy Blvd, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id10 = UUID().uuidString
        docRefs.document(id10).setData([
            "id": id10,
            "name": "McDonald's, Tampa General Hospital",
            "address": "2 Columbia Dr, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id11 = UUID().uuidString
        docRefs.document(id11).setData([
            "id": id11,
            "name": "Wendy's",
            "address": "1615 W Kennedy Blvd, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id12 = UUID().uuidString
        docRefs.document(id12).setData([
            "id": id12,
            "name": "Pink Soda Blow Dry Bar & Salon",
            "address": "1646 W Snow Ave, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id13 = UUID().uuidString
        docRefs.document(id13).setData([
            "id": id13,
            "name": "Taco Bell",
            "address": "1605 W Kennedy Blvd, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
    }
    
    public func addNewVenuesTeaDrinkType() {
        let docRefs = db.collection("venues")
             
        let id = UUID().uuidString
        docRefs.document(id).setData([
            "id": id,
            "name": "Samaria Cafe",
            "address": "502 N Tampa St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id2 = UUID().uuidString
        docRefs.document(id2).setData([
            "id": id2,
            "name": "Kahwa Coffee",
            "address": "808 N Tampa St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id3 = UUID().uuidString
        docRefs.document(id3).setData([
            "id": id3,
            "name": "The Attic Cafe",
            "address": "500 E Kennedy Blvd, Unit 400, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id4 = UUID().uuidString
        docRefs.document(id4).setData([
            "id": id4,
            "name": "Caffeine Roasters",
            "address": "212 E Cass St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id5 = UUID().uuidString
        docRefs.document(id5).setData([
            "id": id5,
            "name": "Cass Street Coffee Company",
            "address": "905 N Florida Ave, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id6 = UUID().uuidString
        docRefs.document(id6).setData([
            "id": id6,
            "name": "Local Mini Donut Co.",
            "address": "411 N Florida Ave, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id7 = UUID().uuidString
        docRefs.document(id7).setData([
            "id": id7,
            "name": "TeBella Tea Company",
            "address": "420 W Kennedy Blvd, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id8 = UUID().uuidString
        docRefs.document(id8).setData([
            "id": id8,
            "name": "Moxies Cafe & Caterer",
            "address": "302 E Kennedy Blvd, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id9 = UUID().uuidString
        docRefs.document(id9).setData([
            "id": id9,
            "name": "The Portico Cafe",
            "address": "1001 N Florida Ave, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id10 = UUID().uuidString
        docRefs.document(id10).setData([
            "id": id10,
            "name": "The Blind Tiger Cafe - Coffee Shop",
            "address": "201 N Franklin St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id11 = UUID().uuidString
        docRefs.document(id11).setData([
            "id": id11,
            "name": "City Cafe Of Tampa",
            "address": "410 E Madison St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id12 = UUID().uuidString
        docRefs.document(id12).setData([
            "id": id12,
            "name": "Dolce Cafe + Marketplace",
            "address": "400 N Tampa St, Unit 104, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id13 = UUID().uuidString
        docRefs.document(id13).setData([
            "id": id13,
            "name": "Fusion Bowl",
            "address": "504 E Kennedy Blvd, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id14 = UUID().uuidString
        docRefs.document(id14).setData([
            "id": id14,
            "name": "Cafe Hey",
            "address": "1540 N Franklin St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id15 = UUID().uuidString
        docRefs.document(id15).setData([
            "id": id15,
            "name": "Cafe 124",
            "address": "124 S Franklin St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id16 = UUID().uuidString
        docRefs.document(id16).setData([
            "id": id16,
            "name": "Buddy Brew Coffee",
            "address": "400 N Tampa St, Unit 110, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id17 = UUID().uuidString
        docRefs.document(id17).setData([
            "id": id17,
            "name": "SteamHeat",
            "address": "1010 N Wc Maciness Pl, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id18 = UUID().uuidString
        docRefs.document(id18).setData([
            "id": id18,
            "name": "Caffe Fresco & Marketplace - Downtown Tampa",
            "address": "101 E Kennedy Blvd, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id19 = UUID().uuidString
        docRefs.document(id19).setData([
            "id": id19,
            "name": "Coffee Uniting People",
            "address": "802 E Whiting St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id20 = UUID().uuidString
        docRefs.document(id20).setData([
            "id": id20,
            "name": "Market at EDITION",
            "address": "500 Channelside Dr, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id21 = UUID().uuidString
        docRefs.document(id21).setData([
            "id": id21,
            "name": "Ginger Beard Coffee",
            "address": "1208 E Kennedy Blvd, Unit 112, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id22 = UUID().uuidString
        docRefs.document(id22).setData([
            "id": id22,
            "name": "Starbucks",
            "address": "901 N Franklin St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id23 = UUID().uuidString
        docRefs.document(id23).setData([
            "id": id23,
            "name": "Fresh Life & Co.",
            "address": "100 Ashley Dr, Unit 220, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id24 = UUID().uuidString
        docRefs.document(id24).setData([
            "id": id24,
            "name": "Cafe Perera",
            "address": "601 N Morgan St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
    }
    
    public func addNewVenuesCoffeeDrinkType() {
        let docRefs = db.collection("venues")
             
        let id = UUID().uuidString
        docRefs.document(id).setData([
            "id": id,
            "name": "Kahwa Coffee",
            "address": "808 N Tampa St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id2 = UUID().uuidString
        docRefs.document(id2).setData([
            "id": id2,
            "name": "Cass Street Coffee Company",
            "address": "905 N Florida Ave, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id3 = UUID().uuidString
        docRefs.document(id3).setData([
            "id": id3,
            "name": "Buddy Brew Coffee",
            "address": "400 N Tampa St, Unit 110, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id4 = UUID().uuidString
        docRefs.document(id4).setData([
            "id": id4,
            "name": "Kava Culture Kava Bar",
            "address": "514 N Franklin St, Unit 102, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id5 = UUID().uuidString
        docRefs.document(id5).setData([
            "id": id5,
            "name": "The Attic Cafe",
            "address": "500 E Kennedy Blvd, Unit 400, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id6 = UUID().uuidString
        docRefs.document(id6).setData([
            "id": id6,
            "name": "Samaria Cafe",
            "address": "502 N Tampa St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id7 = UUID().uuidString
        docRefs.document(id7).setData([
            "id": id7,
            "name": "Caffeine Roasters",
            "address": "212 E Cass St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id8 = UUID().uuidString
        docRefs.document(id8).setData([
            "id": id8,
            "name": "The Blind Tiger Cafe - Coffee Shop",
            "address": "201 N Franklin St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id9 = UUID().uuidString
        docRefs.document(id9).setData([
            "id": id9,
            "name": "Moxies Cafe & Caterer",
            "address": "302 E Kennedy Blvd, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id10 = UUID().uuidString
        docRefs.document(id10).setData([
            "id": id10,
            "name": "The Portico Cafe",
            "address": "1001 N Florida Ave, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id11 = UUID().uuidString
        docRefs.document(id11).setData([
            "id": id11,
            "name": "Ginger Beard Coffee",
            "address": "1208 E Kennedy Blvd, Unit 112, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id12 = UUID().uuidString
        docRefs.document(id12).setData([
            "id": id12,
            "name": "Cafe Hey",
            "address": "1540 N Franklin St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id13 = UUID().uuidString
        docRefs.document(id13).setData([
            "id": id13,
            "name": "Dolce Cafe + Marketplace",
            "address": "400 N Tampa St, Unit 104, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id14 = UUID().uuidString
        docRefs.document(id14).setData([
            "id": id14,
            "name": "Cafe 124",
            "address": "124 S Franklin St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id15 = UUID().uuidString
        docRefs.document(id15).setData([
            "id": id15,
            "name": "Local Mini Donut Co.",
            "address": "411 N Florida Ave, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id16 = UUID().uuidString
        docRefs.document(id16).setData([
            "id": id16,
            "name": "Market at EDITION",
            "address": "500 Channelside Dr, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id17 = UUID().uuidString
        docRefs.document(id17).setData([
            "id": id17,
            "name": "Shortwave Coffee",
            "address": "615 Channelside Dr, Unit 106, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id18 = UUID().uuidString
        docRefs.document(id18).setData([
            "id": id18,
            "name": "The Lab Coffee",
            "address": "1703 West State Street, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id19 = UUID().uuidString
        docRefs.document(id19).setData([
            "id": id19,
            "name": "Fusion Bowl",
            "address": "504 E Kennedy Blvd, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id20 = UUID().uuidString
        docRefs.document(id20).setData([
            "id": id20,
            "name": "Coffee Uniting People",
            "address": "802 E Whiting St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id21 = UUID().uuidString
        docRefs.document(id21).setData([
            "id": id21,
            "name": "City Cafe Of Tampa",
            "address": "410 E Madison St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id22 = UUID().uuidString
        docRefs.document(id22).setData([
            "id": id22,
            "name": "Victory Coffee",
            "address": "101 N 12th St, Unit 101, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id23 = UUID().uuidString
        docRefs.document(id23).setData([
            "id": id23,
            "name": "Pete's Bagels and General Store",
            "address": "1804 E 4th Ave, Tampa, FL 33605",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id24 = UUID().uuidString
        docRefs.document(id24).setData([
            "id": id24,
            "name": "SteamHeat",
            "address": "1010 N Wc Maciness Pl, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id25 = UUID().uuidString
        docRefs.document(id25).setData([
            "id": id25,
            "name": "Caffe Fresco & Marketplace - Downtown Tampa",
            "address": "101 E Kennedy Blvd, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
    }
    
    public func addNewVenuesHotChocolateDrinkType() {
        let docRefs = db.collection("venues")
             
        let id = UUID().uuidString
        docRefs.document(id).setData([
            "id": id,
            "name": "Buddy Brew Coffee",
            "address": "1905 Market St, Tampa, FL 33602",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
        
        let id2 = UUID().uuidString
        docRefs.document(id2).setData([
            "id": id2,
            "name": "Einstein Bros. Bagels",
            "address": "401 W Kennedy Blvd, Tampa, FL 33606",
            "venueType": "restaurant",
            "rating": 0,
            "cost": "",
            "portion": "",
            "popularTimes": "",
            "deals": []
        ])
    }
    
    public func addNewReviews() {
        let docRefs = db.collection("reviews")
             
        let id = UUID().uuidString
        docRefs.document(id).setData([
            "id": id,
            "title": "Could be worse",
            "body": "Happy Hour Man these nuggets is cool a f",
            "profileId": "ru5t4i954g9ig54t",
            "venueId": "3890ue3289ue23",
            "timeStamp": Date.today(),
        ])
        
        let id2 = UUID().uuidString
        docRefs.document(id2).setData([
            "id": id2,
            "title": "WTF if this?",
            "body": "Chicken is cold and that on everythang I is!",
            "profileId": "fj89j3498fj34f34",
            "venueId": "3890ue3289ue23",
            "timeStamp": Date.today(),
        ])
    }
    
    public func addNewSpecials() {
        let docRefs = db.collection("specials")
             
        let id = UUID().uuidString
        docRefs.document(id).setData([
            "id": id,
            "name": "Double Combo",
            "type": "deal",
            "venueId": "3890ue3289ue23",
            "description": "blahblah blah",
            "creationDate": Date.today(),
            "expirationDate": Date.today().next(.monday),
        ])
        
        let id2 = UUID().uuidString
        docRefs.document(id2).setData([
            "id": id2,
            "name": "Buy one get one free",
            "type": "offer",
            "venueId": "e3289ue3289ue23908",
            "description": "blahblah blah",
            "creationDate": Date.today(),
            "expirationDate": Date.today().next(.monday),
        ])
    }
    
    //    //Keeping this to use as example to update db
    //    public func updateMockFIlterData(){
    //        let docRefs = db.collection("filters")
    //
    //        docRefs.document("FB54D5AB-0051-49D1-B447-F2019FAC005C").updateData([
    //            "location": "Clearwater, Fl",
    //            "timeStamp": Date()
    //        ])
    //
    //        docRefs.document("FEB767A3-5D0A-4C71-955F-36924D49D63E").updateData([
    //            "location": "Clearwater, Fl",
    //            "timeStamp": Date()
    //        ])
    //    }
}
