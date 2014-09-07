# FFCTemplate

[![CI Status](http://img.shields.io/travis/fcanas/FFCTemplate.svg?style=flat)](https://travis-ci.org/fcanas/FFCTemplate)
[![Version](https://img.shields.io/cocoapods/v/FFCTemplate.svg?style=flat)](http://cocoadocs.org/docsets/FFCTemplate)
[![License](https://img.shields.io/cocoapods/l/FFCTemplate.svg?style=flat)](http://cocoadocs.org/docsets/FFCTemplate)
[![Platform](https://img.shields.io/cocoapods/p/FFCTemplate.svg?style=flat)](http://cocoadocs.org/docsets/FFCTemplate)

A simple template renderer in Objective-C. Fill templates with object properties, methods, and [key paths](https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/KeyValueCoding/Articles/BasicPrinciples.html).

FFCTemplate is a work in progress.

## Usage

Given
```
@interface MYObject : NSObject
@property (nonatomic, copy) NSString *color;
@property (nonatomic, copy) NSNumber *favoriteNumber;
@property (nonatomic, assign) NSInteger leastFavoriteNumber;
@end

...

obj = [[MYObject alloc] init];
obj.color = @"red";
obj.favoriteNumber = @47;
obj.leastFavoriteNumber = -12;
```

and

```
NSString *templateString = @"My favorite color is {{ color }} and my favorite number is {{ favoriteNumber }} and my least favorite number is {{ leastFavoriteNumber }}!";
```
```
template = [[FFCTemplate alloc] initWithTemplate:templateString];
template.valueSource = obj;

NSString *result = [template render]; 
//@"My favorite color is red and my favorite number is 47 and my least favorite number is -12!"
```

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

FFCTemplate is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "FFCTemplate"

## Author

Fabian Canas
* fcanas@gmail.com
* http://twitter.com/fcanas
* https://github.com/fcanas

## License

FFCTemplate is available under the MIT license. See the LICENSE file for more info.
