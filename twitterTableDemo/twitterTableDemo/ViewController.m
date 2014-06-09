//
//  ViewController.m
//  twitterTableDemo
//
//  Created by Howard Livingston on 6/01/14.
//  Copyright (c) 2014 Howard Livingston. All rights reserved.
//

//Frameworks
#import <Accounts/Accounts.h>
#import <Social/Social.h>

//Files
#import "ViewController.h"
#import "tweetDetailViewController.h"
#import "profileViewController.h"
#import "tweetCell.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    
    //Background color
    self.view.backgroundColor = [UIColor blueColor];
    
    //Intitialize the array
    tweets = [[NSMutableArray alloc] init];
    
    
    [self loadTweets];
	[super viewDidLoad];
}



//BUTTON ACTIONS

//Post to user timeline
-(IBAction)post:(id)sender
{
    
    {
        
        SLComposeViewController * slComposeViewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        //set default text
        [slComposeViewController setInitialText:@"Posted from Howie Livingstons App"];
        [slComposeViewController addImage:[UIImage imageNamed:@"1920x1440-men-and-fantastic-four.jpg"]];
        [self presentViewController:slComposeViewController animated:true completion:nil];
        
        
    }

    
}


//Refresh the timeline
-(IBAction)refreshTimeline:(id)sender

{
    
    [self loadTweets];
    
}


//ALL SEGUES


//This segue is to move between pic view controllers
-(IBAction)done:(UIStoryboardSegue *)segue
{
    
    
    
}

-(IBAction)profile:(id)sender
{
    
    [self performSegueWithIdentifier:@"toProfileView" sender:self];
    
}


//Transitioning segues for the table cell view
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    if ([segue.identifier isEqualToString:@"toDetailsView"])
    {
    
        tweetDetailViewController *tweetDetails = segue.destinationViewController;
        
            tweetDetails.twitterUserName = nameString;
            tweetDetails.twitterPost = postString;
            tweetDetails.twitterDateTime = anotherDateString;
            tweetDetails.twitterIconP = [[UIImage alloc] initWithData:image];
        
       
    }
    else if ([segue.identifier isEqualToString:@"toProfileView"])
    
    {
        profileViewController *profileDetails = segue.destinationViewController;
            profileDetails.twitterDetails = detailsString;
            profileDetails.twitterUserName = nameString;
            profileDetails.twitterFollowed = proFollowedString;
            profileDetails.twitterFollowing = proFollowingString;
            profileDetails.twitterIconP = [[UIImage alloc] initWithData:image];
        
    
    }

    
    
}

-(void)loadTweets
{
    
    //need to add this so we can access the account store objects and methods. We can also access the Facebook fees with this as well
    ACAccountStore *accountStore= [[ACAccountStore alloc] init];
    if (accountStore != nil)
        
    {
        //first, what type of account are we lookng for?
        ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
        if (accountType != nil)
        {
            
            alert =[[UIAlertView alloc] initWithTitle:@"Loading Tweets Now"
                                              message:nil
                                             delegate:nil
                                    cancelButtonTitle:@"Cancel"
                                    otherButtonTitles:nil];
            activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
            
            activityIndicator.center = CGPointMake(150, 350);
            activityIndicator.hidesWhenStopped = YES;
            [self.view addSubview:activityIndicator];
            [activityIndicator startAnimating];
            [alert show];
            
            
            
            
            [accountStore requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error)
             {
                
                if (granted)
                {
                    NSLog(@"Starting to get info");
                    //SUCCESS
                    //information populated is in an array. In order to access information from the array, we need to build something to do that
                    NSArray *twitterAccount = [accountStore accountsWithAccountType:accountType];
                    if (twitterAccount != nil)
                        
                    {
                        
                        ACAccount * currentAccount = [twitterAccount objectAtIndex:0];
                        if (currentAccount != nil)
                        {
                            //create a string to hold the twitter request info
                            //if you want specific info, instead of user_timelone.json, use a parameter from the online docs found here
                            
                            
                            NSString *requestString = [NSString stringWithFormat:@"https://api.twitter.com/1.1/statuses/user_timeline.json"];
                            
                           NSLog(@"got the stuff...waiting to serialize");
                            
                            //create a social framework request object
                            SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:[NSURL URLWithString:requestString] parameters:nil];
                            if(request != nil)
                            {
        
                                [request setAccount:currentAccount];
                            
                            //perform the request..using code block
                                [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
                                
                                NSInteger responseCode = [urlResponse statusCode];
                                
                                    if (responseCode == 200)
                                    {
                                
                                        tweets = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
                                         NSLog(@"%@", [[tweets objectAtIndex:0] description]);

                                
                                        if (tweets != nil)
                                        {
                                            
                                            
                                        }
                                    }
                                        dispatch_async(dispatch_get_main_queue(), ^{
                                            [tweetTableView reloadData];

                                });
                              
                            }];
                             
                             }
                        }
                    }
                }
                else
                {
                    
                    NSLog(@"User did not grant access");
                }
            }];
            [alert dismissWithClickedButtonIndex:0 animated:YES];
            [activityIndicator stopAnimating];
        }
    }

}



-(NSInteger)tableView:(UITableView *)tweettableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"add cells now");
    
    return [tweets count];
    
}



//Pass back the cells that are going to be fed back into the table view
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cells coming back");
    
    //Start adding cells here
    tweetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tweetCell"];
    if (cell != nil)
        
    {
        
        NSDictionary *tweetsDictionary =[tweets objectAtIndex:indexPath.row];
        
        postString =[tweetsDictionary valueForKey:@"text"];
        
        NSDictionary *userDictionary = [tweetsDictionary objectForKey:@"user"];
        if (userDictionary != nil)
        {
            
            image = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[userDictionary valueForKey:@"profile_image_url_https"]]];
            nameString =[NSString stringWithFormat:@"%@",[userDictionary valueForKey:@"name"]];
            userString =[NSString stringWithFormat:@"%@",[userDictionary valueForKey:@"screen_name"]];
            detailsString =[NSString stringWithFormat:@"%@",[userDictionary valueForKey:@"description"]];
            proFollowedString =[NSString stringWithFormat:@"%@",[userDictionary valueForKey:@"followers_count"]];
            proFollowingString =[NSString stringWithFormat:@"%@",[userDictionary valueForKey:@"following"]];
            anotherDateString = [NSString stringWithFormat:@"%@", [userDictionary valueForKey:@"created_at"]];
            
            
            NSDateFormatter *inFormatted = [[NSDateFormatter alloc]init];
            
                [inFormatted setDateFormat:@"EEE MMM d HH:mm:ss ZZZ Y"];
            
            NSDate *date = [inFormatted dateFromString:anotherDateString];
            NSDateFormatter *outFormatted = [[NSDateFormatter alloc]init];
            
                [outFormatted setDateFormat:@"MMM d, Y"];
            
            anotherDateString = [outFormatted stringFromDate:date];
            
            
            
            NSLog(@"%@%@", nameString, detailsString);
            cell.cellNameText = nameString;
            cell.cellDateTime.text = anotherDateString;
            cell.cellIcon.image = [[UIImage alloc] initWithData:image];
            cell.post.text = postString;
            NSLog(@"DATE: %@", anotherDateString);
            
        }
        
        
        
            NSLog(@"ready to refresh cell with info");
        
    }
    
    return cell;
    
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
