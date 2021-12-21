//
//  LandmarkList.swift
//  LandMarks
//
//  Created by Luis Madriz on 12/7/21.
//

import SwiftUI


struct LandmarkList: View {
    
    
    var body: some View {
        NavigationView {
            List(landmarks) { landmark in
                NavigationLink {
                    LandMarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
               
            }
            .navigationTitle("Landmarks")
        }
    }
}
    
struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
                   LandmarkList()
                       .previewDevice(PreviewDevice(rawValue: deviceName))
                       .previewDisplayName(deviceName)
        }
    }
}

