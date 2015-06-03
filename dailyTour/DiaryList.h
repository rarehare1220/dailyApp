//
//  DiaryList.h
//  dailyTour
//
//  Created by double on 17/05/2015.
//  Copyright (c) 2015 double. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Diary;

@interface DiaryList : NSManagedObject

@property (nonatomic, retain) NSSet *members;
@end

@interface DiaryList (CoreDataGeneratedAccessors)

- (void)addMembersObject:(Diary *)value;
- (void)removeMembersObject:(Diary *)value;
- (void)addMembers:(NSSet *)values;
- (void)removeMembers:(NSSet *)values;

@end
