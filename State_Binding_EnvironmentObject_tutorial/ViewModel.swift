//
//  ViewModel.swift
//  State_Binding_EnvironmentObject_tutorial
//
//  Created by Seokhyun Kim on 2021-10-04.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var appTitle : String = "Seokhyun's Life"
}
