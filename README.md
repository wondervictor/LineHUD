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

![示例图片](https://github.com/wondervictor/LineHUD/blob/master/LineHUD/example.png?raw=true)


示例代码：
```objective-c
// 初始化：
    self.hud = [[LineView alloc]initWithSize:CGSizeMake(100, 100) withCenter:self.view.center backgoundColor:[UIColor whiteColor] progressColor:[UIColor orangeColor] inParentView:self.view];

    
    - (IBAction)stop:(id)sender {
        if (self.hud.Animating == NO) {
            [self.hud startAnimation];
        } else if (self.hud.Animating == YES) {
            [self.hud stopAnimation];
        }


    }


```
