//
//  State_Binding_EnvironmentObject_tutorialApp.swift
//  State_Binding_EnvironmentObject_tutorial
//
//  Created by Seokhyun Kim on 2021-09-30.
//

import SwiftUI

@main
struct State_Binding_EnvironmentObject_tutorialApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView(appTitle: "Just Test")
            ContentView().environmentObject(ViewModel())
        }
    }
}
