//
//  TodayView.swift
//  State_Binding_EnvironmentObject_tutorial
//
//  Created by Seokhyun Kim on 2021-10-01.
//

import SwiftUI

struct WifeView: View {
    
    @EnvironmentObject var viewModel: ViewModel

    @Binding var count : Int
    
    @State var title : String = ""
    
    var body : some View {
        VStack {
            Text(title)
                .font(.system(size: 26))
            Text("Namyoung Park count: \(count)")
                .padding()
            Button(action: {
                count = count + 1
            }, label: {
                Text("count app")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10.0)
            })
        }
        .onReceive(viewModel.$appTitle, perform: { receivedAppTitle in
            print("ContentView receivedAppTitle :", receivedAppTitle)
            title = receivedAppTitle
        })
    }
}
