//
//  FFCTemplateTests.m
//  FFCTemplateTests
//
//  Created by Fabian Canas on 07/01/2014.
//  Copyright (c) 2014 Fabian Canas. All rights reserved.
//
#import <FFCTemplate/FFCTemplate.h>

@interface FFCTestObject : NSObject
@property (nonatomic, copy) NSString *color;
@property (nonatomic, copy) NSNumber *favoriteNumber;
@property (nonatomic, assign) NSInteger leastFavoriteNumber;
@end
@implementation FFCTestObject
@end


SPEC_BEGIN(InitialTests)

describe(@"FFCTemplate", ^{

  context(@"rendering a template", ^{
      __block FFCTestObject *testObject;
      __block FFCTemplate *template;
      
      beforeAll(^{
          testObject = [[FFCTestObject alloc] init];
          testObject.color = @"red";
          testObject.favoriteNumber = @47;
          testObject.leastFavoriteNumber = -12;
      });
      
      beforeEach(^{
          NSString *templateString = @"My favorite color is {{ color }} and my favorite number is {{ favoriteNumber }} and my least favorite number is {{ leastFavoriteNumber }}!";
          template = [[FFCTemplate alloc] initWithTemplate:templateString];
          template.valueSource = testObject;
      });

      it(@"should be able to render a template", ^{
          NSString *result = [template render];
          [[result should] equal:@"My favorite color is red and my favorite number is 47 and my least favorite number is -12!"];
      });
      
      it(@"should be able to cache a template result", ^{
          NSString *result = [template renderedTemplate];
          [[result should] equal:@"My favorite color is red and my favorite number is 47 and my least favorite number is -12!"];
          
          // And not render it the next time around
          [[template shouldNot] receive:@selector(render)];
          
          NSString *notNewResult = [template renderedTemplate];
          [[notNewResult should] equal:@"My favorite color is red and my favorite number is 47 and my least favorite number is -12!"];
      });
  });
});

SPEC_END
