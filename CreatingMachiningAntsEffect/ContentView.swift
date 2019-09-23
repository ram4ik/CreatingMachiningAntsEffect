//
//  ContentView.swift
//  CreatingMachiningAntsEffect
//
//  Created by ramil on 23/09/2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var moveOn = false
    @State var moveAlong = false // 1. Create animation state with the initial state value
    
    var body: some View {
        ZStack {
            Text("Animating Dashphrase")
                .font(.largeTitle)
                .offset(y: -300)
            
            Circle()
                .frame(width: 15)
                .opacity(1/2)
                .offset(x: 150)
            
            Circle()
                .frame(width: 15)
                .opacity(1/2)
                .offset(x: -150)
            
            Capsule()
                .trim(from: 0, to: 1)
                .stroke(Color.blue, style:
                    StrokeStyle(
                        lineWidth: 5,
                        lineJoin: .round,
                        dash: [10, 10],
                        dashPhase: moveAlong ? 0 : 40)) //3. Effect to be animated
                .frame(width: 350, height: 50)
                // 4. Add animation
                .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false).speed(2))
                .onAppear() {
                    self.moveAlong.toggle()
            }
            
            Image(systemName: "gift.fill")
                .font(.largeTitle)
                .foregroundColor(.orange)
                .opacity(moveOn ? 0 : 1)
                .offset(x: moveOn ? 150 : -150, y: -50)
                .animation(Animation.easeInOut(duration: 8).repeatForever(autoreverses: false))
                .onAppear() {
                    self.moveOn.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
