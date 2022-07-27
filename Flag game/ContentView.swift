//
//  ContentView.swift
//  Flag game
//
//  Created by Екатерина К on 27.07.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["UK", "USA", "Argentina", "Bangladesh", "Brazil", "Canada", "China", "Czech", "Denmark", "Finland", "Germany", "Greece", "Israel", "Japan", "Kazakhstan", "Russia", "Scotland", "SouthKorea", "Sweden", "Uzbekistan"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [.black, .gray], startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
