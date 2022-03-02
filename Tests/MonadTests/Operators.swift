//
//  Operators.swift
//  
//
//  Created by Li-Heng Hsu on 2022/3/2.
//

import Monad

prefix operator «
postfix operator »

public postfix func » <T>(lhs: T) -> Monad<T> {
    return Monad(lhs)
}
public prefix func « <T>(rhs: Monad<T>) -> T {
    return rhs.wrapped
}
