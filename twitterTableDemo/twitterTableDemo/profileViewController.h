//
//  profileViewController.h
//  twitterTableDemo
//
//  Created by Howard Livingston on 6/01/14.
//  Copyright (c) 2014 Howard Livingston. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface profileViewController : UIViewController

{
    
 //Profile View
    IBOutlet UILabel *proUserName;
    IBOutlet UILabel *proDetails;
    
    IBOutlet UILabel *proFollowed;
    IBOutlet UILabel *proFollowing;

    IBOutlet UIImageView *proUserIcon;
    
 
}

//Profile View Properties
@property(nonatomic, strong)NSString *twitterUserName;
@property(nonatomic, strong)NSString *twitterDetails;
@property(nonatomic, strong)NSString *twitterFollowed;
@property(nonatomic, strong)NSString *twitterFollowing;
@property(nonatomic, strong)UIImage *twitterIconP;
















@end
