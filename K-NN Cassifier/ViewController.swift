//
//  ViewController.swift
//  K-NN Cassifier
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func classifyAction(_ sender: UIButton) {
        
        var percentageOfHits = [Float]()
        
        for i in 0..<10 {
            guard let randomIrisData = IrisData.loadRandomIrisObjects(withCount: 100) else {
                return
            }
            
            var hits = 0
            
            let trainningData = randomIrisData.first!
            let testData = randomIrisData.last!
            
            
            for flower in testData {
                
                let k = 1
                
                let prediction = flower.classify(inData: trainningData, withCount: k)
                
                if flower.type.irisFlower == prediction {
                    hits += 1
                }
                
            }
            
            print("Hitted \(hits) of \(testData.count) flowers tested")
            
            percentageOfHits.append(Float(hits) / Float(testData.count))
            
        }
        
        print("The avarage was: \(percentageOfHits.average)")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
