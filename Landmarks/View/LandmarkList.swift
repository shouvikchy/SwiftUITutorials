//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Bayshore Communication on 4/7/24.
//

import SwiftUI

struct LandmarkList: View {
    @State private var showFavoritesOnly = false
    var filteredLandmarks : [Landmark]{
        landmarks.filter{ landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                                 Text("Favorites only")
                             }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.bouncy, value: filteredLandmarks)

            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
}

