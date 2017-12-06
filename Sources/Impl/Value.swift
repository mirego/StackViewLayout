//  Copyright (c) 2017 Luc Dion
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation

enum Unit {
    case point
    case percent
}

struct Value {
    var value: CGFloat
    var unit: Unit
    
    init?(_ value: CGFloat?) {
        guard let value = value else { return nil }
        self.value = value
        self.unit = .point
    }
    
    init?(_ percent: SPercent?) {
        guard let percent = percent else { return nil }
        self.value = percent.value
        self.unit = .percent
    }
    
    func resolveWidth(container: Container) -> CGFloat? {
        return resolve(usingContainerDimension: container.width)
    }
    
    func resolveHeight(container: Container) -> CGFloat? {
        return resolve(usingContainerDimension: container.height)
   }
    
    func resolve(usingContainerDimension dimension: CGFloat?) -> CGFloat? {
        switch self.unit {
        case .point:   return self.value
        case .percent: return dimension != nil ? (dimension! * self.value / 100) : nil
        }
    }
}
