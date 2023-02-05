//
//  MapView.swift
//  Versify
//
//  Created by Kai Linsley on 2/4/23.
//

import SwiftUI
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinates: CLLocationCoordinate2D
}


struct MapView: View {
    
    var location: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 36.999122, longitude: -122.060818), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    let colleges = [
        Location(name: "Cowell/Stevenson", coordinates: CLLocationCoordinate2D(latitude: 36.996812, longitude: -122.053074)),
        Location(name: "Crown/Merrill", coordinates: CLLocationCoordinate2D(latitude: 37.000128, longitude: -122.054409)),
        Location(name: "9/JRL", coordinates: CLLocationCoordinate2D(latitude: 37.000616, longitude: -122.057714)),
        Location(name: "Porter/Kresge", coordinates: CLLocationCoordinate2D(latitude: 36.994250, longitude: -122.066083)),
        Location(name: "RC/Oakes", coordinates: CLLocationCoordinate2D(latitude: 36.991602, longitude: -122.065382))
    ]
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $region, annotationItems: colleges) {
                college in
                MapAnnotation(coordinate: college.coordinates) {
                    Circle()
                        .stroke(.red, lineWidth: 3)
                        .frame(width: 44, height: 44)
            
                }
            }
            Picker("", selection: $selection) {
                ForEach(colleges, id: \.self) {
                    Text($0)
                        .foregroundColor(.white)
                }
            }
            .pickerStyle(.inline)
            .frame(maxWidth: 300, maxHeight: 320)
            .padding(.top)
            .padding(.bottom)
        }
    }
    
    
    private func setregion(_ coordinate: CLLocationCoordinate2D) {
    region = MKCoordinateRegion(
        center: location,
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(location: CLLocationCoordinate2D(latitude: 36.974117, longitude: -122.030792))
    }
}