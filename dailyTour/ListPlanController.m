//
//  ListPlanController.m
//  dailyTour
//
//  Created by double on 16/05/2015.
//  Copyright (c) 2015 double. All rights reserved.
//

#import "ListPlanController.h"

@interface ListPlanController ()

@end

@implementation ListPlanController

- (void)viewDidLoad {
    [super viewDidLoad];
   //_managedObjectContext = self.managedObjectContext;
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    UINavigationController* navController = (UINavigationController*)self.window.rootViewController;
//    self.window.rootViewController =[navController.viewControllers firstObject];
//    self.window = [navController.viewControllers firstObject];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"PlanList"];
    NSError* error;
    NSArray* result = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if(result == nil) {
        NSLog(@"Could not fetch table:\n%@", error.userInfo); }
    else if([result count] == 0)
    {
        self.currentPlanList = [NSEntityDescription insertNewObjectForEntityForName:@"PlanList"
                                                                 inManagedObjectContext:self.managedObjectContext]; }
    else
    {
        self.currentPlanList = [result firstObject];
        self.currentPlanArray = [self.currentPlanList.members allObjects];
        self.currentPlanArray = [self.currentPlanArray sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
            NSDate *first = [(Plan*)a date];
            NSDate *second = [(Plan*)b date];
            return [first compare:second];
        }];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    switch (section)
    {
        case 0:
            return [self.currentPlanArray count];
        case 1:
            return 1;
    }
    return 0;

}


-(void) viewDidAppear:(BOOL)animated{
    
    self.currentPlanArray = [self.currentPlanArray sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        NSDate *first = [(Plan*)a date];
        NSDate *second = [(Plan*)b date];
        return [first compare:second];
    }];
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    if(indexPath.section == 0)
    {
        PlanCell *cell = (PlanCell*)[tableView dequeueReusableCellWithIdentifier:@"PlanCell" forIndexPath:indexPath];
        // Configure the cell...
        Plan* r = [self.currentPlanArray objectAtIndex:indexPath.row];
        cell.titleLabel.text = r.title;
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat =@"yyyy-MM-dd";
        cell.dateLabel.text = [dateFormatter stringFromDate:r.date];
        return cell;
        
    }
    else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TotalCell" forIndexPath:indexPath];
        cell.textLabel.text = [NSString stringWithFormat:@"Total Plan: %d", [self.currentPlanArray count]];
        return cell;
    }
    
    return nil;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //This method defineds what happens when a row is editted. In or case what happens when a row is deleted.
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        
        Plan* planToRemove = [self.currentPlanArray objectAtIndex:indexPath.row];
        [self.currentPlanList removeMembersObject:planToRemove];
        self.currentPlanArray = [self.currentPlanList.members allObjects];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        NSError* error;
        if(![self.managedObjectContext save:&error])
        {
            NSLog(@"Error Delete:\n%@", error.userInfo);
        }
    }
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
//    UINavigationController* navController = [UINavigationController alloc];
    //AddPlanController* controller = [AddPlanController alloc];
    
//    [navController pushViewController:self animated:YES];
    if([segue.identifier isEqualToString:@"AddPlanSegue"])
    {
        
        AddPlanController* controller = segue.destinationViewController;
        controller.managedObjectContext = self.managedObjectContext;
        controller.delegate = self;
    }
//    else if([segue.identifier isEqualToString:@"ViewReminderSegue"])
//    {
//        self.viewReminderController = segue.destinationViewController;
//        NSManagedObject* selectedReminder = (NSManagedObject *)[self.currentReminderArray objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
//        [[segue destinationViewController] setManagedObjectContext:self.managedObjectContext];
//        self.viewReminderController.selectedReminder = selectedReminder;
//    }
}

//Add Plan:
-(void)addPlan:(Plan *)plan
{
    [self.currentPlanList addMembersObject:plan];
    self.currentPlanArray = [self.currentPlanList.members allObjects];
    self.currentPlanArray = [self.currentPlanArray sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        NSDate *first = [(Plan*)a date];
        NSDate *second = [(Plan*)b date];
        return [first compare:second];
    }];
    NSError* error;
    if(![self.managedObjectContext save:&error])
    {
        NSLog(@"Could not add reminder:\n%@", error.userInfo);
    }
    [self.tableView reloadData];
}





/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
