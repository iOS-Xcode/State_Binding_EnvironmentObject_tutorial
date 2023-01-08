//
//  ViewModel.swift
//  State_Binding_EnvironmentObject_tutorial
//
//  Created by Seokhyun Kim on 2021-10-04.
//

import Foundation

class ViewModel: ObservableObject {
    //시작하자마자 @Published 를 통해 값이 ContentView 쪽으로 값을 전송한다.
    @Published var appTitle : String = "Seokhyun's Life"
}
