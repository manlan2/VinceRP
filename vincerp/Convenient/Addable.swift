//
// Created by Viktor Belenyesi on 18/09/15.
// Copyright (c) 2015 Viktor Belenyesi. All rights reserved.
//

public protocol Addable {
    func +(lhs: Self, rhs: Self) -> Self
}

extension CGFloat : Addable {}
extension Double  : Addable {}
extension Float   : Addable {}
extension Float80   : Addable {}

public func +=<T:IntegerArithmeticType>(left: Source<T>, right: T) -> Source<T> {
    left <- (left* + right)
    return left
}

public func +=<T:Addable>(left: Source<T>, right: T) -> Source<T> {
    left <- (left* + right)
    return left
}
