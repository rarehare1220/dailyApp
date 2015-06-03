//
//  DiaryController.h
//  dailyTour
//
//  Created by double on 17/05/2015.
//  Copyright (c) 2015 double. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DiaryCell.h"
#import "Diary.h"
#import "AddDiaryController.h"
#import "DiaryList.h"

@interface DiaryController : UITableViewController<AddDiaryDelegate>
@property (strong, nonatomic) NSManagedObjectContext* managedObjectContext;

@property (strong, nonatomic) NSArray* currentDiaryArray;
@property (strong, nonatomic) DiaryList* currentDiaryList;
@property (nonatomic) int currentIndex;

@end
