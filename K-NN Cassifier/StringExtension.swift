//
//  StringExtension.swift
//  K-NN Cassifier
//

extension String {
    var irisFlower : IrisFlower  {
        switch self {
        case "Iris-virginica":
            return IrisFlower.virginica
        case "Iris-versicolor":
            return IrisFlower.versicolor
        case "Iris-setosa":
            return IrisFlower.setosa
        default:
            return IrisFlower.virginica
        }
    }
}
