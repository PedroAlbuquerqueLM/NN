//
//  IrisData.swift
//  K-NN Cassifier
//

import Foundation

class IrisData {
    
    let file = "iris"
    
    static fileprivate func loadData(fromFile file : String) -> String? {
        
        if let irisDataPath = Bundle.main.path(forResource: "irisData", ofType: "txt") {
            do {
                let irisDataText = try String(contentsOfFile: irisDataPath)
                return irisDataText
            } catch {
                print("Error loading iris data")
            }
        }
        
        return nil
    }
    
    static func loadIrisObjects() -> [Flower]? {
        if let txtData = self.loadData(fromFile: "iris") {
            
            var objectsArray = [Flower]()
            let txtArray = txtData.components(separatedBy: "\n")
            
            
            for line in txtArray {
                let components = line.components(separatedBy: ",")
                
                let flower = Flower(withDataArray: components)
                objectsArray.append(flower)
            }
            
            return objectsArray
            
        }
        
        
        return nil
        
    }
    
    static func loadRandomIrisObjects(withCount count : Int) -> [[Flower]]? {
        if let txtData = self.loadData(fromFile: "iris") {
            
            var trainningData = [Flower]()
            var testData = [Flower]()
            var txtArray = txtData.components(separatedBy: "\n")
            
            
            for i in 0..<txtArray.count {
                
                let upperBound = txtArray.count
                
                let line = txtArray[Int(arc4random_uniform(UInt32(upperBound)))]
                
                txtArray.remove(at: txtArray.index(of: line)!)
                
                let components = line.components(separatedBy: ",")
                
                let flower = Flower(withDataArray: components)
                
                if trainningData.count < count {
                    trainningData.append(flower)
                    
                } else {
                    testData.append(flower)
                }
                
                
            }
            
            return [trainningData, testData]
            
        }
        
        
        return nil
    }
    
}

