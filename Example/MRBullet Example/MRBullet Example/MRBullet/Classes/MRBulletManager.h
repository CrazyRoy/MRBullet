//
//  MRBulletManager.h
//  MRBullet
//
//  Created by Roy on 2017/12/10.
//  Copyright © 2017年 Roy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MRBulletView;

@interface MRBulletManager : NSObject

// 弹幕 bulletView 创建完成之后的回调，便于添加到指定的 superView 中
@property(nonatomic, copy) void (^generateViewBlock)(MRBulletView *bulletView);

/**
 单例方法
 */
+ (instancetype)sharedInstance;

/**
 开始弹幕运动
 */
- (void)mr_startBulletsAction;

/**
 停止弹幕运动
 */
- (void)mr_stopAction;

@end
