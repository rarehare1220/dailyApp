//
//  DiaryController.m
//  dailyTour
//
//  Created by double on 17/05/2015.
//  Copyright (c) 2015 double. All rights reserved.
//

#import "DiaryController.h"

@interface DiaryController ()

@end

@implementation DiaryController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"DiaryList"];
    NSError* error;
    NSArray* result = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if(result == nil) {
        NSLog(@"Could not fetch table:\n%@", error.userInfo); }
    else if([result count] == 0)
    {
        self.currentDiaryList = [NSEntityDescription insertNewObjectForEntityForName:@"DiaryList"
                                                             inManagedObjectContext:self.managedObjectContext]; }
    else
    {
        self.currentDiaryList = [result firstObject];
        self.currentDiaryArray = [self.currentDiaryList.members allObjects];
        self.currentDiaryArray = [self.currentDiaryArray sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
            NSDate *first = [(Diary*)a date];
            NSDate *second = [(Diary*)b date];
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    switch (section)
    {
        case 0:
            return [self.currentDiaryArray count];
        case 1:
            return 1;
    }
    return 0;

}

-(void) viewDidAppear:(BOOL)animated{
    
    self.currentDiaryArray = [self.currentDiaryArray sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        NSDate *first = [(Diary*)a date];
        NSDate *second = [(Diary*)b date];
        return [first compare:second];
    }];
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
//    if(indexPath.section == 0)
//    {
        DiaryCell *cell = (DiaryCell*)[tableView dequeueReusableCellWithIdentifier:@"DiaryCell" forIndexPath:indexPath];
        // Configure the cell...
        Diary* r = [self.currentDiaryArray objectAtIndex:indexPath.row];
        cell.weather.text = r.weather;
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat =@"yyyy-MM-dd";
        cell.date.text = [dateFormatter stringFromDate:r.date];
        return cell;
        
//    }
//    else{
//        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TotalCell" forIndexPath:indexPath];
//        cell.textLabel.text = [NSString stringWithFormat:@"Total Plan: %d", [self.currentPlanArray count]];
//        return cell;
//    }
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //This method defineds what happens when a row is editted. In or case what happens when a row is deleted.
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        
        Diary* planToRemove = [self.currentDiaryArray objectAtIndex:indexPath.row];
        [self.currentDiaryList removeMembersObject:planToRemove];
        self.currentDiaryArray = [self.currentDiaryList.members allObjects];
        
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
    if([segue.identifier isEqualToString:@"AddDiarySegue"])
    {
        
        AddDiaryController* controller = segue.destinationViewController;
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


//Add Diary:
-(void)addDiary:(Diary *)diary
{
    [self.currentDiaryList addMembersObject:diary];
    self.currentDiaryArray = [self.currentDiaryList.members allObjects];
    self.currentDiaryArray = [self.currentDiaryArray sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        NSDate *first = [(Diary*)a date];
        NSDate *second = [(Diary*)b date];
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
