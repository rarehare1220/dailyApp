//
//  ViewController.m
//  dailyTour
//
//  Created by double on 13/05/2015.
//  Copyright (c) 2015 double. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    AAShareBubbles *shareBubbles;
    float radius;
    float bubbleRadius;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    radius = 122;
    bubbleRadius = 40;
    _radiusSlider.value = radius;
    _bubbleRadiusSlider.value = bubbleRadius;
    
    _radiusLabel.text = [NSString stringWithFormat:@"%.0f", radius];
    _bubbleRadiusLabel.text = [NSString stringWithFormat:@"%.0f", bubbleRadius];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shareTapped:(id)sender {
    if(shareBubbles) {
        shareBubbles = nil;
    }
    shareBubbles = [[AAShareBubbles alloc] initWithPoint:_shareButton.center radius:radius inView:self.view];
    shareBubbles.delegate = self;
    shareBubbles.bubbleRadius = bubbleRadius;
    shareBubbles.showFacebookBubble = YES;
    shareBubbles.showTwitterBubble = YES;
    shareBubbles.showGooglePlusBubble = YES;
    shareBubbles.showMailBubble = YES;
    shareBubbles.showTumblrBubble = YES;
    [shareBubbles show];

}

- (IBAction)radiusValueChanged:(id)sender {
    radius = [(UISlider *)sender value];
    _radiusLabel.text = [NSString stringWithFormat:@"%.0f", radius];

}

- (IBAction)bubbleRadiusValueChanged:(id)sender {
    bubbleRadius = [(UISlider *)sender value];
    _bubbleRadiusLabel.text = [NSString stringWithFormat:@"%.0f", bubbleRadius];
}

#pragma mark -
#pragma mark AAShareBubbles

-(void)aaShareBubbles:(AAShareBubbles *)shareBubbles tappedBubbleWithType:(AAShareBubbleType)bubbleType
{
    switch (bubbleType) {
        case AAShareBubbleTypeFacebook:
            NSLog(@"Facebook");
            break;
        case AAShareBubbleTypeTwitter:
            NSLog(@"Twitter");
            break;
        case AAShareBubbleTypeMail:
            NSLog(@"Email");
            break;
        case AAShareBubbleTypeGooglePlus:
            NSLog(@"Google+");
            break;
        case AAShareBubbleTypeTumblr:
            NSLog(@"Tumblr");
            break;
            
        default:
            break;
    }
}

- (void)viewDidUnload {
    [self setShareButton:nil];
    [self setRadiusSlider:nil];
    [self setRadiusLabel:nil];
    [self setBubbleRadiusSlider:nil];
    [self setBubbleRadiusLabel:nil];
    [super viewDidUnload];
}

//Go To Page:
-(void) goToPage{
//    self.listPlanController=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"aaa"];
//    
//    ViewControllerAA *controller =[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"aaa"];
//    controller.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:controller animated:YES];
    
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ListPlanController *storyViewController = [mainStoryBoard instantiateViewControllerWithIdentifier:@"listPlanController"];
    
   
    //storyViewController.managedObjectContext = self.managedObjectContext;
    
   
    
    
    
    
//    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    ListPlanController *storyViewController = [mainStoryBoard instantiateViewControllerWithIdentifier:@"listPlanController"];
[self presentViewController:storyViewController animated:YES completion:nil];
    
   //    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    // Override point for customization after application launch.
//    ListPlanController* listPlanController1=[self.storyboard instantiateViewControllerWithIdentifier:@"ListPlanController"];
//    self.window.rootViewController = listPlanController1;
//    [self.window makeKeyAndVisible];
//    //listPlanController1.hidesBottomBarWhenPushed = YES;
    
    
}








@end
