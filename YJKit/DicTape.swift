//
//  DicTape.swift
//  TestMemberLookup
//
//  Created by YeKeyon on 2019/10/4.
//  Copyright © 2019 YeKeyon. All rights reserved.
//

import Foundation

@dynamicMemberLookup
public struct DicBuilder {

    private let _build: () -> Any?

    public init(_ build: @escaping () -> Any?) {
        self._build = build
    }

    public init(_ base: Any?) {
        self._build = { base }
    }
    
    subscript(dynamicMember member: String) -> DicBuilder {
        return DicBuilder {
            let object = self._build()
            if let dic = object as? NSDictionary {
                return dic[member]
            } else if let arr = object as? NSArray {
                return arr
            } else if let dic = object as? Dictionary<String,Any> {
                return dic[member]
            } else if let arr = object as? Array<Any> {
                return arr
            }
            return nil
        }
    }
    
    subscript(_ index: Int) -> DicBuilder {
        return DicBuilder {
            let object = self._build()
            if let arr = object as? NSArray {
                return arr[index]
            } else if let arr = object as? Array<Any> {
                return arr[index]
            }
            return nil
        }
    }
    
    public func build() -> Any? {
        _build()
    }
}

public protocol DicAble {
    var jyTape: DicBuilder { get set }
}

extension DicAble where Self: AnyObject {
    public var jyTape: DicBuilder {
        get { DicBuilder(self) }
        set {}
    }
}

extension Dictionary {
    public var jyTape: DicBuilder {
        get { DicBuilder(self) }
        set {}
    }
}

#if canImport(Foundation)
import Foundation

extension NSObject: DicAble {}
#endif
