//
//  ActivitiesViewModel.swift
//  HealthAppSwiftUI
//
//  Created by Geovanni Fuentes on 2023-12-06.
//

import Foundation
import Combine
import SwiftUI

final class ActivitiesViewModel: ObservableObject {
    let container: DIContainer
    var disposables = Set<AnyCancellable>()
    
    @Published var activities: [Activity] = []
    
    init(container: DIContainer) {
        self.container = container
    }
    
    func loadActivities() {
        container
            .interactors
            .activitiesInteractor
            .load()
            .receive(on: RunLoop.main)
            .sink { error in
                if case let .failure(error) = error {
                    print("Error: \(error)")
                }
            } receiveValue: { [self] values in
                activities = values
            }
            .store(in: &disposables)
    }
}
