//
//  ViewController.m
//  LineHUD
//
//  Created by VicChan on 16/2/27.
//  Copyright © 2016年 VicChan. All rights reserved.
//

#import "ViewController.h"
#import "LineView.h"


@interface ViewController ()

@property (nonatomic, strong) LineView *hud;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.hud = [[LineView alloc]initWithSize:CGSizeMake(100, 100) withCenter:self.view.center backgoundColor:[UIColor whiteColor] progressColor:[UIColor orangeColor] inParentView:self.view];
    

    //[self.view addSubview:self.hud];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)stop:(id)sender {
    if (self.hud.Animating == NO) {
        [self.hud startAnimation];
    } else if (self.hud.Animating == YES) {
        [self.hud stopAnimation];
    }
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
