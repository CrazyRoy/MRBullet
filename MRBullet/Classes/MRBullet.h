//
//  MRBullet.h
//  MRBullet
//
//  Created by Roy on 2017/12/13.
//  Copyright © 2017年 Roy. All rights reserved.
//
//
//#ifndef MRBullet_h
//#define MRBullet_h
//
//
//#endif /* MRBullet_h */

#import <Foundation/Foundation.h>

#import "MRBulletView.h"
#import "MRBulletManager.h"

@interface MRBullet: NSObject

/**
 弹幕管理器
 */
+ (MRBulletManager *)manager;

@end
