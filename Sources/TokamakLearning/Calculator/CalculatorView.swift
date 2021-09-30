//
//  CalculatorView.swift
//  COpenCombineHelpers
//
//  Created by huangjiping on 2021/10/1.
//

import TokamakShim


struct CalculatorView:View {
    var body: some View{
        
        HStack{

            CalculatorButton(title: "1", size: .init(width: 88, height: 88), backgroundColor: .black) {
                print("Button:1")
            }
            CalculatorButton(title: "2", size: .init(width: 88, height: 88), backgroundColor: .black) {
                print("Button:2")
            }
            CalculatorButton(title: "3", size: .init(width: 88, height: 88), backgroundColor: .black) {
                print("Button:3")
            }
            CalculatorButton(title: "+", size: .init(width: 88, height: 88), backgroundColor: .orange) {
                print("Button:4")
            }

        }
    }
}
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
