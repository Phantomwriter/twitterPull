//
//  tweetDetailViewController.m
//  twitterTableDemo
//
//  Created by Howard Livingston on 6/01/14.
//  Copyright (c) 2014 Howard Livingston. All rights reserved.
//

#import "tweetDetailViewController.h"

@interface tweetDetailViewController ()

@end

@implementation tweetDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    //Establish Background
    self.view.backgroundColor = [UIColor blueColor];
    
    //Designate labels
    detailsVCUserName.text = _twitterUserName;
    detailsVCpost.text = _twitterPost;
    detailsVCdateTime.text = _twitterDateTime;
    detailsVCUserIcon.image = _twitterIconP;

        [super viewDidLoad];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
