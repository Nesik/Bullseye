//
//  RoundedViews.swift
//  Bullseye
//
//  Created by Robert Wrzochal on 20/06/2022.
//

import SwiftUI

struct RoundedImageViewStroked : View {
    var systemName: String

    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: 56, height: 56)
            .overlay(
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2.0)
            )
    }
}

struct RoundRectTextView: View {
    var text: String

    
    var body: some View {
       Text(text)
            .kerning(-0.2)
            .bold()
            .font(.title3)
            .frame(width: 68, height: 56)
            .foregroundColor(Color("TextColor"))
            .overlay(
                RoundedRectangle(cornerRadius: 21.0)
                    .stroke(lineWidth: 2.0)
                    .foregroundColor(Color("ButtonStrokeColor"))
                                )

    }
}


struct RoundedImageViewFilled: View {
    var systemName: String

    
    var body: some View {
        
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: 56, height: 56)
            .background(
                Circle()
                    .fill(Color("ButtonFilledBackgroundColor")).padding()
            )
        
    }
}

struct PreviewView: View {
    var body: some View{
        VStack(alignment: .center, spacing: 10.0, content: {
            RoundRectTextView(text: "999")
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            RoundedImageViewFilled(systemName: "list.dash")
//            RoundedImageViewFilled(systemName: "list.dash")
        })
        

        
    }
}

struct RoundedViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView()
            .preferredColorScheme(.dark)

    }
}
