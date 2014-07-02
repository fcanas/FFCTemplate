//
//  FFCTemplate.h
//  Pods
//
//  Created by Fabian Canas on 7/1/14.
//  Copyright (c) 2014 Fabian Canas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FFCTemplate : NSObject

@property (nonatomic, weak) id valueSource;
/**
 Returns a cached version of the rendered template if one exists.
 If no pre-rendered version exists, it will render the temlpate.
 */
-(NSString *)renderedTemplate;

- (instancetype)initWithTemplate:(NSString *)templateString;

/* 
 Forces the FFCTemlate to render and returns the resulting string.
 */
- (NSString *)render;

@end
