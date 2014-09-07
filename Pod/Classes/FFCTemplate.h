//
//  FFCTemplate.h
//  Pods
//
//  Created by Fabian Canas on 7/1/14.
//  Copyright (c) 2014 Fabian Canas. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FFCTemplateSource <NSObject>
@optional
/**
 An array of strings for keys, method names, and key paths that 
 the template is permitted to ask of the source.
 
 In the case that permittedKeys is nil or the source does not
 respond to this selector, all keys are permitted.
 This behavior may change in future releases.
 */
+ (NSArray *)permittedKeys;
@end

/**
 An FFCTemplate is a simple template rendering object.
 
 A template begins with a normal string, that is marked-up using 
 template tags.
 
 Template tags are keys or key paths surrounded by "{{" and "}}".
 
 First, create an FFCTemplate object with a template string.
 Then give the template a value source: an object that can respond
 to all the keys and key paths in the template string.
 
 You can then ask the FFCTemplate for its `renderedTemplate`, and
 all the tags will be replaced by the corresponding values from
 the value source. This result will be cached and will not update 
 itself as the values in the valueSource change. The object can 
 be forced to render from scratch again with the `render` method.
 
 @see -initWithTemplateString:
 @see -valueSource
 @see -render
 @see -renderedTemplate
 */
@interface FFCTemplate : NSObject

/**
 Initializes a template with a given template string.
 */
- (instancetype)initWithTemplateString:(NSString *)templateString;

/**
 An object that has properties, methods, or key paths for the 
 match strings in the template.
 */
@property (nonatomic, weak) id<FFCTemplateSource> valueSource;

/**
 Returns a cached version of the rendered template if one exists.
 If no pre-rendered version exists, it will render the temlpate.
 
 The results of this method do not change as values on the 
 `valueSource` object change. They can be re-rendered with the
 -render method
 
 @see -render
 */
- (NSString *)renderedTemplate;

/**
 Forces the FFCTemplate to render and returns the resulting string.
 
 See -renderedTemplate for accessing the rendered template without
 executing the render on each access.
 
 @see -renderedTemplate
 */
- (NSString *)render;

@end
