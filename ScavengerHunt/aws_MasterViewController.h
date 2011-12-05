//
//  aws_MasterViewController.h
//  ScavengerHunt
//
//  Created by Adam Weeks on 12/5/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class aws_DetailViewController;

@interface aws_MasterViewController : UITableViewController

@property (strong, nonatomic) aws_DetailViewController *detailViewController;

@end
