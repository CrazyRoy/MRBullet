//
//  MRBullet.m
//  MRBullet
//
//  Created by Roy on 2017/12/14.
//  Copyright © 2017年 Roy. All rights reserved.
//

#import "MRBullet.h"

@implementation MRBullet

/**
 弹幕管理器
 */
+ (MRBulletManager *)manager
{
    return [MRBulletManager sharedInstance];
}

@end
