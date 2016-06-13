//
//  ViewController.swift
//  Algo
//
//  Created by QSS Macbook Air on 6/13/16.
//  Copyright © 2016 QSS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
/*
     Counting Sort: counting sort is an algorithm for sorting a collection of objects according to keys that are samll integers. It operates by counting the number of objects that have each distinct key value and using arithmetic on those counts to determine the positions of each key value in the output sequence. 
     To understand the algo let's walk through a small example
     Consider the array: [ 10, 9,8 ,7, 1,2,7,3]
     
 
     Performance: The algorithm uses simple loops to sort a collection. Hence the time to run entire algorithm is O(n+k) and n,
     
     
     Step 1: 
     The first step is to count the total number of occurrences of each item in the array. The output for the first would be a new array that looks as follows. 
     
     Step 2: 
     In this step the alogrithm tries to determine the number of elements that are placed before each element. Since you already know the totol occurrences for each element you can use this information to your advantage. The way it works is to sum up the previous counts and store them at each index. 
     
     
*/
    enum CountingSortError: ErrorType
    {
        case ArrayEmpty
    }
    
    func countingSort(array: [Int]) throws -> [Int]
    {
        guard array.count > 0 else {
            throw CountingSortError.ArrayEmpty
        }
        
        // Step 1
        // Create an array to store the count of each element
        let maxElement = array.maxElement() ?? 0
        
        var countArray = [Int](count: Int(maxElement + 1), repeatedValue: 0)
        for element in array {
            countArray[element] += 1
        }
        
        // Step 2
        // Set each value to be the sum of the previous two values
        for index in 1 ..< countArray.count {
            let sum = countArray[index] + countArray[index - 1]
            countArray[index] = sum
        }
        
        print(countArray)
        
        // Step 3
        // Place the element in the final array as per the number of elements before it
        var sortedArray = [Int](count: array.count, repeatedValue: 0)
        for element in array {
            countArray[element] -= 1
            sortedArray[countArray[element]] = element
        }
        return sortedArray
    }
    

    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        do
        {
            let check = try! countingSort([1,4,3,5,6,7,5,7])
            print(check)
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

