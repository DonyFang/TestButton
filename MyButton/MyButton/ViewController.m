//
//  ViewController.m
//  MyButton
//
//  Created by 方冬冬 on 2017/11/15.
//  Copyright © 2017年 方冬冬. All rights reserved.
//

#import "ViewController.h"
#import "MyButton.h"
#import "UIButton+Tool.h"
#import "UIButton+touch.h"
@interface ViewController ()

@property(nonatomic,strong)UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    

    [self methodFour];
    

}

- (void)methodFour{
    UIButton *customeBut = [[UIButton alloc] initWithFrame:CGRectMake(300, 400, 100, 100)];
    
    customeBut.backgroundColor = [UIColor greenColor];
    
    customeBut.timeInterval = 2.0f;
    [customeBut addTarget:self action:@selector(customeButOperations:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:customeBut];
    
}

- (void)methodOne{
    
    self.button = [[UIButton alloc] initWithFrame:CGRectMake(200, 200, 100, 100)];
    
    self.button.backgroundColor = [UIColor redColor];
    
    [self.button addTarget:self action:@selector(btnClickedOperations:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.button];
    
}


- (void)MethodThree{
    MyButton *btn = [[MyButton alloc] init];
    [btn setTitle:@"点我啊" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.layer.borderWidth = 1;
    btn.frame = CGRectMake(50, 100, 100, 50);
    [self.view addSubview:btn];
    
    // 设置按钮的点击间隔时间
    btn.time = 2.f;
    
    [btn addTarget:self action:@selector(btnDidClick:) forControlEvents:UIControlEventTouchUpInside];
    
}


- (void)methodTwo{
    UIButton *newButton = [[UIButton alloc] initWithFrame:CGRectMake(300, 500, 100, 100)];
    
    newButton.backgroundColor = [UIColor redColor];
    
    
    [newButton addTarget:self action:@selector(newButtonClickedOperations:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:newButton];
    
}

- (void)customeButOperations:(UIButton *)sender{
    
   NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)btnDidClick:(id)sender {
         NSLog(@"我被点击了 >>> %@", NSStringFromSelector(_cmd));
 }

- (void)btnClickedOperations:(UIButton *)sender{
    
            static NSTimeInterval time = 0.0;
            NSTimeInterval currentTime = [NSDate date].timeIntervalSince1970;
                if (currentTime - time > 1) {
                    //处理逻辑
                    NSLog(@"这是一个测试");

                }
            time = currentTime;
}

- (void)newButtonClickedOperations:(UIButton *)sender{
    
    sender.enabled = NO;
    //处理逻辑
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"btnClickedOperations");
        sender.enabled = YES;
    });
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
