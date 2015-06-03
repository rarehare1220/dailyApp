//
//  HomeController.m
//  dailyTour
//
//  Created by double on 17/05/2015.
//  Copyright (c) 2015 double. All rights reserved.
//

#import "HomeController.h"

@interface HomeController ()

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //    UINavigationController* navController = [UINavigationController alloc];
    //AddPlanController* controller = [AddPlanController alloc];
    
    //    [navController pushViewController:self animated:YES];
    if([segue.identifier isEqualToString:@"PlanSegue"])
    {
        [[segue destinationViewController] setManagedObjectContext:self.managedObjectContext];
    }else if([segue.identifier isEqualToString:@"DiarySegue"])
    {
        [[segue destinationViewController] setManagedObjectContext:self.managedObjectContext];
    }else if([segue.identifier isEqualToString:@"DailyShortSegue"])
    {
        [[segue destinationViewController] setManagedObjectContext:self.managedObjectContext];
    }else if([segue.identifier isEqualToString:@"HabbitSegue"])
    {
        [[segue destinationViewController] setManagedObjectContext:self.managedObjectContext];
    }else if([segue.identifier isEqualToString:@"TimeCapsuleSegue"])
    {
        [[segue destinationViewController] setManagedObjectContext:self.managedObjectContext];
    }else if([segue.identifier isEqualToString:@"CashSegue"])
    {
        [[segue destinationViewController] setManagedObjectContext:self.managedObjectContext];
    }    //    else if([segue.identifier isEqualToString:@"ViewReminderSegue"])
    //    {
    //        self.viewReminderController = segue.destinationViewController;
    //        NSManagedObject* selectedReminder = (NSManagedObject *)[self.currentReminderArray objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
    //        [[segue destinationViewController] setManagedObjectContext:self.managedObjectContext];
    //        self.viewReminderController.selectedReminder = selectedReminder;
    //    }
}


@end
