//
//  HealthAppSwiftUIApp.swift
//  HealthAppSwiftUI
//
//  Created by Geovanni Fuentes on 2023-12-05.
//

import SwiftUI

@main
struct HealthAppSwiftUIApp: App {
    let environment = AppEnvironment.bootstrap()
    var body: some Scene {
        WindowGroup {
            ActivitiesView(viewModel: ActivitiesViewModel(container: environment.container))
                .inject(environment.container)
        }
    }
}
