//
//  Flower.swift
//  K-NN Cassifier
//

import CoreGraphics
import Foundation

class Flower {
    let sepalWidth, sepalLength, petalWidth, petalLength : Float
    let type : String
    var distance : Float?
    
    init(withDataArray array : [String]) {
        self.sepalWidth = Float(array[1])!
        self.sepalLength = Float(array[0])!

        self.petalWidth = Float(array[3])!
        self.petalLength = Float(array[2])!
        
        self.type = array[4]
    }
    
    
    fileprivate func distance(toFlower flower : Flower) -> Float {
        let sW = self.sepalWidth - flower.sepalWidth
        let sL = self.sepalLength - flower.sepalLength
        
        let pW = self.petalWidth - flower.petalWidth
        let pL = self.petalLength - flower.petalLength
        
        return sqrt(sW * sW + sL * sL + pW * pW + pL * pL)
    }
    
    func classify(inData data : [Flower], withCount count : Int) -> IrisFlower {
        
        let nearestNeighBoors = self.nearestNeighBoors(inData: data, withCount: count)
        
        
        switch mostFrequent(array: nearestNeighBoors)!.key {
        case "Iris-versicolor":
            return IrisFlower.versicolor
        case "Iris-virginica":
            return IrisFlower.virginica
        case "Iris-setosa":
            return IrisFlower.setosa
        default :
            return IrisFlower.versicolor
        
        }
        
    }
    
    
    fileprivate func mostFrequent(array: [Flower]) -> (key: String, value: Int)? {
        
        var frequency: [String:Int] = [:]
        
        for x in array {
            frequency[x.type] = (frequency[x.type] ?? 0) + 1
        }
        
        let descending = frequency.sorted(by: {
            $0.1 > $1.1
        })
        
        return descending.first!
        
    }
    
    fileprivate func nearestNeighBoors(inData data : [Flower], withCount count : Int) -> [Flower] {
        
        
        let dataUnsorted = data
        
        for flower in dataUnsorted {
            flower.distance = self.distance(toFlower: flower)
        }
        
        let dataSorted = data.sorted {
            $0.distance! < $1.distance!
        }
        
        var nearestNeighboors = [Flower]()
        
        for index in 0..<count {
            nearestNeighboors.append(dataSorted[index])
        }
        
        return nearestNeighboors
        
    }

}
