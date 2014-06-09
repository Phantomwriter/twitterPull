//
//  profileViewController.m
//  twitterTableDemo
//
//  Created by Howard Livingston on 6/01/14.
//  Copyright (c) 2014 Howard Livingston. All rights reserved.
//

#import "profileViewController.h"

@interface profileViewController ()

@end

@implementation profileViewController

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
    proUserName.text = _twitterUserName;
    proDetails.text = _twitterDetails;
    proFollowed.text =_twitterFollowed;
    proFollowing.text =_twitterFollowing;
    proUserIcon.image = _twitterIconP;

    

    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
