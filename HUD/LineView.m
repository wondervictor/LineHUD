//
//  LineView.m
//  LineHUD
//
//  Created by VicChan on 16/2/27.
//  Copyright © 2016年 VicChan. All rights reserved.
//

#define WIDTH    self.frame.size.width
#define HEIGHT   self.frame.size.height

#import "LineView.h"

@interface LineView()
{
    CGFloat increment;
}
@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation LineView

- (id)initWithSize:(CGSize)size withCenter:(CGPoint)centerPoint backgoundColor:(UIColor *)backgroundColor progressColor:(UIColor *)color inParentView:(UIView *)parentView
{
    if (self = [super initWithFrame:CGRectMake(0, 0, 0, 0)]) {
        self.backgroundColor = backgroundColor;
        self.layer.cornerRadius = 10;
        self.center = centerPoint;
        self.centerPoint = centerPoint;
        self.lineColor = color;
        self.viewSize = size;
        increment = 0.1;
        self.parentView = parentView;
        
    }
    return self;
}



- (void)circleAnimationed {
    if (self.shapeLayer.strokeEnd > 1 && self.shapeLayer.strokeStart < 1) {
        self.shapeLayer.strokeStart += increment;
    } else if (self.shapeLayer.strokeStart == 0) {
        self.shapeLayer.strokeEnd += increment;
    }
    if (self.shapeLayer.strokeEnd == 0) {
        self.shapeLayer.strokeStart = 0;
    }
    if (self.shapeLayer.strokeStart == self.shapeLayer.strokeEnd) {
        self.shapeLayer.strokeEnd = 0;
    }
    
}



- (BOOL)isAnimating {
    return _Animating;
}

- (void)startAnimation {

    if (![self.timer isValid]) {
        [self.parentView addSubview:self];
        [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.frame = CGRectMake(0, 0, self.viewSize.width,self.viewSize.height );
            self.center = self.parentView.center;
        } completion:^(BOOL finished) {
            self.shapeLayer = [CAShapeLayer layer];
            self.shapeLayer.frame = CGRectMake(0, 0, 0.8f * self.viewSize.width, 0.8f * self.viewSize.height );
            self.shapeLayer.fillColor = [UIColor clearColor].CGColor;
            self.shapeLayer.lineWidth = 5.0f;
            self.shapeLayer.strokeColor = self.lineColor.CGColor;
            self.shapeLayer.strokeStart = 0;
            self.shapeLayer.strokeEnd = 0;
            
            UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 0.8f * self.viewSize.width, 0.8f * self.viewSize.height )];
            self.shapeLayer.position = self.center;
            self.shapeLayer.path = path.CGPath;
            
            [self.parentView.layer addSublayer:self.shapeLayer];
        }];
        self.Animating = YES;
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                      target:self
                                                    selector:@selector(circleAnimationed)
                                                    userInfo:nil
                                                     repeats:YES];
        
    }
}

- (void)stopAnimation {
    [self.timer invalidate];
    [self.shapeLayer removeFromSuperlayer];
    self.shapeLayer = nil;
    self.Animating = NO;
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.frame = CGRectMake(0, 0, 0, 0);
        self.center = self.parentView.center;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];


}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
