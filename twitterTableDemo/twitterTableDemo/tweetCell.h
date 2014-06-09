//
//  tweetCell.h
//  twitterTableDemo
//
//  Created by Howard Livingston on 6/01/14.
//  Copyright (c) 2014 Howard Livingston. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tweetCell : UITableViewCell

{

    IBOutlet UILabel *name;
    
    
}

//refresh cell method
-(void)refreshCell;


//Establish cell properties
@property (strong, nonatomic) IBOutlet UILabel *post;
@property (strong, nonatomic) IBOutlet UIImageView *cellIcon;
@property (strong, nonatomic) IBOutlet UILabel *cellDateTime;
@property(nonatomic,strong)NSString *cellNameText;
@property(nonatomic,strong)NSString *cellPostText;
@property(nonatomic,strong)NSString *cellDateTimeText;
@property(nonatomic,strong)UIImage *cellIconP;







@end
