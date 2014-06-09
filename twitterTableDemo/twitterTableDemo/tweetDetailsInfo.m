//
//  tweetDetailsInfo.m
//  twitterTableDemo
//
//  Created by Howard Livingston on 6/4/14.
//  Copyright (c) 2014 Howard Livingston. All rights reserved.
//

#import "tweetDetailsInfo.h"

@implementation tweetDetailsInfo







-(id)initWithPostInfo:(NSString*)text;
{
    
    if ((self = [super init] ))
        
    {
        _postDetailed = [text copy];
        
        
        
    }
    
    return self;
    
    
}

@end
