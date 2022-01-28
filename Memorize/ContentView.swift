//
//  ContentView.swift
//  Memorize
//
//  Created by joaovitor on 03/01/22.
//
 
import SwiftUI

struct ContentView: View {
    @State var emojis: [String]
    @State var emojiCount = 4
    
    let emojisVehicles = ["🚗", "✈️", "🛳", "🚀", "🚠", "🛰", "🚅", "🚘", "🛺", "🚑", "🚜", "⛵️", "🚓", "🛵", "🚲", "🚡", "🚂", "🛩", "🚁", "🚤", "🚊", "🚍", "🏎", "🛶"]
    
    let emojisFood = ["🥐", "🥯", "🍞", "🥖", "🥨", "🧀", "🥚", "🍳", "🧈", "🥞", "🧇", "🥓", "🥩", "🍗", "🍖", "🌭", "🍔", "🍟", "🍕", "🫓", "🥪", "🥙", "🧆", "🌮"]
    
    let emojisFace = ["😀", "😃", "😅", "😂", "🤣", "☺️", "🥲", "😊", "😇", "🙂", "🙃", "😉", "😌", "😍", "🥰", "😘", "😋", "🤩", "🧐", "😎", "🥳", "🥵", "🥶", "🥺"]
    
    init() {
        emojis = emojisVehicles.sorted()
    }
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.title)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                Spacer()
                vehicles
                Spacer()
                food
                Spacer()
                faces
                Spacer()
                
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .padding()
        
    }
    
    var vehicles: some View {
        Button {
            emojiCount = Int.random(in: 8...12)
            emojis = emojisVehicles.sorted()
        } label: {
            VStack {
                Image(systemName: "car.fill")
                Text("Vehicles").font(.caption)
            }
        }
    }
    
    var food: some View {
        Button {
            emojiCount = Int.random(in: 12...18)
            emojis = emojisFood.sorted()
        } label: {
            VStack {
                Image(systemName: "mustache.fill")
                Text("Food").font(.caption)
            }
        }
    }
    
    var faces: some View {
        Button {
            emojiCount = Int.random(in: 18...24)
            emojis = emojisFace.sorted()
        } label: {
            VStack {
                Image(systemName: "person.circle.fill")
                Text("Faces").font(.caption)
            }
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = false
    
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20)
        // forma de passar a função para o argumento content: de forma limpa
        // Abv: ZStack(content: { ... })
        ZStack {
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
