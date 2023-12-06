//
//  ActivityEntryModel.swift
//  HealthAppSwiftUI
//
//  Created by Geovanni Fuentes on 2023-12-06.
//

import Foundation

struct ActivitiesResponseEntryModel: Decodable {
    let data: [ActivityEntryModel]
}

struct ActivityEntryModel: Decodable {
    let id: String
    let activity: String
    let metValue: String
    let description: String
    let intensityLevel: Int
}
