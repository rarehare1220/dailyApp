//
//  ListPlanController.h
//  dailyTour
//
//  Created by double on 16/05/2015.
//  Copyright (c) 2015 double. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlanCell.h"
#import "Plan.h"
#import "AddPlanController.h"
#import "PlanList.h"

@interface ListPlanController : UITableViewController<AddPlanDelegate>

@property (strong, nonatomic) NSManagedObjectContext* managedObjectContext;

@property (strong, nonatomic) NSArray* currentPlanArray;
@property (strong, nonatomic) PlanList* currentPlanList;
@property (nonatomic) int currentIndex;

@property (strong, nonatomic) UIWindow *window;

@end
