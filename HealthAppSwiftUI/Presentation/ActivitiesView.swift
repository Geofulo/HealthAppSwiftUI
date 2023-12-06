//
//  ActivitiesView.swift
//  HealthAppSwiftUI
//
//  Created by Geovanni Fuentes on 2023-12-05.
//

import SwiftUI
import Combine

struct ActivitiesView: View {
    @StateObject var viewModel: ActivitiesViewModel

    var body: some View {
        NavigationView {
            content
                .onAppear {
                    viewModel.loadActivities()
                }
        }
    }
    
    @ViewBuilder private var content: some View {
        List(viewModel.activities) { activity in
            Text(activity.name)
        }        
    }
}
