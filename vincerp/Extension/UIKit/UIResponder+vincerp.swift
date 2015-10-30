//
//  UIResponder+vincerp.swift
//  vincerp
//
//  Created by Agnes Vasarhelyi on 30/10/15.
//  Copyright © 2015 Viktor Belenyesi. All rights reserved.
//

public extension UIResponder {
    
    public func reactiveProperty<T:Equatable>(forProperty propertyName: String, initValue: T, initializer: ((Source<T>) -> ())? = nil) -> Rx<T> {
        return ReactivePropertyGeneator.property(self, propertyName: propertyName, initValue: initValue, initializer: initializer)
    }
    
    public func reactiveEmitter<T:Equatable>(name propertyName: String, initValue: T) -> Source<T> {
        return ReactivePropertyGeneator.emitter(self, propertyName: propertyName, initValue: initValue)
    }
    
}
