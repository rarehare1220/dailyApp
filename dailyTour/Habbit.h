//
//  Habbit.h
//  dailyTour
//
//  Created by double on 18/05/2015.
//  Copyright (c) 2015 double. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class HabbitList;
@interface Habbit : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * completeStatus;
@property (nonatomic, retain) HabbitList *habbitlist;

@end
