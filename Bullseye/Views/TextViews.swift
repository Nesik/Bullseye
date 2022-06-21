//
//  TextViews.swift
//  Bullseye
//
//  Created by Robert Wrzochal on 20/06/2022.
//

import SwiftUI

struct InstructionText: View {
    var text: String

    var body: some View {
        //"🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE YOU CAN TO "
        Text(text.uppercased()).kerning(2.0).bold().tracking(2.0)
            .multilineTextAlignment(.center).font(.footnote).foregroundColor(Color("TextColor"))
    }
}

struct BigNumberText: View {
    var text: String

    var body: some View {
        Text(text).font(.largeTitle).fontWeight(.black).kerning(-1.0).foregroundColor(Color( "TextColor"))
    }
}

struct LabelText: View {
    var text: String

    var body: some View {
        Text(text)
            .bold()
            .font(.caption)
            .kerning(1.5)
            .foregroundColor(Color("TextColor"))
        
    }
}


struct SliderLabelText: View {
    var text: String

    var body: some View {
        Text(text).font(.body).fontWeight(.bold).foregroundColor(Color("TextColor")).frame(width: 35.0)
    }
}



struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            InstructionText(text: "Instructions")
            BigNumberText(text: "23")
            SliderLabelText(text: "1")
            LabelText(text: "999")
        }
    }
}
