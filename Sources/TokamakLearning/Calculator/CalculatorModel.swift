//
//  CalculatorModel.swift
//  TokamakLearning
//
//  Created by huangjiping on 2021/10/5.
//

import TokamakShim
import Foundation

class CalculatorModel: ObservableObject {
//    var objectWillChange: ObservableObjectPublisher = ObservableObject
    @Published
    var brain : CalculatorBrain = .left("0")
    @Published
    var history:[CalculatorButtonItem] = [CalculatorButtonItem]()
    
    var historyDetail:String {
        history.map{$0.description}.joined()
    }
    var temporaryKept:[CalculatorButtonItem] = []
    var totalCount:Int {
        history.count + temporaryKept.count
    }
    var slidingIndex:Float = 0 {
        didSet{
            keepHistory(upTo: Int(slidingIndex))
        }
    }
    
    
    func apply(item:CalculatorButtonItem)  {
        brain = brain.apply(item: item)
        history.append(item)
        
        temporaryKept.removeAll()
        slidingIndex = Float(totalCount)
    }
    
    func keepHistory(upTo index:Int)  {
        precondition(index <= totalCount, "Out of index")
        let toal = history + temporaryKept
        history = Array(toal[..<index])
        temporaryKept = Array(toal[index...])

        brain = history.reduce(CalculatorBrain.left("0")) {result , item  in
            result.apply(item: item)
        }
    }
}

