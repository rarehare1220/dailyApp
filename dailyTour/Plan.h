//
//  Plan.h
//  dailyTour
//
//  Created by double on 17/05/2015.
//  Copyright (c) 2015 double. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PlanList;

@interface Plan : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSNumber * completeStatus;
@property (nonatomic, retain) PlanList *planlist;

@end
