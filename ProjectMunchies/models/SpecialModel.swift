//
//  SpecialModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 1/28/24.
//

import Foundation

struct SpecialModel: Identifiable, Hashable {
    var id: String
    var name: String
    var type: String
    var venueId: String
    var description: String
    var creationDate: Date
    var expirationDate: Date
}

var emptySpecialModel: SpecialModel = SpecialModel(
    id: "",
    name: "",
    type: "",
    venueId: "",
    description: "",
    creationDate: Date.today(),
    expirationDate: Date.today()
)

var specialsSample: [SpecialModel] = [
    SpecialModel(
        id: "0",
        name: "",
        type: "deal",
        venueId: "4jr4949349",
        description: "blahfa ladfhfasd",
        creationDate: Date.today(),
        expirationDate: Date.today()
    ),
    SpecialModel(
        id: "1",
        name: "",
        type: "offer",
        venueId: "frjr89434r3",
        description: "blah blah blah",
        creationDate: Date.today(),
        expirationDate: Date.today()
    )
]
