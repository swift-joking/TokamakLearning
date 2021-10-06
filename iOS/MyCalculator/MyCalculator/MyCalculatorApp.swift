//
//  MyCalculatorApp.swift
//  MyCalculator
//
//  Created by huangjiping on 2021/10/6.
//

import SwiftUI

@main
struct MyCalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(CalculatorModel())
        }
    }
}
