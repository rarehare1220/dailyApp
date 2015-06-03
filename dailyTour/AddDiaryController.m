//
//  AddDiaryController.m
//  dailyTour
//
//  Created by double on 17/05/2015.
//  Copyright (c) 2015 double. All rights reserved.
//

#import "AddDiaryController.h"

@interface AddDiaryController ()

@end

@implementation AddDiaryController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *now = [self getCurrentTime];
    self.dateLabel.text = [NSString stringWithFormat:@"%@", now];
    
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

-(NSString *)getCurrentTime{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat =@"yyyy-MM-dd HH:mm:ss";
//    [formatter setDateStyle:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateTime = [formatter stringFromDate:[NSDate date]];
    NSLog(@"DATE is: %@",dateTime);
    return dateTime;
}

- (IBAction)saveButton:(id)sender {
    if([self.weatherInput.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Input" message:@"Weather cannot be empty" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }else if([self.descInput.text isEqualToString:@""])
    {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Input" message:@"Description cannot be empty" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else{
        NSString *desc = self.descInput.text;
        NSString *weather = self.weatherInput.text;
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat =@"yyyy-MM-dd HH:mm:ss";
        NSDate *date = [formatter dateFromString:[self getCurrentTime]];
        
        Diary *diary = [NSEntityDescription insertNewObjectForEntityForName:@"Diary"
                                                   inManagedObjectContext:self.managedObjectContext];
    
        [diary setDesc:desc];
        [diary setDate:date];
        [diary setWeather:weather];
        [self.delegate addDiary:diary];
        [self.navigationController popViewControllerAnimated:YES];
        
    }
    
}
@end
