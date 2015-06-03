//
//  AddHabbitController.m
//  dailyTour
//
//  Created by double on 18/05/2015.
//  Copyright (c) 2015 double. All rights reserved.
//

#import "AddHabbitController.h"

@interface AddHabbitController ()

@end

@implementation AddHabbitController

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

- (IBAction)saveButton:(id)sender {
    if([self.titleTextView.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Input" message:@"Habbit Description cannot be empty" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else{
        NSString *title = self.titleTextView.text;
        //BOOL completeStatus = NO;
        
        Habbit *habbit = [NSEntityDescription insertNewObjectForEntityForName:@"Habbit"
                                                     inManagedObjectContext:self.managedObjectContext];
        
        [habbit setTitle:title];
        [habbit setCompleteStatus:[NSNumber numberWithBool:NO]];
         NSLog(@"AAAAAAAAAAAAAAAAAA");
        
        [self.delegate addHabbit:habbit];
        [self.navigationController popViewControllerAnimated:YES];
        
    }

}
@end
