//
//  CalculatorButton.swift
//  TokamakLearning
//
//  Created by huangjiping on 2021/10/1.
//

import TokamakShim

struct CalculatorButton: View {
    
    var fontSize : CGFloat = 38
    let title : String
    var size:CGSize
    let backgroundColor:Color
    let action:()->Void
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: fontSize))
                .foregroundColor(.white)
                .frame(width: size.width, height: size.height, alignment: .center)
                .background(backgroundColor)
                .cornerRadius(size.width * 0.5)
        }
    }
}

