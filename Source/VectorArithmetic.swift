//
//  VectorArithmetic.swift
//  Surge
//
//  Created by Scott Hoyt on 9/6/15.
//  Copyright © 2015 Mattt Thompson. All rights reserved.
//

import Foundation

public protocol VectorArithmetic {
    
    // MARK: To Overload
    static func add(x: [Self], _ y: [Self]) -> [Self]
    static func multiply(x: [Self], _ y: [Self]) -> [Self]
    
    // MARK: Overload if not FloatLiteralConvertible, Optional Otherwise
    static func zero() -> Self
    static func one() -> Self
    static func negativeOne() -> Self
    
    //MARK: Optional Overload
    static func zeros(count: Int) -> [Self]
    static func ones(count: Int) -> [Self]
    static func negativeOnes(count: Int) -> [Self]
    static func subtract(x: [Self], _ y: [Self]) -> [Self]
    static func divide(x: [Self], _ y: [Self]) -> [Self]
    
}

public extension VectorArithmetic {
    
    static func zeros(count: Int) -> [Self] {
        return [Self](count: count, repeatedValue: Self.zero())
    }
    
    static func ones(count: Int) -> [Self] {
        return [Self](count: count, repeatedValue: Self.one())
    }
    
    static func negativeOnes(count: Int) -> [Self] {
        return [Self](count: count, repeatedValue: Self.negativeOne())
    }
    
    public static func subtract(x: [Self], _ y: [Self]) -> [Self] {
        return x + (y * Self.negativeOnes(y.count))
    }
    
    public static func divide(x: [Self], _ y: [Self]) -> [Self] {
        return x * (Self.ones(y.count) / y)
    }
    
}

func +<T: VectorArithmetic>(lhs: [T], rhs: [T]) -> [T] {
    return T.add(lhs, rhs)
}

func +<T: VectorArithmetic>(lhs: [T], rhs: T) -> [T] {
    let rhsVect = Array<T>(count: lhs.count, repeatedValue: rhs)
    return T.add(lhs, rhsVect)
}

func +<T: VectorArithmetic>(lhs: T, rhs: [T]) -> [T] {
    let lhsVect = Array<T>(count: rhs.count, repeatedValue: lhs)
    return T.add(lhsVect, rhs)
}

func -<T: VectorArithmetic>(lhs: [T], rhs: [T]) -> [T] {
    return T.subtract(lhs, rhs)
}

func -<T: VectorArithmetic>(lhs: [T], rhs: T) -> [T] {
    let rhsVect = Array<T>(count: lhs.count, repeatedValue: rhs)
    return T.subtract(lhs, rhsVect)
}

func -<T: VectorArithmetic>(lhs: T, rhs: [T]) -> [T] {
    let lhsVect = Array<T>(count: rhs.count, repeatedValue: lhs)
    return T.subtract(lhsVect, rhs)
}

func *<T: VectorArithmetic>(lhs: [T], rhs: [T]) -> [T] {
    return T.multiply(lhs, rhs)
}

func *<T: VectorArithmetic>(lhs: [T], rhs: T) -> [T] {
    let rhsVect = Array<T>(count: lhs.count, repeatedValue: rhs)
    return T.multiply(lhs, rhsVect)
}

func *<T: VectorArithmetic>(lhs: T, rhs: [T]) -> [T] {
    let lhsVect = Array<T>(count: rhs.count, repeatedValue: lhs)
    return T.multiply(lhsVect, rhs)
}

func /<T: VectorArithmetic>(lhs: [T], rhs: [T]) -> [T] {
    return T.divide(lhs, rhs)
}

func /<T: VectorArithmetic>(lhs: [T], rhs: T) -> [T] {
    let rhsVect = Array<T>(count: lhs.count, repeatedValue: rhs)
    return T.divide(lhs, rhsVect)
}

func /<T: VectorArithmetic>(lhs: T, rhs: [T]) -> [T] {
    let lhsVect = Array<T>(count: rhs.count, repeatedValue: lhs)
    return T.divide(lhsVect, rhs)
}