//
//  Dailyshort.h
//  dailyTour
//
//  Created by double on 18/05/2015.
//  Copyright (c) 2015 double. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DailyshortList;

@interface Dailyshort : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) DailyshortList *dailyshortlist;

@end
