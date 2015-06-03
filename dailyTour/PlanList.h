//
//  PlanList.h
//  dailyTour
//
//  Created by double on 17/05/2015.
//  Copyright (c) 2015 double. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Plan;

@interface PlanList : NSManagedObject

@property (nonatomic, retain) NSSet *members;
@end

@interface PlanList (CoreDataGeneratedAccessors)

- (void)addMembersObject:(Plan *)value;
- (void)removeMembersObject:(Plan *)value;
- (void)addMembers:(NSSet *)values;
- (void)removeMembers:(NSSet *)values;

@end
