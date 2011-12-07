//
//  TargetDetailViewController.m
//  ScavengerHunt
//
//  Created by Adam Weeks on 12/5/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "TargetDetailViewController.h"
#import "SuccessViewController.h"

@implementation TargetDetailViewController

@synthesize tips = _tips;
@synthesize score = _score;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    if (!self.tips) {
        self.tips = [NSMutableArray array];
    }
    [self.tips addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"0",@"score",@"First Tip",@"tip",@"YES",@"Completed", nil]];
    [self.tips addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"20",@"score",@"Next Tip",@"tip",@"NO",@"Completed", nil]];
    [self.tips addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"25",@"score",@"Third Tip",@"tip",@"NO",@"Completed", nil]];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    //Score Section
    if (section == 0 || section == 2) {
        return 1;
    }
    //Tips
    else{
        return self.tips.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 || indexPath.section == 2) {
        static NSString *CellIdentifier = @"ScoreCell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        
        // Configure the cell...
        if (indexPath.section == 0) {
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.textLabel.text = [NSString stringWithFormat:@"Score: %i",self.score];
        }
        if (indexPath.section == 2) {
            cell.selectionStyle = UITableViewCellSelectionStyleBlue;
            cell.textLabel.text = @"I'm Here";
        }

        return cell;

    }else{
        static NSString *CellIdentifier = @"TipCell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        }
        
        // Configure the cell...
        NSDictionary *tip = [self.tips objectAtIndex:indexPath.row];
        cell.detailTextLabel.text = [tip objectForKey:@"score"];
        if ([[tip objectForKey:@"Completed"] isEqualToString:@"YES"]) {
            //Display Tip
            cell.textLabel.text = [tip objectForKey:@"tip"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }else{
            cell.textLabel.text = @"Press to reveal";
            cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    if (indexPath.section == 1) {
        NSMutableDictionary *tip = [NSMutableDictionary dictionaryWithDictionary:[self.tips objectAtIndex:indexPath.row]];
        if ([[tip objectForKey:@"Completed"]isEqualToString:@"NO"]) {
            //Decrement Score
            self.score -= [[tip objectForKey:@"score"]intValue];
            //Mark Tip as Completed
            [tip setObject:@"YES" forKey:@"Completed"];
            [self.tips replaceObjectAtIndex:indexPath.row withObject:tip];
            //Reload Table
            [self.tableView reloadData];
            
        }
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Location Tip" message:@"Upstairs in this location are a lot of sweaty programmers crammed into a little room with little to no wifi connection.  Your best bet is to stay downstairs!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    //I'm Here
    if (indexPath.section == 2) {
        //Generate random yes/no
        int i = arc4random() %2;
        if (i == 1) {
            //Yes
            SuccessViewController *successView = [[SuccessViewController alloc]initWithNibName:@"SuccessViewController" bundle:nil];
            successView.title = @"Congratulations!";
            [self.navigationController pushViewController:successView animated:YES];
        }else{
            //No
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"No, you are not there!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            //Decrement Score
            self.score -= 5;
            if (self.score < 0) {
                self.score = 0;
            }
            [self.tableView reloadData];
        }
    }
    
}

@end
