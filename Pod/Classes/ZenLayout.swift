//
//  ZenLayout.swift
//  Pods
//
//  Created by aethe on 8/27/15.
//
//

// MARK: - Smart Layout Attribute

/// Represents a specific layout attribute in Zen equations.
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

// MARK: - Overloaded Operators

public func == (lhs: ZenLayoutAttribute, rhs: ZenLayoutAttribute) -> NSLayoutConstraint {
    lhs.view.translatesAutoresizingMaskIntoConstraints = false
    return NSLayoutConstraint(item: lhs.view, attribute: lhs.rawAttribute, relatedBy: NSLayoutRelation.Equal, toItem: rhs.view, attribute: rhs.rawAttribute, multiplier: rhs.multiplier, constant: rhs.constant)
}

public func >= (lhs: ZenLayoutAttribute, rhs: ZenLayoutAttribute) -> NSLayoutConstraint {
    lhs.view.translatesAutoresizingMaskIntoConstraints = false
    return NSLayoutConstraint(item: lhs.view, attribute: lhs.rawAttribute, relatedBy: NSLayoutRelation.GreaterThanOrEqual, toItem: rhs.view, attribute: rhs.rawAttribute, multiplier: rhs.multiplier, constant: rhs.constant)
}

public func <= (lhs: ZenLayoutAttribute, rhs: ZenLayoutAttribute) -> NSLayoutConstraint {
    lhs.view.translatesAutoresizingMaskIntoConstraints = false
    return NSLayoutConstraint(item: lhs.view, attribute: lhs.rawAttribute, relatedBy: NSLayoutRelation.LessThanOrEqual, toItem: rhs.view, attribute: rhs.rawAttribute, multiplier: rhs.multiplier, constant: rhs.constant)
}

public func == (attribute: ZenLayoutAttribute, value: CGFloat) -> NSLayoutConstraint {
    attribute.view.translatesAutoresizingMaskIntoConstraints = false
    return NSLayoutConstraint(item: attribute.view, attribute: attribute.rawAttribute, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: value)
}

public func >= (attribute: ZenLayoutAttribute, value: CGFloat) -> NSLayoutConstraint {
    attribute.view.translatesAutoresizingMaskIntoConstraints = false
    return NSLayoutConstraint(item: attribute.view, attribute: attribute.rawAttribute, relatedBy: NSLayoutRelation.GreaterThanOrEqual, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: value)
}

public func <= (attribute: ZenLayoutAttribute, value: CGFloat) -> NSLayoutConstraint {
    attribute.view.translatesAutoresizingMaskIntoConstraints = false
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

infix operator ! { associativity left precedence 95 }
public func ! (constraint: NSLayoutConstraint, priority: UILayoutPriority) -> NSLayoutConstraint {
    constraint.priority = priority
    return constraint
}

// MARK: - UIView Extension

public extension UIView {

    // MARK: Smart Attributes

    /// Represents `.Left` layout attribute in Zen equations.
    public var left: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.Left)
    }

    /// Represents `.Right` layout attribute in Zen equations.
    public var right: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.Right)
    }

    /// Represents `.Top` layout attribute in Zen equations.
    public var top: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.Top)
    }

    /// Represents `.Bottom` layout attribute in Zen equations.
    public var bottom: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.Bottom)
    }

    /// Represents `.Leading` layout attribute in Zen equations.
    public var leading: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.Leading)
    }

    /// Represents `.Trailing` layout attribute in Zen equations.
    public var trailing: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.Trailing)
    }

    /// Represents `.Width` layout attribute in Zen equations.
    public var width: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.Width)
    }

    /// Represents `.Height` layout attribute in Zen equations.
    public var height: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.Height)
    }

    /// Represents `.CenterX` layout attribute in Zen equations.
    public var centerX: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.CenterX)
    }

    /// Represents `.CenterY` layout attribute in Zen equations.
    public var centerY: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.CenterY)
    }

    /// Represents `.Baseline` layout attribute in Zen equations.
    public var baseline: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.Baseline)
    }

    /// Represents `.FirstBaseline` layout attribute in Zen equations.
    public var firstBaseline: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.FirstBaseline)
    }

    /// Represents `.LeftMargin` layout attribute in Zen equations.
    public var leftMargin: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.LeftMargin)
    }

    /// Represents `.RightMargin` layout attribute in Zen equations.
    public var rightMargin: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.RightMargin)
    }

    /// Represents `.TopMargin` layout attribute in Zen equations.
    public var topMargin: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.TopMargin)
    }

    /// Represents `.BottomMargin` layout attribute in Zen equations.
    public var bottomMargin: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.BottomMargin)
    }

    /// Represents `.LeadingMargin` layout attribute in Zen equations.
    public var leadingMargin: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.LeadingMargin)
    }

    /// Represents `.TrailingMargin` layout attribute in Zen equations.
    public var trailingMargin: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.TrailingMargin)
    }

    /// Represents `.CenterXWithinMargins` layout attribute in Zen equations.
    public var centerXWithinMargins: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.CenterXWithinMargins)
    }

    /// Represents `.CenterYWithingMargins` layout attribute in Zen equations.
    public var centerYWithinMargins: ZenLayoutAttribute {
        return ZenLayoutAttribute(view: self, rawAttribute: NSLayoutAttribute.CenterYWithinMargins)
    }

    // MARK: Size Matching

    /**
    Sets the size of the view.

    This method generates two constraints: one for width and one for height.
    
    All constraints are added to the view the method gets called on.
    
    The view coming as the first parameter will have its `translatesAutoresizingMaskIntoConstraints` set to `false`.
    
    Example:

        layout(view, matchSize: CGSize(width: 50, height: 50))
    */
    public func layout(view: UIView, matchSize size: CGSize) {
        addConstraint(view.width == size.width)
        addConstraint(view.height == size.height)
    }

    // MARK: Center Pinning

    /**
    Pins the view's center to the center of another view.

    This method generates two constraints: one for the horizontal center and one for the vertical center.
    
    All constraints are added to the view the method gets called on.
    
    The view coming as the first parameter will have its `translatesAutoresizingMaskIntoConstraints` set to `false`.

        layout(child, pinToCenterOf: parent)
    */
    public func layout(view: UIView, pinToCenterOf anotherView: UIView) {
        layout(view, pinToCenterOf: anotherView, displacement: CGVector.zero)
    }

    /**
    Pins the view's center to the center of another view with a displacement.

    This method generates two constraints: one for the horizontal center and one for the vertical center.
    
    All constraints are added to the view the method gets called on.
    
    The view coming as the first parameter will have its `translatesAutoresizingMaskIntoConstraints` set to `false`.

        layout(child, pinToCenterOf: parent,
            displacement: CGVector(dx: 15, dy: 20))
    */
    public func layout(view: UIView, pinToCenterOf anotherView: UIView, displacement: CGVector) {
        addConstraint(view.centerX == anotherView.centerX + displacement.dx)
        addConstraint(view.centerY == anotherView.centerY + displacement.dy)
    }

    // MARK: Wrapping

    /**
    Pins the view's edges to the edges of another view.
    
    This method generates four constraints: one for the left edge, one for the right edge, one for the top edge and one for the bottom edge.
    
    All constraints are added to the view the method gets called on.
    
    The view coming as the first parameter will have its `translatesAutoresizingMaskIntoConstraints` set to `false`.
    
        layout(child, pinToEdgesOf: parent)
    */
    public func layout(view: UIView, pinToEdgesOf anotherView: UIView) {
        layout(view, pinToEdgesOf: anotherView, insets: UIEdgeInsetsZero)
    }

    /**
    Pins the view's edges to the margins of another view.
    
    This method generates four constraints: one for the left edge, one for the right edge, one for the top edge and one for the bottom edge.
    
    All constraints are added to the view the method gets called on.
    
    The view coming as the first parameter will have its `translatesAutoresizingMaskIntoConstraints` set to `false`.
    
        layout(child, pinToMarginsOf: parent)
    */
    public func layout(view: UIView, pinToMarginsOf anotherView: UIView) {
        layout(view, pinToMarginsOf: anotherView, insets: UIEdgeInsetsZero)
    }

    /**
    Pins the view's edges to the edges of another view with insets.
    
    This method generates four constraints: one for the left edge, one for the right edge, one for the top edge and one for the bottom edge.
    
    All constraints are added to the view the method gets called on.
    
    The view coming as the first parameter will have its `translatesAutoresizingMaskIntoConstraints` set to `false`.
    
        layout(child, pinToEdgesOf: parent,
            insets: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
    */
    public func layout(view: UIView, pinToEdgesOf anotherView: UIView, insets: UIEdgeInsets) {
        addConstraint(view.left == anotherView.left + insets.left)
        addConstraint(view.right == anotherView.right - insets.right)
        addConstraint(view.top == anotherView.top + insets.top)
        addConstraint(view.bottom == anotherView.bottom - insets.bottom)
    }

    /**
    Pins the view's edges to the margins of another view with insets.
    
    This method generates four constraints: one for the left edge, one for the right edge, one for the top edge and one for the bottom edge.
    
    All constraints are added to the view the method gets called on.
    
    The view coming as the first parameter will have its `translatesAutoresizingMaskIntoConstraints` set to `false`.
    
        layout(child, pinToMarginsOf: parent,
            insets: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
    */
    public func layout(view: UIView, pinToMarginsOf anotherView: UIView, insets: UIEdgeInsets) {
        addConstraint(view.left == anotherView.leftMargin + insets.left)
        addConstraint(view.right == anotherView.rightMargin - insets.right)
        addConstraint(view.top == anotherView.topMargin + insets.top)
        addConstraint(view.bottom == anotherView.bottomMargin - insets.bottom)
    }

}
