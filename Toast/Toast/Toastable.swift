//
//  Toastable.swift
//  Toast
//
//  Created by Steven Hepting on 9/21/16.
//  Copyright © 2016 Hepting. All rights reserved.
//

public protocol Toastable {
    func mainMessage() -> String
    func detailMessage() -> String
}

extension String: Toastable {
    public func mainMessage() -> String {
        return self
    }

    public func detailMessage() -> String {
        return ""
    }
}
extension NSNotification: Toastable {
    public func mainMessage() -> String {
        return self.name.rawValue
    }

    public func detailMessage() -> String {
        return "notification details"
    }
}

extension NSError: Toastable {
    public func mainMessage() -> String {
        return "Error"
    }

    public func detailMessage() -> String {
        return "Domain: \(domain)\nCode: \(code)"
    }
}
