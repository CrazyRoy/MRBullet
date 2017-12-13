//
//  MRBulletView.h
//  MRBullet
//
//  Created by Roy on 2017/12/10.
//  Copyright © 2017年 Roy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    Start,  // 开始(马上进入屏幕)
    Enter,  // 完全进入屏幕
    Exit,   // 完全离开屏幕
} MRBulletStatus;

@interface MRBulletView : UIView

// 弹幕轨道
@property(nonatomic, assign) int trajectory;

// 弹幕对应状态:
//           1. 开始
//           2. 完全进入屏幕(需要创建新的弹幕追加在后面进行补位)
//           3. 完全离开屏幕(需要移除释放资源)
// 的block回调
@property(nonatomic, copy) void(^moveStatusBlock)(MRBulletStatus status);

/**
 初始化弹幕

 @param comment 弹幕内容
 @return 弹幕视图
 */
- (instancetype)initWithComment:(NSString *)comment;

/**
 开始动画
 */
- (void)mr_startAnimation;

/**
 结束动画
 */
- (void)mr_stopAnimation;

@end
