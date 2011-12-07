//
//  aws_GameDetailViewController.h
//  scavenger
//
//  Created by Adam Weeks on 12/5/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface aws_GameDetailViewController : UIViewController

@property (nonatomic, retain) IBOutlet UILabel *targetCountLabel;
@property (nonatomic, retain) IBOutlet UILabel *scoreLabel;
@property (nonatomic, retain) IBOutlet MKMapView *mapView;

-(IBAction)playGame:(id)sender;
-(IBAction)showPlayers:(id)sender;

@end
