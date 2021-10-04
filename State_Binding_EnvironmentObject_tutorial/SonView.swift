//
//  SonView.swift
//  State_Binding_EnvironmentObject_tutorial
//
//  Created by Seokhyun Kim on 2021-10-01.
//

import SwiftUI

struct SonView: View {
    
    @EnvironmentObject var viewModel: ViewModel

    @Binding var count : Int
    
    @State var title : String = ""

    init(count: Binding<Int> = .constant(99)) {
        _count = count
    }
    
    var body : some View {
        VStack {
            Text(title)
                .font(.system(size: 26))
            Text("Wonjin Kim count: \(count)")
                .padding()
            Button(action: {
                count = count + 1
            }, label: {
                Text("count app")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(10.0)
            })
        }
        .onReceive(viewModel.$appTitle, perform: { receivedAppTitle in
            print("ContentView receivedAppTitle :", receivedAppTitle)
            title = receivedAppTitle
        })
    }
}
