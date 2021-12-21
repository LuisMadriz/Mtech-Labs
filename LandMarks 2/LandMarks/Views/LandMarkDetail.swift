//
//  LandMarkDetail.swift
//  LandMarks
//
//  Created by Luis Madriz on 12/7/21.
//

import SwiftUI

struct LandMarkDetail: View {
    var landmark: Landmark
    
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading){
                Text(landmark.name)
                    .font(.title)
                HStack {
                    Text(landmark.park)
                        
                    Spacer()
                    Text(landmark.state)
                        
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
            
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct LandMarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandMarkDetail(landmark: landmarks[0])
    }
}
