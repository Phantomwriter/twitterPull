//
//  ViewController.h
//  twitterTableDemo
//
//  Created by Howard Livingston on 6/01/14.
//  Copyright (c) 2014 Howard Livingston. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

//Variables

{
    
        IBOutlet UITableView *tweetTableView;
    
    
        //Array to hold tweet info
        NSMutableArray *tweets;
    
        //Alerts and indicators
        UIAlertView *alert;
        UIActivityIndicatorView *activityIndicator;
    
        //For image
        NSData *image;
        UIImage *twitterIconP;
    
    
        //Main Tweet View
        NSString *userString;
        NSString *nameString;
        NSString *postString;
        NSString *twitterUserName;
        NSString *twitterDetails;
        NSString *anotherDateString;
        NSString *twitterDateTime;
        NSString *dateString;


        //Details View
        NSString *detailsString;
    
    
    
        //Profile View
        NSString *twitterFollowed;
        NSString *proFollowedString;
        NSString *twitterFollowing;
        NSString *proFollowingString;
        NSString *detailPost;

    }


-(IBAction)refreshTimeline:(id)sender;
-(IBAction)post:(id)sender;
-(IBAction)profile:(id)sender;







@end
