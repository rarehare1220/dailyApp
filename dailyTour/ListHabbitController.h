//
//  ListHabbitController.h
//  dailyTour
//
//  Created by double on 18/05/2015.
//  Copyright (c) 2015 double. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Habbit.h"
#import "HabbitCell.h"
#import "AddHabbitController.h"
#import "HabbitList.h"

@interface ListHabbitController : UITableViewController<AddHabbitDelegate>
@property (strong, nonatomic) NSManagedObjectContext* managedObjectContext;

@property (strong, nonatomic) NSArray* currentHabbitArray;
@property (strong, nonatomic) HabbitList* currentHabbitList;
@property (nonatomic) int currentIndex;

@end
