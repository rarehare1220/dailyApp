//
//  ListHabbitController.m
//  dailyTour
//
//  Created by double on 18/05/2015.
//  Copyright (c) 2015 double. All rights reserved.
//

#import "ListHabbitController.h"

@interface ListHabbitController ()

@end

@implementation ListHabbitController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"HabbitList"];
    NSError* error;
    NSArray* result = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if(result == nil) {
        NSLog(@"Could not fetch table:\n%@", error.userInfo); }
    else if([result count] == 0)
    {
        self.currentHabbitList = [NSEntityDescription insertNewObjectForEntityForName:@"HabbitList"
                                                              inManagedObjectContext:self.managedObjectContext]; }
    else
    {
        self.currentHabbitList = [result firstObject];
        self.currentHabbitArray = [self.currentHabbitList.members allObjects];
//        self.currentHabbitArray = [self.currentHabbitArray sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
//            NSDate *first = [(Habbit*)a date];
//            NSDate *second = [(Habbit*)b date];
//            return [first compare:second];
//        }];
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
            return [self.currentHabbitArray count];
        case 1:
            return 1;
    }
    return 0;
}

-(void) viewDidAppear:(BOOL)animated{
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    //    if(indexPath.section == 0)
    //    {
    HabbitCell *cell = (HabbitCell*)[tableView dequeueReusableCellWithIdentifier:@"HabbitCell" forIndexPath:indexPath];
    // Configure the cell...
    Habbit* r = [self.currentHabbitArray objectAtIndex:indexPath.row];
    NSLog(@"Now Fetching Habbit:%@",r.title);
    cell.titleLabel.text = r.title;
    [cell.completeStatus setOn:r.completeStatus];
    return cell;
    
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //This method defineds what happens when a row is editted. In or case what happens when a row is deleted.
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        
        Habbit* planToRemove = [self.currentHabbitArray objectAtIndex:indexPath.row];
        [self.currentHabbitList removeMembersObject:planToRemove];
        self.currentHabbitArray = [self.currentHabbitList.members allObjects];
        
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
    if([segue.identifier isEqualToString:@"AddHabbitSegue"])
    {
        
        AddHabbitController* controller = segue.destinationViewController;
        controller.managedObjectContext = self.managedObjectContext;
        controller.delegate = self;
    }

}

//Add Habbit:
-(void)addHabbit:(Habbit *)habbit
{
    [self.currentHabbitList addMembersObject:habbit];
    self.currentHabbitArray = [self.currentHabbitList.members allObjects];
    
    NSError* error;
    if(![self.managedObjectContext save:&error])
    {
        NSLog(@"Could not add Habbit:\n%@", error.userInfo);
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
