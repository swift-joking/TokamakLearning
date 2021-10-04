//
//  CalculatorButtonRow.swift
//  TokamakLearning
//
//  Created by huangjiping on 2021/10/2.
//

import TokamakShim

struct CalculatorButtonRow:View {
    
    let row:[CalculatorButtonItem]
    @Binding
    var brain:CalculatorBrain

    var body: some View {
        
        HStack( spacing: 5){
            ForEach(row, id: \.self) { item in
                CalculatorButton(title: item.title, size: item.size, backgroundColor: item.backgroundColor) {
                    print(item.title)
                    self.brain = self.brain.apply(item: item)
                }
                .frame(width: item.size.width, height: item.size.height)
                .cornerRadius(item.size.width * 0.5)
            }
        }
    }
    
}
