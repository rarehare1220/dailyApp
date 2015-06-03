//
//  HabbitCell.h
//  dailyTour
//
//  Created by double on 18/05/2015.
//  Copyright (c) 2015 double. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HabbitCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UISwitch *completeStatus;

- (IBAction)statusChanged:(id)sender;

@end
