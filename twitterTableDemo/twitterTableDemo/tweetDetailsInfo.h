//
//  tweetDetailsInfo.h
//  twitterTableDemo
//
//  Created by Howard Livingston on 6/4/14.
//  Copyright (c) 2014 Howard Livingston. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface tweetDetailsInfo : NSObject

{

    NSString *detailViewPost;

}



@property(nonatomic, strong)NSString *postDetailed;

-(id)initWithPostInfo:(NSString*)text;

@end
