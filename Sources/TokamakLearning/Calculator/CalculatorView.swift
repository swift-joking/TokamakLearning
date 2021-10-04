//
//  CalculatorView.swift
//  COpenCombineHelpers
//
//  Created by huangjiping on 2021/10/1.
//

import TokamakShim

/**
 @State修饰的属性属于值类型的属性监听，
 @Binding修饰的属性属于引用类型的属性监听
 */

struct CalculatorView:View {
    
    @State
    private var brain:CalculatorBrain = .left("0")
    var body : some View {
        VStack(alignment: .trailing, spacing: 12) {
//            Spacer()
            Text(brain.output)
                .font(.system(size: 77))
//                .minimumScaleFactor(0.5)
                .padding(.trailing, 24)
//                .lineLimit(1)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
            CalculatorButtonPad(brain: self.$brain)
                .padding(.bottom)

        }
        .frame( minHeight: 0, maxHeight: .infinity, alignment: .bottomTrailing)
    }
}



//        HStack{
//
//            CalculatorButton(title: "1", size: .init(width: 88, height: 88), backgroundColor: .black) {
//                print("Button:1")
//            }
//            CalculatorButton(title: "2", size: .init(width: 88, height: 88), backgroundColor: .black) {
//                print("Button:2")
//            }
//            CalculatorButton(title: "3", size: .init(width: 88, height: 88), backgroundColor: .black) {
//                print("Button:3")
//            }
//            CalculatorButton(title: "+", size: .init(width: 88, height: 88), backgroundColor: .orange) {
//                print("Button:4")
//            }
//
//        }


/*
 Text("+")
     .font(.system(size: 38))
     .foregroundColor(.white)
     .frame(width: 88, height: 88, alignment: .center)
     .background(Color.orange)
     .cornerRadius(44)
 
Text("+")
    .font(.title)
    .foregroundColor(.white)
//            .background(Color.orange)
    .padding()
    .background(Color.orange)
*/
