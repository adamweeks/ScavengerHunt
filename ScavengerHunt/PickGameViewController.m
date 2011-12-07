//
//  PickGameViewController.m
//  scavenger
//
//  Created by Adam Weeks on 12/5/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PickGameViewController.h"
#import "aws_GameDetailViewController.h"
#import "NearbyGamesViewController.h"

@implementation PickGameViewController
@synthesize gameID;

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
    self.title = @"Pick Game";
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

-(IBAction)loadGame:(id)sender
{
    if (gameID.text.length > 0) {
        aws_GameDetailViewController *gameView = [[aws_GameDetailViewController alloc]initWithNibName:@"aws_GameDetailViewController" bundle:nil];
        gameView.title = @"Citywalk Orlando";
        [self.navigationController pushViewController:gameView animated:YES];
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Really?" message:@"You can't just expect us to KNOW what you want!!!" delegate:nil cancelButtonTitle:@"I'm Sorry! I'll fix it!" otherButtonTitles: nil];
        [alert show];
    }

}

-(IBAction)findGames:(id)sender
{
    NearbyGamesViewController *gamesView = [[NearbyGamesViewController alloc]initWithStyle:UITableViewStylePlain];
    gamesView.title = @"Nearby Games";
    [self.navigationController pushViewController:gamesView animated:YES];
}
@end
