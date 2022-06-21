//
//  Shapes.swift
//  Bullseye
//
//  Created by Robert Wrzochal on 20/06/2022.
//

import SwiftUI

struct Shapes: View {
    var body: some View {
        VStack{
            Circle()
//                .fill(Color.blue)
//                .inset(by: 40.0)
//                .stroke(Color.blue, lineWidth: 20.0)
                .frame(width: 200.0, height: 100.0, alignment: .center)
        }
        .background(Color.green)
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
