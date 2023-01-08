//
//  ContentView.swift
//  State_Binding_EnvironmentObject_tutorial
//
//  Created by Seokhyun Kim on 2021-09-30.
//

/*
 State, Binding, EnvironmentObject
 
 1. @State값이 변경 되었을때 화면에 보여줘야 할때
 2. @Binding : state 같은 녀석들을 화면간에 공유해야 할땨 좁은 영역
 3. @EnvironmentObject : ViewModel을 지정하고 화위뷰에 모두 공유해야 할 때
 */
import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    @State var count = 0
    
    @State var appTitle : String = ""

//    var appTitle : String
//
//    init(appTitle: String = "Life Time") {
//        self.appTitle = appTitle
//    }
    
    var body: some View {
            TabView {
                VStack {
                    Text("Seokhyun Kim count: \(count)")
                        .padding()
                    Button(action: {
                        count = count + 1
                        viewModel.appTitle = "Canada life \(count) days"
                    }, label: {
                        Text("count app")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10.0)
                    })
                }
                    .tabItem { Label("SH", systemImage: "pencil.circle")}
                //@State 변수를 다른 뷰와 공유하고 싶을 때 @Binding을 쓴다.
                //이렇게 되면 3개의 View, 즉 위의 뷰, WifeView, SonView의 count 값이 공유된다.
                WifeView(count: $count)
                    .tabItem { Label("NY", systemImage: "folder.fill")}
                SonView(count: $count)
                    .tabItem { Label("WJ", systemImage: "pencil.circle")}
            } //TabView
            .overlay(Text(appTitle).offset(y: -(UIScreen.main.bounds.height * 0.4)))
        //Publisher로 들어오는 데이타를 감지해서 액션을 취한다. appTitle은 State이므로 view를 다시 그린다.
            .onReceive(viewModel.$appTitle, perform: { receivedAppTitle in
                print("ContentView receivedAppTitle :", receivedAppTitle)
                appTitle = receivedAppTitle
            })
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
