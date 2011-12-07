//
//  SuccessViewController.h
//  ScavengerHunt
//
//  Created by Adam Weeks on 12/5/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface SuccessViewController : UIViewController

@property (nonatomic, retain) IBOutlet MKMapView *mapView;

-(IBAction)websitePress:(id)sender;

@end
