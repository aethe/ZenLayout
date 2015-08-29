//
//  ZenLayout.swift
//  Pods
//
//  Created by aethe on 8/27/15.
//
//

// MARK: - Smart Layout Attribute

public class ZenLayoutAttribute {
    
    private weak var view: UIView!
    private var rawAttribute: NSLayoutAttribute
    public var multiplier: CGFloat = 1
    public var constant: CGFloat = 0
    public var priority: UILayoutPriority?
    
    public init(view: UIView, rawAttribute: NSLayoutAttribute) {
        self.view = view
        self.rawAttribute = rawAttribute
    }
    
}

public struct ZenSpacing {
    
    var top: CGFloat = 0
    var left: CGFloat = 0
    var bottom: CGFloat = 0
    var right: CGFloat = 0
    
}

public enum ZenOrientation {
    
    case Horizontal
    case Vertical
    
}

// MARK: - Overloaded Operators

public func == (lhs: ZenLayoutAttribute, rhs: ZenLayoutAttribute) -> NSLayoutConstraint {
    lhs.view.setTranslatesAutoresizingMaskIntoConstraints(false)
    return NSLayoutConstraint(item: lhs.view, attribute: lhs.rawAttribute, relatedBy: NSLayoutRelation.Equal, toItem: rhs.view, attribute: rhs.rawAttribute, multiplier: rhs.multiplier, constant: rhs.constant)
}

public func >= (lhs: ZenLayoutAttribute, rhs: ZenLayoutAttribute) -> NSLayoutConstraint {
    lhs.view.setTranslatesAutoresizingMaskIntoConstraints(false)
    return NSLayoutConstraint(item: lhs.view, attribute: lhs.rawAttribute, relatedBy: NSLayoutRelation.GreaterThanOrEqual, toItem: rhs.view, attribute: rhs.rawAttribute, multiplier: rhs.multiplier, constant: rhs.constant)
}

public func <= (lhs: ZenLayoutAttribute, rhs: ZenLayoutAttribute) -> NSLayoutConstraint {
    lhs.view.setTranslatesAutoresizingMaskIntoConstraints(false)
    return NSLayoutConstraint(item: lhs.view, attribute: lhs.rawAttribute, relatedBy: NSLayoutRelation.LessThanOrEqual, toItem: rhs.view, attribute: rhs.rawAttribute, multiplier: rhs.multiplier, constant: rhs.constant)
}

public func == (attribute: ZenLayoutAttribute, value: CGFloat) -> NSLayoutConstraint {
    attribute.view.setTranslatesAutoresizingMaskIntoConstraints(false)
    return NSLayoutConstraint(item: attribute.view, attribute: attribute.rawAttribute, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: value)
}

public func >= (attribute: ZenLayoutAttribute, value: CGFloat) -> NSLayoutConstraint {
    attribute.view.setTranslatesAutoresizingMaskIntoConstraints(false)
    return NSLayoutConstraint(item: attribute.view, attribute: attribute.rawAttribute, relatedBy: NSLayoutRelation.GreaterThanOrEqual, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: value)
}

public func <= (attribute: ZenLayoutAttribute, value: CGFloat) -> NSLayoutConstraint {
    attribute.view.setTranslatesAutoresizingMaskIntoConstraints(false)
    return NSLayoutConstraint(item: attribute.view, attribute: attribute.rawAttribute, relatedBy: NSLayoutRelation.LessThanOrEqual, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: value)
}

public func * (multiplier: CGFloat, attribute: ZenLayoutAttribute) -> ZenLayoutAttribute {
    attribute.multiplier = multiplier
    return attribute
}

public func + (attribute: ZenLayoutAttribute, constant: CGFloat) -> ZenLayoutAttribute {
    attribute.constant = constant
    return attribute
}

public func - (attribute: ZenLayoutAttribute, constant: CGFloat) -> ZenLayoutAttribute {
    attribute.constant = -constant
    return attribute
}

infix operator ! { associativity left precedence 140 }
public func ! (attribute: ZenLayoutAttribute, priority: UILayoutPriority) -> ZenLayoutAttribute {
    attribute.priority = priority
    return attribute
}

// MARK: - UIView Extension

public extension UIView {
    
    // MARK: Smart Attributes
    
    public var left: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.Left)
    }
    
    public var right: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.Right)
    }
    
    public var top: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.Top)
    }
    
    public var bottom: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.Bottom)
    }
    
    public var leading: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.Leading)
    }
    
    public var trailing: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.Trailing)
    }
    
    public var width: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.Width)
    }
    
    public var height: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.Height)
    }
    
    public var centerX: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.CenterX)
    }
    
    public var centerY: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.CenterY)
    }
    
    public var baseline: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.Baseline)
    }
    
    public var firstBaseline: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.FirstBaseline)
    }
    
    public var leftMargin: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.LeftMargin)
    }
    
    public var rightMargin: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.RightMargin)
    }
    
    public var topMargin: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.TopMargin)
    }
    
    public var bottomMargin: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.BottomMargin)
    }
    
    public var leadingMargin: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.LeadingMargin)
    }
    
    public var trailingMargin: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.TrailingMargin)
    }
    
    public var centerXWithinMargins: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.CenterXWithinMargins)
    }
    
    public var centerYWithinMargins: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.CenterYWithinMargins)
    }
    
    // MARK: Size Matching
    
    public func layout(view: UIView, matchSize size: CGSize) {
        addConstraint(view.width == size.width)
        addConstraint(view.height == size.height)
    }
    
    // MARK: Center Pinning
    
    public func layout(view: UIView, pinToCenterOf anotherView: UIView) {
        layout(view, pinToCenterOf: anotherView, displacement: CGVector.zeroVector)
    }
    
    public func layout(view: UIView, pinToCenterOf anotherView: UIView, displacement: CGVector) {
        addConstraint(view.centerX == anotherView.centerX + displacement.dx)
        addConstraint(view.centerY == anotherView.centerY + displacement.dy)
    }
    
    // MARK: Wrapping
    
    public func layout(view: UIView, pinToEdgesOf anotherView: UIView) {
        layout(view, pinToEdgesOf: anotherView, insets: UIEdgeInsetsZero)
    }
    
    public func layout(view: UIView, pinToMarginsOf anotherView: UIView) {
        layout(view, pinToMarginsOf: anotherView, insets: UIEdgeInsetsZero)
    }
    
    public func layout(view: UIView, pinToEdgesOf anotherView: UIView, insets: UIEdgeInsets) {
        addConstraint(view.left == anotherView.left + insets.left)
        addConstraint(view.right == anotherView.right - insets.right)
        addConstraint(view.top == anotherView.top + insets.top)
        addConstraint(view.bottom == anotherView.bottom - insets.bottom)
    }
    
    public func layout(view: UIView, pinToMarginsOf anotherView: UIView, insets: UIEdgeInsets) {
        addConstraint(view.left == anotherView.leftMargin + insets.left)
        addConstraint(view.right == anotherView.rightMargin - insets.right)
        addConstraint(view.top == anotherView.topMargin + insets.top)
        addConstraint(view.bottom == anotherView.bottomMargin - insets.bottom)
    }
    
}
