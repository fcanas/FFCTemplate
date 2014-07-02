//
//  FFCTemplate.m
//  Pods
//
//  Created by Fabian Canas on 7/1/14.
//  Copyright (c) 2014 Fabian Canas. All rights reserved.
//

#import "FFCTemplate.h"

@interface FFCTemplate ()
@property (nonatomic, copy) NSString *templateString;
@property (nonatomic, copy) NSString *renderedTemplate;
@end

@implementation FFCTemplate

- (instancetype)initWithTemplate:(NSString *)templateString
{
    self = [super init];
    if (self == nil){
        return nil;
    }
    
    _templateString = [templateString copy];
    
    return self;
}

- (NSString *)startDelimiter
{
    return @"{{";
}

- (NSString *)endDelimiter
{
    return @"}}";
}

- (NSString *)render
{
    NSMutableString* destination = [[NSMutableString alloc] initWithCapacity:self.templateString.length * 4];
    NSString* scannedString  = nil;
    
    NSScanner* scanner = [[NSScanner alloc] initWithString:self.templateString];
    scanner.charactersToBeSkipped = nil;
    NSString* key = nil;
    @try {
        while ([scanner scanUpToString:[self startDelimiter] intoString:&scannedString]) {
            if (scannedString != nil) {
                [destination appendString:scannedString];
            }
            if( [scanner isAtEnd] ) {
                break;
            }
            
            [scanner scanString:[self startDelimiter] intoString:nil];
            
            [scanner scanUpToString:[self endDelimiter] intoString:&key];
            key = [key stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            
            id value = [self.valueSource valueForKeyPath:key];
            if ([value isKindOfClass:[NSString class]]) {
                [destination appendString:value];
            } else if ([value respondsToSelector:@selector(stringValue)]) {
                [destination appendString:[value stringValue]];
            } else if (value != nil) {
                [destination appendFormat:@"%@", value];
            } else {
                
            }
            
            [scanner scanString:[self endDelimiter] intoString:nil];
        }
    }
    @catch (NSException *exception) {
        NSLog(@"Template broke on key: \"%@\"", key);
    }
    @finally {
        
    }
    
    NSString *renderedTemlpate = [NSString stringWithString:destination];
    self.renderedTemplate = renderedTemlpate;
    return renderedTemlpate;
}

- (NSString *)renderedTemplate
{
    if (_renderedTemplate == nil) {
        return [self render];
    }
    return _renderedTemplate;
}

@end
