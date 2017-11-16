//
//  MyButton.m
//  MyButton
//
//  Created by 方冬冬 on 2017/11/15.
//  Copyright © 2017年 方冬冬. All rights reserved.
//

#import "MyButton.h"


static const NSTimeInterval defaultDuration = 3.0f;
//记录按钮是否忽略按钮点击事件，默认第一次执行事件
static BOOL _isIgnoreEvent = NO;

/**
 设置执行按钮事件状态
 */
static void resetState (){
    
    _isIgnoreEvent = NO;
    
}
@interface MyButton()

@end

@implementation MyButton
- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    //1.按钮点击间隔事件
    _time = _time = (0) ? defaultDuration :_time;
    
    //2.是否忽略按钮点击事件
    if (_isIgnoreEvent) {
//        2.1忽略按钮点击事件
//        2.1忽略此事件
        
        return;
    }else if (_time >0){
        //不要忽略按钮的点击事件
        //后续在事件间隔内直接忽略掉按钮事件
        _isIgnoreEvent = YES;
        
        //间隔事件后  执行按钮事件
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(_time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            resetState();
        });
        
        //发送按钮点击消息
        [super sendAction:action to:target forEvent:event];
        
    }
}
@end
