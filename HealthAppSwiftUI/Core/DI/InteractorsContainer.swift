//
//  InteractorsContainer.swift
//  HealthAppSwiftUI
//
//  Created by Geovanni Fuentes on 2023-12-05.
//

import Foundation

extension DIContainer {
    struct Interactors {
        let activitiesInteractor: ActivitiesInteractor
        
        init(activitiesInteractor: ActivitiesInteractor) {
            self.activitiesInteractor = activitiesInteractor
        }
        
        static var stub: Self {
            .init(activitiesInteractor: StubActivitiesInteractor())
        }
    }
}
