//
//  ViewController.m
//  运动小球
//
//  Created by 程倩 on 15/10/29.
//  Copyright (c) 2015年 CQ. All rights reserved.
//

#import "ViewController.h"
#include "UIView+Extension.h"

@interface ViewController ()<UIAccelerometerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *ball;
/**
 *  速度
 */
@property(nonatomic,assign)CGPoint point;

@property(nonatomic,strong)UIDynamicAnimator *animator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIAccelerometer *accelerometer = [UIAccelerometer sharedAccelerometer];
    
    accelerometer.delegate = self;
    //设置采样时间
    accelerometer.updateInterval = 1.0/30.0;
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
    _point.x += acceleration.x;
    _point.y -= acceleration.y;
    
    self.ball.x += _point.x;
    self.ball.y += _point.y;
    
    CGFloat damping = 0.6;
    if(self.ball.x <= 0)
    {
       //到屏幕的最左边
        self.ball.x = 0;
        _point.x *= -damping;
    }
    if(self.ball.maxX >= self.view.width)
    {
       //到最右边
        self.ball.maxX = self.view.width;
        _point.x *= -damping;

    }
    if(self.ball.y <= 0)
    {
        //到屏幕的最上边
        self.ball.y = 0;
        _point.y *= -damping;

        
    }
    if(self.ball.maxY>= self.view.height)
    {
        //到最下边
        self.ball.maxY = self.view.height ;
        _point.y *= -damping;

    }
    
}
@end
