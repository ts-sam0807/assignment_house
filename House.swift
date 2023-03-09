//
//  House.swift
//  Assignment1
//
//  Created by Derrick Park on 2023-03-03.
//

import Foundation

class House: CustomStringConvertible {
  var border: Character
  var fill: Character
  var size: Int
  var description: String {
    return """
      House width and height base to roof = \(size) units.
      Perimeter of house = \(perimeter) units.
      Area of house = \(area) units.
      """
  }
  
  init( size: Int, border: Character="X", fill: Character = "*") {
    if size < 3 {
      self.size = 3
    } else if size > 37 {
       self.size = 37
    } else {
      self.size = size
    }
    
    self.border = border
    self.fill   = fill
        
  }
  
  var perimeter: Int {
    return (size + 2) * 3 + (size * 2)
  }
  
  var area: Double {
    let roofArea = Double(sqrt(3.0) / 4.0 * pow(Double(size + 2), 2))
    let baseArea = pow(Double(size), 2)
    let totalArea = roofArea + baseArea
    return round(totalArea * 100) / 100
  }
  
  func grow() {
    if size < 37 {
      size += 1
    }
  }
  
  func shrink() {
    if size > 3 {
      size -= 1
    }
  }
  
  func draw() {
    // Draw roof
    let roofSize = size + 1
    print(String(repeating: " ", count: roofSize) + "\(border)") // First Border
    for i in 0..<roofSize {
      let spaces = roofSize - i - 1
      let roofChars = String(repeating: "\(fill) ", count: i)
      print(String(repeating: " ", count: spaces) + "\(border) \(roofChars)\(border)")
    }
      
    // Draw base
    let baseSize = size - 2
    for _ in 0..<baseSize {
      let baseChars = String(repeating: "\(fill) ", count: baseSize)
      print("  \(border) \(baseChars)\(border)")
    }
    print(" " + String(repeating: " \(border)", count: size)) // Bottom Border
  }
}
