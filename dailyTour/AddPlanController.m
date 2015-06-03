//
//  AddPlanController.m
//  dailyTour
//
//  Created by double on 17/05/2015.
//  Copyright (c) 2015 double. All rights reserved.
//

#import "AddPlanController.h"

@interface AddPlanController ()

@end

@implementation AddPlanController

- (void)viewDidLoad {
    [super viewDidLoad];
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


- (IBAction)addPlanButton:(id)sender {
    if([self.inputTitle.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Input" message:@"Title cannot be empty" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }else if([self.inputDesc.text isEqualToString:@""])
    {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Input" message:@"Description cannot be empty" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else{
        NSString *title = self.inputTitle.text;
        NSString *desc = self.inputDesc.text;
        NSDate *date = self.inputDate.date;
        
        
        Plan *plan = [NSEntityDescription insertNewObjectForEntityForName:@"Plan"
                                                           inManagedObjectContext:self.managedObjectContext];
        [plan setTitle:title];
        [plan setDesc:desc];
        [plan setDate:date];
        [plan setCompleteStatus:[NSNumber numberWithBool:NO]];
        [self.delegate addPlan:plan];
        [self.navigationController popViewControllerAnimated:YES];
        
    }

}
@end
