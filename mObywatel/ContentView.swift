//
//  ContentView.swift
//  mobywatel
//

import SwiftUI

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

struct ContentView: View {
    
    @State private var screenSize = CGSize()
    
    var rows : [GridItem] = [
            GridItem(.fixed(UIScreen.main.bounds.size.height/7.5)),
            GridItem(.fixed(UIScreen.main.bounds.size.height/4.01)),
            GridItem(.fixed(UIScreen.main.bounds.size.height/2.67)),
            GridItem(.flexible()),
            GridItem(.fixed(UIScreen.main.bounds.size.height/10.15))
        ]
    
    var idColumns : [GridItem] = [
        GridItem(.fixed(UIScreen.main.bounds.size.width/1.2)),
        GridItem(.fixed(UIScreen.main.bounds.size.width/1.2)),
        GridItem(.fixed(UIScreen.main.bounds.size.width/1.2)),
    ]

        var body: some View {
            
            NavigationView {
                ZStack {
                    Color(red: 0.9568627450980393, green: 0.9647058823529412, blue: 0.984313725490196)
                        .ignoresSafeArea()
                    
                    LazyHGrid(rows: rows) {
                        Image("header")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.size.width/1.1, height: UIScreen.main.bounds.size.height/7.4)
                            .padding(0)
                            .scaledToFit()
                            
                            ScrollView(.horizontal) {
                                LazyVGrid(columns: idColumns, content: {
                                    Spacer()
                                    
                                    NavigationLink(destination: idView()) {
                                        Image("id")
                                            .resizable()
                                            .frame(width: UIScreen.main.bounds.size.width/1.2, height: UIScreen.main.bounds.size.height/4.01)
                                            .cornerRadius(20)
                                            .scaledToFit()
                                    }
                                    Image("driverslicence")
                                                                    .resizable()
                                                                    .frame(width: UIScreen.main.bounds.size.width/1.2, height: UIScreen.main.bounds.size.height/4.01)
                                                                    .cornerRadius(20)
                                                                    .scaledToFit()
                                })
                                
                            }

                        Image("services")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.size.width / 1.15, height: UIScreen.main.bounds.size.height/2.67)
                            .scaledToFit()
                        Spacer()
                        Image("footer")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.size.width / 1.1, height: UIScreen.main.bounds.size.height/10.15)
                            .scaledToFit()
                    }
                }
                }
            .toolbar(.hidden)
            .navigationTitle("ContentView")
    }
}
#Preview {
    ContentView()
}
