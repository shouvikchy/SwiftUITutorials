//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Bayshore Communication on 4/7/24.
//

import SwiftUI

struct LandmarkList: View {
    @State private var showFavouritesOnly = true
    var filteredLandmarks : [Landmark]{
        landmarks.filter{ landmark in
            (!showFavouritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List(filteredLandmarks,id:\.name) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark:landmark)
                              } label: {
                                  LandmarkRow(landmark: landmark)
                              }

            }
            .navigationTitle("Landmarks")
        }detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
}

