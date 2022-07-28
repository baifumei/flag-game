import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["UK", "USA", "Argentina", "Bangladesh", "Brazil", "Canada", "Czech", "Denmark", "Finland", "Germany", "Greece", "Japan", "Russia", "Scotland", "SouthKorea", "Sweden"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
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
                        self.flagTapped(number)
                        self.showingScore = true
                    }) {
                        Image(self.countries[number])
                            .frame(width: 250, height: 150)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(color: .white, radius: 3)
                    }
                }
                Divider()
                    .padding(.top)
                    .frame(width: 500,height: 1)
                    .background(Color.white)
                    .shadow(color: .black, radius: 3)
                    
                
                Text("Score: \(score)")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                
                
                Spacer()
            }
        }.alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Your answer is right!"
            score += 1
        } else {
            scoreTitle = "Nooo, your answer is wrong. This flag is \(countries[number])"
            score -= 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
