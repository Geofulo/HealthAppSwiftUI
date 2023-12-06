//
//  Activity.swift
//  HealthAppSwiftUI
//
//  Created by Geovanni Fuentes on 2023-12-05.
//

import Foundation

struct Activity: Decodable, Identifiable {
    let id: String
    let name: String
    let metValue: String
    let description: String
    let intensityLevel: Int
}

extension Activity {
    init(model: ActivityEntryModel) {
        self.init(
            id: model.id,
            name: model.activity,
            metValue: model.metValue,
            description: model.description,
            intensityLevel: model.intensityLevel
        )
    }
}
