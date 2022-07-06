//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Robert Wrzochal on 21/06/2022.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game

    
    
    var body: some View {
        VStack {
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(
            RingsView()
        )
    }
}

struct RingsView : View {
    @Environment(\.colorScheme) var colorScheme
    
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                    .edgesIgnoringSafeArea(.all)
            ForEach(1..<6) { ring in
                let size = CGFloat(ring * 100)
                let opacity = colorScheme == .dark ? 0.1 : 0.3
                Circle()
                    .stroke(lineWidth: 20.0)
                    .fill(
                        RadialGradient(gradient: Gradient(colors: [Color("RingsColor").opacity(opacity), Color("RingsColor").opacity(0)]), center: .center, startRadius: 100, endRadius: 300)
                    )
                    .frame(width: size, height: size)
            }
        }
    }
}

struct TopView: View {
    @Binding var game: Game


    
    var body: some View {
        HStack {
            Button(action: {
                game.restart()
            }, label: {
                RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            })
            Spacer()
            RoundedImageViewFilled(systemName: "list.dash")
        }
    }
}

struct NumberView: View {
    var title: String
    var text: String

    var body: some View {
        VStack(alignment: .center, spacing: 5, content: {
            LabelText(text: title.uppercased())
            RoundRectTextView(text: text)
        })
            
        
    }
}

struct BottomView: View {
    @Binding var game: Game
    
    var body: some View {
        HStack {
            NumberView(title: "Score", text: String(game.score))
            Spacer()
            NumberView(title: "Round", text: String(game.round))
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack {
            BackgroundView(game: .constant(Game()))
            
        }
       
    }
}
