//
//  MatchedButtonAndCard.swift
//  SparrowCodeSwiftUIBootcamp_Task7
//
//  Created by Валерий Зазулин on 18.03.2024.
//

import SwiftUI

struct MatchedButtonAndCard: View {
    
    @State var isClicked: Bool = false
    @Namespace var namespace
    
    var body: some View {
        if !isClicked {
            smallButton
        } else {
            bigCardButton
        }
    }
}

#Preview {
    MatchedButtonAndCard()
}

extension MatchedButtonAndCard {
    var smallButton: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.accentColor)
                        .matchedGeometryEffect(id: "buttonBackground", in: namespace)
                        .frame(width: 80, height: 50)
                    Button {
                        withAnimation(.spring) {
                            isClicked.toggle()
                        }
                    } label: {
                        HStack {
                            Image(systemName: "arrowshape.backward.fill")
                                .scaleEffect(0)
                            Text("Open")
                                .foregroundStyle(Color.white)
                        }
                        .matchedGeometryEffect(id: "buttonText", in: namespace, properties: .position)
                        .font(.headline)
                    }
                    .offset(x: -15)
                }
            }
        }
        .padding()
    }
    
    var bigCardButton: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.accentColor)
                .matchedGeometryEffect(id: "buttonBackground", in: namespace)
            VStack {
                HStack {
                    Button {
                        withAnimation(.spring) {
                            isClicked.toggle()
                        }
                    } label: {
                        HStack {
                            Image(systemName: "arrowshape.backward.fill")
                                .scaleEffect(1)
                            Text("Back")
                        }
                        .matchedGeometryEffect(id: "buttonText", in: namespace, properties: .position)
                        .font(.headline)
                        .foregroundStyle(Color.white)
                        .frame(width: 100, height: 50)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
        .frame(width: 300, height: 400)
        .padding()
    }
}
