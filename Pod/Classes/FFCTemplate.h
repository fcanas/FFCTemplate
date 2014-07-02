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
 
 In the case that permittedKeys is nil, it is intended that all
 keys are permitted. This behavior may change.
 */
+ (NSArray *)permittedKeys;
@end

@interface FFCTemplate : NSObject

/**
 An object that has properties, methods, or key paths for the 
 match strings in the template.
 */
@property (nonatomic, weak) id<FFCTemplateSource> valueSource;

/**
 Returns a cached version of the rendered template if one exists.
 If no pre-rendered version exists, it will render the temlpate.
 */
- (NSString *)renderedTemplate;

- (instancetype)initWithTemplate:(NSString *)templateString;

/**
 Forces the FFCTemplate to render and returns the resulting string.
 */
- (NSString *)render;

@end
