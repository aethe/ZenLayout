//
//  ZenLayout.swift
//  Pods
//
//  Created by aethe on 8/27/15.
//
//

public class SmartLayoutAttribute {
    
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

public func == (lhs: SmartLayoutAttribute, rhs: SmartLayoutAttribute) -> NSLayoutConstraint {
    lhs.view.setTranslatesAutoresizingMaskIntoConstraints(false)
    return NSLayoutConstraint(item: lhs.view, attribute: lhs.rawAttribute, relatedBy: NSLayoutRelation.Equal, toItem: rhs.view, attribute: rhs.rawAttribute, multiplier: rhs.multiplier, constant: rhs.constant)
}

public func >= (lhs: SmartLayoutAttribute, rhs: SmartLayoutAttribute) -> NSLayoutConstraint {
    lhs.view.setTranslatesAutoresizingMaskIntoConstraints(false)
    return NSLayoutConstraint(item: lhs.view, attribute: lhs.rawAttribute, relatedBy: NSLayoutRelation.GreaterThanOrEqual, toItem: rhs.view, attribute: rhs.rawAttribute, multiplier: rhs.multiplier, constant: rhs.constant)
}

public func <= (lhs: SmartLayoutAttribute, rhs: SmartLayoutAttribute) -> NSLayoutConstraint {
    lhs.view.setTranslatesAutoresizingMaskIntoConstraints(false)
    return NSLayoutConstraint(item: lhs.view, attribute: lhs.rawAttribute, relatedBy: NSLayoutRelation.LessThanOrEqual, toItem: rhs.view, attribute: rhs.rawAttribute, multiplier: rhs.multiplier, constant: rhs.constant)
}

public func == (attribute: SmartLayoutAttribute, value: CGFloat) -> NSLayoutConstraint {
    attribute.view.setTranslatesAutoresizingMaskIntoConstraints(false)
    return NSLayoutConstraint(item: attribute.view, attribute: attribute.rawAttribute, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: value)
}

public func >= (attribute: SmartLayoutAttribute, value: CGFloat) -> NSLayoutConstraint {
    attribute.view.setTranslatesAutoresizingMaskIntoConstraints(false)
    return NSLayoutConstraint(item: attribute.view, attribute: attribute.rawAttribute, relatedBy: NSLayoutRelation.GreaterThanOrEqual, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: value)
}

public func <= (attribute: SmartLayoutAttribute, value: CGFloat) -> NSLayoutConstraint {
    attribute.view.setTranslatesAutoresizingMaskIntoConstraints(false)
    return NSLayoutConstraint(item: attribute.view, attribute: attribute.rawAttribute, relatedBy: NSLayoutRelation.LessThanOrEqual, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: value)
}

public func * (multiplier: CGFloat, attribute: SmartLayoutAttribute) -> SmartLayoutAttribute {
    attribute.multiplier = multiplier
    return attribute
}

public func + (attribute: SmartLayoutAttribute, constant: CGFloat) -> SmartLayoutAttribute {
    attribute.constant = constant
    return attribute
}

public func - (attribute: SmartLayoutAttribute, constant: CGFloat) -> SmartLayoutAttribute {
    attribute.constant = -constant
    return attribute
}

infix operator ~ { associativity left precedence 140 }
public func ~ (attribute: SmartLayoutAttribute, priority: UILayoutPriority) -> SmartLayoutAttribute {
    attribute.priority = priority
    return attribute
}

public extension UIView {
    
    public var left: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.Left)
    }
    
    public var right: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.Right)
    }
    
    public var top: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.Top)
    }
    
    public var bottom: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.Bottom)
    }
    
    public var leading: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.Leading)
    }
    
    public var trailing: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.Trailing)
    }
    
    public var width: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.Width)
    }
    
    public var height: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.Height)
    }
    
    public var centerX: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.CenterX)
    }
    
    public var centerY: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.CenterY)
    }
    
    public var baseline: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.Baseline)
    }
    
    public var firstBaseline: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.FirstBaseline)
    }
    
    public var leftMargin: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.LeftMargin)
    }
    
    public var rightMargin: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.RightMargin)
    }
    
    public var topMargin: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.TopMargin)
    }
    
    public var bottomMargin: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.BottomMargin)
    }
    
    public var leadingMargin: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.LeadingMargin)
    }
    
    public var trailingMargin: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.TrailingMargin)
    }
    
    public var centerXWithinMargins: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.CenterXWithinMargins)
    }
    
    public var centerYWithinMargins: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.CenterYWithinMargins)
    }
    
}
