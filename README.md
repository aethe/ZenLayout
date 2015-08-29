![ZenLayout](https://github.com/aethe/ZenLayout/blob/master/Images/logo.png)
-

[![Version](https://img.shields.io/cocoapods/v/ZenLayout.svg?style=flat)](http://cocoapods.org/pods/ZenLayout) [![Platform](https://img.shields.io/cocoapods/p/ZenLayout.svg?style=flat)](http://cocoapods.org/pods/ZenLayout) [![License](https://img.shields.io/cocoapods/l/ZenLayout.svg?style=flat)](http://cocoapods.org/pods/ZenLayout)

If you have ever had to write Auto Layout constraints in code, you probably know how painful it could be sometimes. ZenLayout is a small but smart library which aims to simplify the layout related programming and make it both convenient and enjoyable.

### Disclaimer

ZenLayout is still under development, which means that until version 1.0.0 the compatibility with the previous versions of ZenLayout is not guaranteed. If you are using CocoaPods, consider specifying the desired version in the Podfile.

## Usage

### Simplified constraint syntax

The core feature of this library is the simplified constraint syntax. Let's take a look at some of the native Cocoa Touch code used to place a `label` below a `button` and align their horizontal centers.

```swift
label.setTranslatesAutoresizingMaskIntoConstraints(false)
view.addConstraint(NSLayoutConstraint(item: label,
                                 attribute: .Top,
                                 relatedBy: .Equal,
                                    toItem: button,
                                 attribute: .Bottom,
                                multiplier: 1,
                                  constant: 15))
view.addConstraint(NSLayoutConstraint(item: label,
                                 attribute: .CenterX,
                                 relatedBy: .Equal,
                                    toItem: button,
                                 attribute: .CenterX,
                                multiplier: 1,
                                  constant: 0))
```

And now let's take a look at the same code done with ZenLayout:

```swift
view.addConstraint(label.top == button.bottom + 15)
view.addConstraint(label.centerX == button.centerX)
```

Impressive? Let's contunue then!

### Writing a constraint

So, as you might have noticed, ZenLayout allows us to treat a constraint as an equation and write it in the following format:

```
view1.attribute == multiplier * view2.attribute + constant
```

Sucn an expression results in an object of `NSLayoutConstraint` class and you can store it inside a variable or put directly into the `addConstraint()` method:

```swift
let constraint = child.left == parent.left
parent.addConstraint(constraint)
// --- OR ---
parent.addConstraint(child.left == parent.left)
```

So, let's practice a little bit more and make the `label` from one of the previous examples to be twice as high as the `button`:

```swift
view.addConstraint(label.height == 2 * button.height)
```

Notice that we don't have to write `setTranslatesAutoresizingMaskIntoConstraints(false)` because it's automatically called for the view on the left side of the equation (in this case for `label`).

### Setting a constraint's priority

Let's say we have a constraint that makes the `child`'s height to be half of the `parent`'s height minus 4 and we want to set it's priority to 100. Use the special `!`-syntax to do that:

```swift
child.height == 0.5 * parent.height - 4 ! 100
```

## Installation

ZenLayout is available through [CocoaPods](http://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod "ZenLayout"
```

## Why ZenLayout anyway?

**Reason 1: It's clean and simple.** You no longer have to write a lot of code just to set view's width and height in Auto Layout. And it's actually very easy to see what is going on in your code when you open it after a long vacation.

Yeah, kinda... But there is a lot of libraries that allow you to do the same.

**Reason 2: You don't have to learn anything new to start using it.** That's it. These are the same constraints you used to write before. Just different style. No fancy methods that are hard to remember. Everything is straightforward.

But I want those fancy methods! I want to be able to set constraints for a bunch of views by writing only one line of code!

**Reason 3: Additional convenient methods are coming soon.** It's good to have a powerful toolset under your hand. It's just that ZenLayout will never force you to use it, if you don't feel comfortable with it. Some additional methods are coming soon, but there aren't any at the moment. Come on! This library is just 2 days old at the time of writing this. Give me a break. :)

## Support

If you have a suggestion or you have found a bug, feel free to send me a mail to andrew.aethe@gmail.com. I would be also glad to know if you end up using ZenLayout in your project. Cheers!

## License

ZenLayout is available under the MIT license. See the LICENSE file for more info.
