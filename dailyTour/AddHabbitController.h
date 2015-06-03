//
//  AddHabbitController.h
//  dailyTour
//
//  Created by double on 18/05/2015.
//  Copyright (c) 2015 double. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Habbit.h"
@protocol AddHabbitDelegate <NSObject>

-(void) addHabbit:(Habbit*) habbit;

@end

@interface AddHabbitController : UIViewController
@property (weak, nonatomic) id<AddHabbitDelegate> delegate;
@property (strong, nonatomic) NSManagedObjectContext* managedObjectContext;

@property (strong, nonatomic) IBOutlet UITextView *titleTextView;
- (IBAction)saveButton:(id)sender;


@end
