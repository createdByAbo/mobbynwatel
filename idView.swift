//
//  idView.swift
//  mObywatel
//

import SwiftUI

struct idView: View {
    
    func getCurrentDateTime() -> String{
        let date = Date()
        let calendar = Calendar.current
        var hour = calendar.component(.hour, from: date)
        var minute = calendar.component(.minute, from: date)
        var second = calendar.component(.second, from: date)
        var day = calendar.component(.day, from: date)
        var month = calendar.component(.month, from: date)
        var year = calendar.component(.year, from: date)
        var type = "AM"
        if (calendar.component(.hour, from: date) >= 13)
        {
            hour = calendar.component(.hour, from: date) - 12
            type = "PM"
        }
        if (minute < 10){
            var minute = "0\(minute)"
        }
        if (second < 10){
            var second = "0\(second)"
        }
        if (day < 10){
            var day = "0\(day)"
        }
        if (month < 10){
            var month = "0\(month)"
        }
        return "Czas: \(hour):\(minute):\(second) \(type) \(day).\(month).\(year)"
    }
    
    var rows : [GridItem] = [
        GridItem(.fixed(UIScreen.main.bounds.size.height/30.45)),
            GridItem(.flexible()),
        GridItem(.fixed(UIScreen.main.bounds.size.height/45)),
        ]
    
    let interval: TimeInterval = 0.5
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color(red: 0.9529411764705882, green: 0.9607843137254902, blue: 0.9803921568627451)
                    .ignoresSafeArea()
                LazyHGrid(rows: rows) {
                    NavigationLink(destination: ContentView()) {
                        Image("idheader")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.size.width/1, height: UIScreen.main.bounds.size.height/20.45)
                            .padding(0)
                            .scaledToFit()
                    }
                    ScrollView(.vertical, showsIndicators: false) {
                        TimelineView(.periodic(from: .now, by: interval)) { context in
                                Text(getCurrentDateTime())
                                    .font(.system(size: 10))
                        }
                        Image("iddata")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.size.width/1.15, height: UIScreen.main.bounds.size.height/2.05)
                            .padding(0)
                            .cornerRadius(15)
                            .scaledToFit()
                        Image("idfooter")
                            .resizable()
                        
                        .cornerRadius(15)
                        .frame(width: UIScreen.main.bounds.size.width/1.15, height: UIScreen.main.bounds.size.height/2.15)
                            .padding(0)
                            .scaledToFit()
                    }
                }
                
            }
            
        }
        .toolbar(.hidden)
        .navigationTitle("idView")
    }
}

#Preview {
    idView()
}
