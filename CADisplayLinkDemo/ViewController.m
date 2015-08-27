//
//  ViewController.m
//  CADisplayLinkDemo
//
//  Created by jianghai on 15/8/27.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()
@property (nonatomic,strong)CAShapeLayer* shapLayer;
@property (nonatomic,strong)UIBezierPath* path;
@property (nonatomic,assign)CGFloat angle;
@property (nonatomic,assign)CFTimeInterval duration;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CADisplayLink * link = [CADisplayLink displayLinkWithTarget:self selector:@selector(drawWork)];
    link.frameInterval = 1;
    
    [link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    _shapLayer = [[CAShapeLayer alloc] init];
    _shapLayer.lineWidth = 30;
    _shapLayer.strokeColor = [UIColor redColor].CGColor;
    _shapLayer.fillColor = [UIColor clearColor].CGColor;
    [self.view.layer addSublayer:_shapLayer];
    _angle = 0;
    
    _duration = 5.f;
    
}

- (void)drawWork
{
    _angle += M_PI * 2 / (self.duration * 60);
    
    UIBezierPath* path = [UIBezierPath bezierPathWithArcCenter:self.view.center radius:50 startAngle:0 endAngle:_angle clockwise:YES];
    _shapLayer.path = [path CGPath];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
