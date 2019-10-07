//
//  PropertyTape.swift
//  TestMemberLookup
//
//  Created by YeKeyon on 2019/10/4.
//  Copyright © 2019 YeKeyon. All rights reserved.
//

@dynamicMemberLookup
public struct PropertyBuilder<Base: AnyObject> {

    private let _build: () -> Base

    public init(_ build: @escaping () -> Base) {
        self._build = build
    }

    public init(_ base: Base) {
        self._build = { base }
    }
    
    

    public subscript<Value>(dynamicMember keyPath: ReferenceWritableKeyPath<Base, Value>) -> (Value) -> PropertyBuilder<Base> {
        return { [build = _build] value in
            return PropertyBuilder {
                let object = build()
                object[keyPath: keyPath] = value
                return object
            }
        }
    }

    public func build() -> Base {
        _build()
    }
}

public protocol PropertyTapeCompatible {
    associatedtype PropertyTapeBase: AnyObject
    var propertyTape: PropertyBuilder<PropertyTapeBase> { get set }
}

extension PropertyTapeCompatible where Self: AnyObject {
    public var propertyTape: PropertyBuilder<Self> {
        get { PropertyBuilder(self) }
        set {}
    }
}

#if canImport(Foundation)
import Foundation

extension NSObject: PropertyTapeCompatible {}
#endif
