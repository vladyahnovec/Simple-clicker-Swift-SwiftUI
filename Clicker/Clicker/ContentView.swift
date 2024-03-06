//
//  ContentView.swift
//  Clicker
//
//  Created by Круглич Влад on 6.03.24.
//

import SwiftUI

struct ContentView: View {
    
    func countClick(_ count: Int) -> Int {
        let n = count + 1
        return n
    }
    
    func textOutput(_ count: Int, _ target: Int) -> (String, Int)? {
        if count == target {
            return ("Поздравляю!\nВы сделали \(target) кликов", target * 10)
        } else {
            return nil
        }
    }
    
    @State var count = 0
    @State var target = 10
    @State var text = ""

    var body: some View {
        GeometryReader() { geometry in
            VStack {
                cirlceBg(count: $count)
                    .frame(height: geometry.size.height / 2)
                Text(text)
                    .multilineTextAlignment(.center)
                    .frame(height: 200)
                    .font(.custom("Montserrat-Light", size: 25))
                Button(action: {
                    count = countClick(count)
                    (text, target) = textOutput(count, target) ?? ("", target)
                }) {
                    Text("Click!")
                        .frame(width: geometry.size.width / 2, height: geometry.size.height / 10)
                        .background(Color.circleBgColorFirst)
                        .foregroundColor(.whiteCircleColor)
                        .cornerRadius(120)
                        .font(.custom("Montserrat-Bold", size: 30))
                }
                .padding(.top, 20)
            }
            .padding()
        }
    }
}

struct cirlceBg : View {
    @Binding var count : Int
    var body: some View {
        GeometryReader { geometry in
            ZStack() {
                ZStack() {
                    ZStack() {
                        Circle()
                            .fill(Color.circleBgColorFirst)
                            .frame(width: 1.4*geometry.size.width)
                            .padding(.top, -200)
                            .padding(.leading, 40)
                        Circle()
                            .fill(Color.circleBgColorSecond)
                            .frame(width: 1.4*geometry.size.width)
                            .padding(.top, -170)
                            .padding(.leading, 60)
                        Circle()
                            .fill(Color.circleBgColorThree)
                            .frame(width: 1.4*geometry.size.width)
                            .padding(.top, -140)
                            .padding(.leading, 80)
                    }
                }
                HStack() {
                    Text("\(count)")
                           .foregroundColor(Color.whiteCircleColor)
                           .font(.custom("Montserrat-Bold", size: 100))
                           .padding(.top, -100)
                }
            }
            .frame(width: geometry.size.width)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
