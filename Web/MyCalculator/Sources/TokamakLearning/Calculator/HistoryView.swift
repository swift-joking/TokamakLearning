//
//  HistoryView.swift
//  TokamakLearning
//
//  Created by huangjiping on 2021/10/5.
//

import TokamakShim

struct HistoryView:View {
    
    @EnvironmentObject
    var model:CalculatorModel
    
    var body: some View{
        
        VStack{
            if model.totalCount == 0 {
                Text("没有履历")
            }else{
                HStack{
                    Text("履历").font(.headline)
                    Text("\(model.historyDetail)")//.lineLimit(nil)
                }
                HStack{
                    Text("显示").font(.headline)
                    Text("\(model.brain.output)")
                }
                Slider(value: $model.slidingIndex, in: 0...Float(model.totalCount), step: 1)
            }

        }.padding()
    }
}
