# Pre-work - *Tippster*

**Tippster** is a tip calculator application for iOS.

Submitted by: **Gonzalo Maldonado**

Time spent: **3** hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [x] UI animations
* [x] Remembering the bill amount across app restarts (if <10mins)
* [x] Using locale-specific currency and currency thousands separators.

## The following **additional** features are implemented:
- [x] Letting the user set custom tips on the main screen

## Video Walkthrough

Here's a walkthrough of implemented user stories:

![Tippster](http://i.imgur.com/CzAhiyd.gif)

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

**Answer:**
iOS development is fun! Being able to run code on your smartphone makes the app feel more relatable than on desktop or Web.

IBOutlets and IBAction are mechanisms to link the variables from our view
controllers into the storyboard. They can be weak or strong references
which means the instance that is referenced won't be deallocated until
the reference is gone.

They are implemented by adding to the ViewController Connections a
series of outlet nodes that contain the link between a property and it's
destination.

**Question 2**: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

**Answer:**
Closures and classes are reference types. This means that when you
assign them to a property, you are assigning (and therefore capturing) a
reference to that closure.

This capture usually happens when you access a property or method of the instance
that contains this closure. For example, when you use
self.someMethod().

## License

    Copyright [2017] [Gonzalo Maldonado]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
