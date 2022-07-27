//
//  ContentView.swift
//  Flag game
//
//  Created by Екатерина К on 27.07.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["UK", "USA", "Argentina", "Bangladesh", "Brazil", "Canada", "Czech", "Denmark", "Finland", "Germany", "Greece", "Japan", "Russia", "Scotland", "SouthKorea", "Sweden"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [.black, .gray], startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    Text("Choose a flag:")
                        .font(.headline)
                        .fontWeight(.black)
                        .foregroundColor(Color.white)
                    
                    Text(countries[correctAnswer])
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(Color.white)
                        .padding(.top, 1.0)
                }
                
                ForEach(0..<3) { number in
                    Button(action: {
                        //
                    }) {
                        Image(self.countries[number])
                            .frame(width: 250, height: 150)
                            .clipShape(Rectangle())
                            .shadow(color: .black, radius: 3)
                    }
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
