//
//  AddDiaryController.h
//  dailyTour
//
//  Created by double on 17/05/2015.
//  Copyright (c) 2015 double. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Diary.h"

@protocol AddDiaryDelegate <NSObject>

-(void) addDiary:(Diary*) diary;

@end

@interface AddDiaryController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UITextField *weatherInput;
@property (strong, nonatomic) IBOutlet UITextView *descInput;

- (IBAction)saveButton:(id)sender;

@property (weak, nonatomic) id<AddDiaryDelegate> delegate;
@property (strong, nonatomic) NSManagedObjectContext* managedObjectContext;

@end
