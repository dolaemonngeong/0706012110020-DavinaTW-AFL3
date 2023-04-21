/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 A view showing the details for a hike.
 */

import SwiftUI

struct HikeDetail: View {
    let hike: Hike
    @State var dataToShow = \Hike.Observation.elevation
    
    // inisialisasi variabel untuk tombol
    var buttons = [
        ("Elevation", \Hike.Observation.elevation),
        ("Heart Rate", \Hike.Observation.heartRate),
        ("Pace", \Hike.Observation.pace)
    ]
    
    var body: some View {
        VStack {
            HikeGraph(hike: hike, path: dataToShow)
                .frame(height: 200)
            
            HStack(spacing: 25) {
                ForEach(buttons, id: \.0) { value in
                    
                    // menampilkan tombol Elevation, Heart Rate, dan Pace
                    Button {
                        dataToShow = value.1
                    } label: {
                        Text(value.0)
                            .font(.system(size: 15))
                            .foregroundColor(value.1 == dataToShow
                                             ? .gray
                                             : .accentColor)
                        // tidak dapat memberi animasi pada text
                            .animation(nil)
                    }
                }
            }
        }
    }
}

struct HikeDetail_Previews: PreviewProvider {
    static var previews: some View {
        HikeDetail(hike: ModelData().hikes[0])
    }
}
