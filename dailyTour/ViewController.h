//
//  ViewController.h
//  dailyTour
//
//  Created by double on 13/05/2015.
//  Copyright (c) 2015 double. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AAShareBubbles.h"
#import "ListPlanController.h"
#import "ViewControllerAA.h"
#import <CoreData/CoreData.h>

@interface ViewController : UIViewController<AAShareBubblesDelegate> {
    
}

@property (strong, nonatomic) ListPlanController *listPlanController;
@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSManagedObjectModel* managedObjectModel;
@property (strong, nonatomic) NSPersistentStoreCoordinator* persistentStoreCoordinator;
@property (strong, nonatomic) NSManagedObjectContext* managedObjectContext;


@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UISlider *radiusSlider;
@property (weak, nonatomic) IBOutlet UISlider *bubbleRadiusSlider;

@property (weak, nonatomic) IBOutlet UILabel *radiusLabel;
@property (weak, nonatomic) IBOutlet UILabel *bubbleRadiusLabel;

- (IBAction)shareTapped:(id)sender;

- (IBAction)radiusValueChanged:(id)sender;

- (IBAction)bubbleRadiusValueChanged:(id)sender;


@end

