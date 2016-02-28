## 使用UIBezier绘制出的HUD
使用方法：
```objective-c
- (id)initWithSize:(CGSize)size
        withCenter:(CGPoint)centerPoint
    backgoundColor:(UIColor *)backgroundColor
     progressColor:(UIColor *)color
      inParentView:(UIView *)parentView;
- (void)startAnimation;
//  开始动画
- (void)stopAnimation;
//  结束动画
```
设置HUD的size，centerPoint，背景颜色，线条颜色。
