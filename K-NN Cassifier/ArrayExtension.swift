//
//  ArrayExtension.swift
//  K-NN Cassifier
//

extension Array {
    var average : Float {
        
        var sum : Float = 0.0
        for value in self {
            sum += value as! Float
        }
        
        return sum / Float(self.count)
        
    }
}
