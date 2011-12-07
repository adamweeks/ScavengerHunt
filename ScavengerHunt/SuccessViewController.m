//
//  SuccessViewController.m
//  ScavengerHunt
//
//  Created by Adam Weeks on 12/5/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "SuccessViewController.h"

@implementation SuccessViewController

@synthesize mapView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    MKCoordinateSpan span = MKCoordinateSpanMake(0.2, 0.2);
    CLLocationCoordinate2D centerCoordinate = CLLocationCoordinate2DMake(28.473897346455, 28.4738973464555);
    MKCoordinateRegion region = MKCoordinateRegionMake(centerCoordinate, span); 
    self.mapView.region = region;
    MKPlacemark *placemark = [[MKPlacemark alloc]initWithCoordinate:centerCoordinate addressDictionary:nil];
    [self.mapView addAnnotation:placemark];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)websitePress:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://www.yellowpages.com/orlando-fl/mip/hard-rock-cafe-2427674?from=pubapi_943aw4l8qj"]];
}

@end
