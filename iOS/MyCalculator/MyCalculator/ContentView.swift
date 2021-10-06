//
//  ContentView.swift
//  MyCalculator
//
//  Created by huangjiping on 2021/10/6.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject
    private var model:CalculatorModel
    @State
    private var editingHistory = false
    var body : some View {
        VStack(alignment: .center, spacing: 12) {
//            Spacer()
            Button("操作历史：\(model.history.count)") {
                self.editingHistory = true
            }.sheet(isPresented: self.$editingHistory){
                HistoryView()
            }
            
            
            Text(model.brain.output)
                .font(.system(size: 77))
                .minimumScaleFactor(0.5)
                .padding(.trailing, 24)
                .lineLimit(1)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
            CalculatorButtonPad()
                .padding(.bottom)

        }
        .frame( minHeight: 0, maxHeight: .infinity, alignment: .bottom)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(CalculatorModel())
    }
}
