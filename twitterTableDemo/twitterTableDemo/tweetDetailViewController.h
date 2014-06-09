//
//  tweetDetailViewController.h
//  twitterTableDemo
//
//  Created by Howard Livingston on 6/01/14.
//  Copyright (c) 2014 Howard Livingston. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tweetDetailViewController : UIViewController


{

//Detail View

    IBOutlet UILabel *detailsVCUserName;
    IBOutlet UILabel *detailsVCpost;
    IBOutlet UILabel *detailsVCdateTime;
    
    IBOutlet UIImageView *detailsVCUserIcon;


}

//Properties for Detail View
@property (nonatomic, strong)NSString *twitterUserName;
@property (nonatomic, strong)NSString *twitterPost;
@property (nonatomic, strong)NSString *twitterDateTime;
@property (nonatomic, strong)UIImage *twitterIconP;




@end
