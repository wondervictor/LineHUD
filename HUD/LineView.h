//
//  LineView.h
//  LineHUD
//
//  Created by VicChan on 16/2/27.
//  Copyright © 2016年 VicChan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LineView : UIView

@property (nonatomic, getter=isAnimating) BOOL Animating;
@property (nonatomic, strong) UIView *parentView;
@property (nonatomic, assign) CGSize viewSize;
@property (nonatomic, assign) CGPoint centerPoint;
@property (nonatomic, strong) UIColor *lineColor;

- (id)initWithSize:(CGSize)size withCenter:(CGPoint)centerPoint backgoundColor:(UIColor *)backgroundColor progressColor:(UIColor *)color inParentView:(UIView *)parentView;

- (void)startAnimation;

- (void)stopAnimation;

@end
