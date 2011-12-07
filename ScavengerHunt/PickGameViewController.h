//
//  PickGameViewController.h
//  scavenger
//
//  Created by Adam Weeks on 12/5/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickGameViewController : UIViewController

@property (nonatomic, retain) IBOutlet UITextField *gameID;

-(IBAction)loadGame:(id)sender;
-(IBAction)findGames:(id)sender;
@end
