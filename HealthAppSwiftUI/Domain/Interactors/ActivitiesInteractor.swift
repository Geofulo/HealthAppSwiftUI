//
//  ActivityRepository.swift
//  HealthAppSwiftUI
//
//  Created by Geovanni Fuentes on 2023-12-05.
//

import Foundation
import SwiftUI
import Combine

protocol ActivitiesInteractor {
    func load() -> AnyPublisher<[Activity], Error>
}

struct RealActivitiesInteractor: ActivitiesInteractor {
    let apiRespository: ActivitiesApiRepository
    
    init(apiRespository: ActivitiesApiRepository, appState: Store<AppState>) {
        self.apiRespository = apiRespository
    }
    
    func load() -> AnyPublisher<[Activity], Error> {
        apiRespository
            .loadActivities()
            .map { $0.data }
            .map { $0.map { Activity(model: $0) } }
            .eraseToAnyPublisher()
    }
}

struct StubActivitiesInteractor: ActivitiesInteractor {
    func load() -> AnyPublisher<[Activity], Error> {
        Just([])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func load(activities: Binding<[Activity]>) {
        
    }
}
