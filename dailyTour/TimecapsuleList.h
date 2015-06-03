//
//  TimecapsuleList.h
//  dailyTour
//
//  Created by double on 18/05/2015.
//  Copyright (c) 2015 double. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Timecapsule;

@interface TimecapsuleList : NSManagedObject

@property (nonatomic, retain) NSSet *members;
@end

@interface TimecapsuleList (CoreDataGeneratedAccessors)

- (void)addMembersObject:(Timecapsule *)value;
- (void)removeMembersObject:(Timecapsule *)value;
- (void)addMembers:(NSSet *)values;
- (void)removeMembers:(NSSet *)values;

@end
