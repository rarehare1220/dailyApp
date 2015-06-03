//
//  AddPlanController.h
//  dailyTour
//
//  Created by double on 17/05/2015.
//  Copyright (c) 2015 double. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Plan.h"

@protocol AddPlanDelegate <NSObject>

-(void) addPlan:(Plan*) plan;

@end

@interface AddPlanController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *inputTitle;
@property (strong, nonatomic) IBOutlet UITextField *inputDesc;
@property (strong, nonatomic) IBOutlet UIDatePicker *inputDate;

@property (weak, nonatomic) id<AddPlanDelegate> delegate;
@property (strong, nonatomic) NSManagedObjectContext* managedObjectContext;

- (IBAction)addPlanButton:(id)sender;


@end
