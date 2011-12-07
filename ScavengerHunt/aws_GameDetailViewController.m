//
//  aws_GameDetailViewController.m
//  scavenger
//
//  Created by Adam Weeks on 12/5/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "aws_GameDetailViewController.h"
#import "GameTargetsViewController.h"
#import "PersonListingViewController.h"

@implementation aws_GameDetailViewController

@synthesize mapView, scoreLabel, targetCountLabel;

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
    self.title = @"Citywalk Orlando";
    MKCoordinateSpan span = MKCoordinateSpanMake(0.2, 0.2);
    CLLocationCoordinate2D centerCoordinate = CLLocationCoordinate2DMake(28.472918874012276, -81.46585464477545);
    MKCoordinateRegion region = MKCoordinateRegionMake(centerCoordinate, span);
    self.mapView.region = region;
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

-(IBAction)playGame:(id)sender
{
    GameTargetsViewController *gameTargets = [[GameTargetsViewController alloc]initWithNibName:@"GameTargetsViewController" bundle:nil];
    [self.navigationController pushViewController:gameTargets animated:YES];
}

-(IBAction)showPlayers:(id)sender
{
    PersonListingViewController *personView = [[PersonListingViewController alloc]initWithStyle:UITableViewStylePlain];
    personView.title = @"Current Players";
    [self.navigationController pushViewController:personView animated:YES];
}

@end
