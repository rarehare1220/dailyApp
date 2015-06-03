//
//  AAShareBubbles.h
//  AAShareBubbles
//
//  Created by Almas Adilbek on 26/11/13.
//  Copyright (c) 2013 Almas Adilbek. All rights reserved.
//  https://github.com/mixdesign/AAShareBubbles
//

#import <UIKit/UIKit.h>
#import "ListPlanController.h"

@protocol AAShareBubblesDelegate;
//-(void) goToPage;
//@end


typedef enum {
    AAShareBubbleTypeFacebook = 0,
    AAShareBubbleTypeTwitter = 1,
    AAShareBubbleTypeGooglePlus = 2,
    AAShareBubbleTypeMail = 3,
    AAShareBubbleTypeTumblr = 4
} AAShareBubbleType;

@interface AAShareBubbles : UIView
{
    NSMutableArray *bubbles;
    
    // Local
    UIView *bgView;
}

@property (nonatomic, assign) id<AAShareBubblesDelegate> delegate;

@property (strong, nonatomic) ListPlanController *listPlanController;

@property (nonatomic, assign) BOOL showFacebookBubble;
@property (nonatomic, assign) BOOL showTwitterBubble;
@property (nonatomic, assign) BOOL showMailBubble;
@property (nonatomic, assign) BOOL showGooglePlusBubble;
@property (nonatomic, assign) BOOL showTumblrBubble;

@property (nonatomic, assign) int radius;
@property (nonatomic, assign) int bubbleRadius;
@property (nonatomic, assign) BOOL isAnimating;
@property (nonatomic, weak) UIView *parentView;

@property (nonatomic, assign) int facebookBackgroundColorRGB;
@property (nonatomic, assign) int twitterBackgroundColorRGB;
@property (nonatomic, assign) int mailBackgroundColorRGB;
@property (nonatomic, assign) int googlePlusBackgroundColorRGB;
@property (nonatomic, assign) int tumblrBackgroundColorRGB;

@property (strong, nonatomic) UIWindow *window;

-(id)initWithPoint:(CGPoint)point radius:(int)radiusValue inView:(UIView *)inView;

-(void)show;
-(void)hide;

@end

@protocol AAShareBubblesDelegate<NSObject>
-(void)aaShareBubbles:(AAShareBubbles *)shareBubbles tappedBubbleWithType:(AAShareBubbleType)bubbleType;
-(void)goToPage;
@end
