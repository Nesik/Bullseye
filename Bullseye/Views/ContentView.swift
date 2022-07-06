//
//  ContentView.swift
//  Bullseye
//
//  Created by Robert Wrzochal on 15/06/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible: Bool = false
    @State private var sliderValue: Double = 50.0
    @State private var game: Game = Game()
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionsView(game: $game).padding(.bottom, 100)
                HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)

            }
            SliderView(sliderValue: $sliderValue)

        }
    }
}

struct InstructionsView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack {
            InstructionText(text: "🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE YOU CAN TO ")
            BigNumberText(text: String(game.target))
        }
    }
}

struct HitMeButton: View {
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game


    
    var body: some View {
        Button {
            self.alertIsVisible = true
        } label: {
            Text("Hit me".uppercased()).bold()
                .font(.title3)
        }
        .alert(isPresented: $alertIsVisible) {
            let roundedValue = Int(self.sliderValue.rounded())
            let points = game.points(sliderValue: roundedValue)
            return Alert(title: Text("Hello there!"), message: Text("The slider's value is \(roundedValue).\n" + "You scored \(points) points this round"), dismissButton: .default(Text("Awesome!")) {
                game.startNewRound(points: game.points(sliderValue: Int(sliderValue)))

            })
        }.padding(20.0)
        
            .background(
                ZStack {
                    Color("ButtonColor")
                    LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
                }
            )
            .foregroundColor(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 21.0).strokeBorder(Color.white, lineWidth: 2.0)
            )
            .cornerRadius(21.0)
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            SliderLabelText(text: "1")
            Slider(value: self.$sliderValue, in: 1.0...100.0)
            SliderLabelText(text: "100")
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
    }
}

/*

 */
