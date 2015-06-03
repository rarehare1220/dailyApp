//
//  HabbitList.h
//  dailyTour
//
//  Created by double on 18/05/2015.
//  Copyright (c) 2015 double. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Habbit;

@interface HabbitList : NSManagedObject

@property (nonatomic, retain) NSSet *members;
@end

@interface HabbitList (CoreDataGeneratedAccessors)

- (void)addMembersObject:(Habbit *)value;
- (void)removeMembersObject:(Habbit *)value;
- (void)addMembers:(NSSet *)values;
- (void)removeMembers:(NSSet *)values;

@end
