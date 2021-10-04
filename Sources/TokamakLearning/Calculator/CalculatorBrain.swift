//
//  CalculatorBrain.swift
//  TokamakLearning
//
//  Created by huangjiping on 2021/10/3.
//

import Foundation
import TokamakShim

enum CalculatorBrain {
    case left(String)
    case leftOp(left:String,op:CalculatorButtonItem.Op)
    case leftOpRight(left:String,op:CalculatorButtonItem.Op,right:String)
    case error
    
}

extension CalculatorBrain {
    
    var output:String{
        let result:String
        switch self {
        case .left(let left):
            result = left
        case let .leftOp(left,op):
            result = left + op.rawValue
        case let .leftOpRight(left,op, right):
            result = left + op.rawValue + right
        default:
            result = "Error"
        }
        return result

    }
    
    var formatter:NumberFormatter  {
       let f = NumberFormatter()
        f.minimumFractionDigits = 0
        f.maximumFractionDigits = 8
        f.numberStyle = .decimal
        return f
    }
    
    func apply(item:CalculatorButtonItem) -> CalculatorBrain {
        switch item {
        case .digit(let num):
            return apply(num: num)
        case .dot:
            return applyDot()
        case .op(let op):
            return apply(op:op)
        case .command(let cm):
            return apply(command:cm)
        }
    }
    
    private func apply(num:Int) -> CalculatorBrain {
        switch self {
        case .left(let left):
            if left == "0" {
                return .left("\(num)")
            }
            return .left(left + "\(num)")
        case let .leftOp(left, op):
            return .leftOpRight(left: left, op: op, right: "\(num)")
        case let .leftOpRight(left, op, right):
            
            let value :String
            if right == "0" {
                value = "\(num)"
            }else{
                value = right + "\(num)"
            }
            return .leftOpRight(left: left, op: op, right: value)
        default:
            return .error
        }
    }
    
    private func applyDot() -> CalculatorBrain {
        switch self {
        case .left(let left):
            if left.contains(".") {
                return .left(left)
            }
            return .left(left + ".")
            
        case let .leftOp(left, op):
            return .leftOp(left: left, op: op)
            
        case let .leftOpRight(left, op, right):
            if right.contains(".") {
                return .leftOpRight(left: left, op: op, right: right)
            }
            return .leftOpRight(left: left, op: op, right: right + ".")
            
        default:
            return .error
        }
    }
    
    private func apply(op:CalculatorButtonItem.Op) -> CalculatorBrain {
                
        switch self {
        case .left(let left):
            if case CalculatorButtonItem.Op.equal = op  {
                return .left(left)
            }
            return .leftOp(left: left, op: op)
            
        case let .leftOp(left, oriOp):
            if case CalculatorButtonItem.Op.equal = op {
                return .leftOp(left: left, op: oriOp)
            }
            return .leftOp(left: left, op: op)
            
        case let .leftOpRight(left,oriOp,right):
            let res = makeCalculate(left: left, op: oriOp, right: right)
            guard res != "Error" else {
                return .error
            }
            
            if case CalculatorButtonItem.Op.equal = op  {
                return .left(res)
            }
            return .leftOp(left: res, op: op)
            
        default:
            return .error
        }

    }
    
    private func makeCalculate(left:String,op:CalculatorButtonItem.Op,right:String) -> String{
        
        let result:String
        switch op {
        case .plus:
            
            if let leftV = Double(left),let rightV = Double(right) {
                let res = leftV + rightV
                result = String(res)
            }else{
                result = "Error"
            }

        case .minus:
            if let leftV = Double(left),let rightV = Double(right) {
                let res = leftV - rightV
                result = String(res)
            }else{
                result = "Error"
            }

        case .multiply:
            if let leftV = Double(left),let rightV = Double(right) {
                let res = leftV * rightV
                result = String(res)
            }else{
                result = "Error"
            }

        case .divide:
            if let leftV = Double(left),let rightV = Double(right) {
                if rightV == 0 {
                    result = "Error"
                }else{
                    let res = leftV / rightV
                    result = String(res)
                }

            }else{
                result = "Error"
            }

        default:
            result = "Error"
        }
        
        return result
    }
    
    
    
    private func apply(command:CalculatorButtonItem.Command) -> CalculatorBrain {
        switch command {
        case .clear:
            return .left("0")
        case .flip:
            switch self {
            case .left(let left):
                return .left("\(-Double(left)!)")
            case .leftOp(_, _):
                return self
            case let .leftOpRight(left,op, right):
                return .leftOpRight(left: left, op: op, right: "\(-Double(right)!)")
            default:
                return self
            }
        case .percent:
            switch self {
            case .left(let left):
                return .left("\(Double(left)! * 0.01)")
            case .leftOp(_,_):
                return self
            case let .leftOpRight(left, op, right):
                return .leftOpRight(left: left, op: op, right:"\(Double(right)! * 0.01)" )
            case .error:
                return self
            }
        }
    }

}
