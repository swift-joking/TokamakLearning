//
//  CalculatorButtonItem.swift
//  TokamakLearning
//
//  Created by huangjiping on 2021/10/2.
//

import Foundation
import TokamakCore

enum CalculatorButtonItem {
    enum Op:String {
        case plus = "+"
        case minus = "-"
        case divide = "÷"
        case multiply = "x"
        case equal = "="
    }
    
    enum Command:String {
        case clear = "AC"
        case flip = "+/-"
        case percent = "%"
    }
    
    case digit(Int)
    case dot
    case op(Op)
    case command(Command)
}

extension CalculatorButtonItem{
    var title:String{
        switch self {
        case .digit(let value):return String(value)
        case .dot: return "."
        case .op(let op): return op.rawValue
        case .command(let cm):return cm.rawValue
        }
    }
    
    var size:CGSize {
        
        if case .digit(let value) = self , value == 0 {
            return CGSize(width: 88 * 2 + 5, height: 88)
        }
        return CGSize(width: 88, height: 88)
    }
    var backgroundColor:Color {
        switch self {
        case .digit,.dot:return .gray
        case .op: return .black
        case .command: return .orange
        }
    }
}
extension CalculatorButtonItem:CustomStringConvertible{
    var description: String{
        title
    }
}
extension CalculatorButtonItem:Hashable{}
