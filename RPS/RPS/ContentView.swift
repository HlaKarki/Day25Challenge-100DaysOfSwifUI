//
//  ContentView.swift
//  RPS
//
//  Created by Hla Htun on 7/16/22.
//

import SwiftUI

struct ContentView: View {
    let rpsStandard = ["Rock", "Paper", "Scissors"]
    @State private var rps = ["Rock", "Paper", "Scissors"].shuffled()
    @State private var winOrLose = ["win", "lose"].shuffled()
    @State private var userChoice = "Scissors"
    
    @State private var alertText = ""
    @State private var result = ""
    @State private var isShowing = false
    @State private var finalBool = false
    @State private var score = 0
    @State private var questions = 0
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                Gradient.Stop(color: Color(red: 0.7, green: 0.2, blue: 0.3), location: 0.1),
                Gradient.Stop(color: Color(red: 0.6, green: 0.3, blue: 0.5), location: 0.2),
                Gradient.Stop(color: Color(red: 0.4, green: 0.5, blue: 0.6), location: 0.4),
                Gradient.Stop(color: Color(red: 0.2, green: 0.6, blue: 0.4), location: 0.8)
            ], center: .bottom, startRadius: 200, endRadius: 1000)
                .ignoresSafeArea()
            
            VStack {
                
                Section {
                    Text("Computer plays: \(rps[0])")
                        .font(.largeTitle.weight(.medium))
                        .padding()
                    
                    Text("And to win this round, you need to \(winOrLose[0]) to the computer.")
                        .font(.title.weight(.regular))
                        .padding()
                }
                
                Section {
                    VStack {
                        Text("What should you play to win?")
                            .font(.title.weight(.regular))
                            .padding(.vertical)
                        
                        ForEach(0..<3, id:\.self) { number in
                            Button("\(rpsStandard[number])") {
                                computeResult(rpsStandard[number])
                            }
                        }
                        .padding()
                        .foregroundStyle(.black)
                        .background(.thinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                        .alert(result, isPresented: $isShowing) {
                            Button(alertText, action: reset )
                        }
                        .alert(result, isPresented: $finalBool) {
                            Button(alertText, action: reset)
                        }
                    }
                    .padding()
                }
                
                
                Text("Questions: \(questions)/8")
                    .font(.title.weight(.regular))
                
            }
        }
    }
    
    func computeResult(_ userChoice: String) {
        
        
        questions += 1
        
        if winOrLose[0] == "win" {
            if rps[0] == "Rock" {
                if userChoice == "Paper" {
                    result = "You win!"
                }
                else if userChoice == "Rock" {
                    result = "You neither lost nor won!"
                }
                else {
                    result = "You lose!"
                }
            }
            else if rps[0] == "Paper" {
                if userChoice == "Scissors" {
                    result = "You win!"
                }
                else if userChoice == "Paper" {
                    result = "You neither lost nor won!"
                }
                else {
                    result = "You lose!"
                }
            }
            else {
                if userChoice == "Rock" {
                    result = "You win!"
                }
                else if userChoice == "Scissors" {
                    result = "You neither lost nor won!"
                }
                else {
                    result = "You lose!"
                }
            }
        }
        else {
            if rps[0] == "Rock" {
                if userChoice == "Scissors" {
                    result = "You win!"
                }
                else if userChoice == "Rock" {
                    result = "You neither lost nor won!"
                }
                else {
                    result = "You lose!"
                }
            }
            else if rps[0] == "Paper" {
                if userChoice == "Rock" {
                    result = "You win!"
                }
                else if userChoice == "Paper" {
                    result = "You neither lost nor won!"
                }
                else {
                    result = "You lose!"
                }
            }
            else {
                if userChoice == "Paper" {
                    result = "You win!"
                }
                else if userChoice == "Scissors" {
                    result = "You neither lost nor won!"
                }
                else {
                    result = "You lose!"
                }
            }
        }
        
        if result == "You win!" {
            score += 1
        }
        
        
        
        if questions == 8 {
            finalBool = true
            result = "Round completed!\nYour final score was \(score)!"
            questions = 0
            alertText = "Restart new round"
        }
        else {
            alertText = "Next Round"
            isShowing = true
        }
    }
    
    func reset() {
        
        rps = rps.shuffled()
        winOrLose = winOrLose.shuffled()
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
