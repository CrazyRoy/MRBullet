//
//  MRBulletView.m
//  MRBullet
//
//  Created by Roy on 2017/12/10.
//  Copyright © 2017年 Roy. All rights reserved.
//

#import "MRBulletView.h"

@interface MRBulletView()

@property(nonatomic, strong) UILabel *lbCommentLabel;
@property(nonatomic, strong) UIImageView *lbCommentIcon;

@end

CGFloat static kBulletLabelPadding = 10;

@implementation MRBulletView

/**
 初始化弹幕

 @param comment 弹幕内容
 @return 弹幕视图
 */
- (instancetype)initWithComment:(NSString *)comment
{
    if(self = [super init])
    {
        // 随机颜色
        int randomRed = arc4random() % 256;
        int randomGreen = arc4random() % 256;
        int randomBlue = arc4random() % 256;
        self.backgroundColor = [UIColor colorWithRed:randomRed/255.0 green:randomGreen/255.0 blue:randomBlue/255.0 alpha:1.0];
        
        // 计算弹幕文字实际宽度
        NSDictionary *attr = @{
                               NSFontAttributeName:[UIFont systemFontOfSize:17.f]
                               };
        CGSize bulletTextSize = [comment sizeWithAttributes:attr];
        
        CGFloat iconWH = bulletTextSize.height + kBulletLabelPadding;
        
        self.bounds = CGRectMake(0, 0, bulletTextSize.width + 2*kBulletLabelPadding + iconWH, bulletTextSize.height + kBulletLabelPadding);
        self.layer.cornerRadius = iconWH/2;
        
        self.lbCommentIcon.frame = CGRectMake(0, 0, iconWH, iconWH);
        self.lbCommentIcon.layer.cornerRadius = iconWH/2;
        self.layer.masksToBounds = YES;
        
        self.lbCommentLabel.text = comment;
        self.lbCommentLabel.frame = CGRectMake(iconWH + kBulletLabelPadding, kBulletLabelPadding/2, bulletTextSize.width, bulletTextSize.height);
    }
    return self;
}

/**
 开始动画
 */
- (void)mr_startAnimation
{
    // 根据弹幕长度执行动画效果
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat duration = 2.5f;
    CGFloat wholeWidth = screenWidth + CGRectGetWidth(self.bounds) + 50;
    
    // 弹幕开始
    if(self.moveStatusBlock)
    {
        self.moveStatusBlock(Start);
    }
    
    // 根据 v = s/t, 时间固定, 计算速度, 弹幕越长速度越快
    CGFloat speed = wholeWidth/duration;
    
    // 计算完全进入屏幕的时间
    CGFloat enterDuration = (CGRectGetWidth(self.bounds) + 50)/speed;
    
    // 计算完全退出屏幕的时间
    CGFloat exitDuration = wholeWidth/speed;
    
    [self performSelector:@selector(bulletEnterScrren) withObject:nil afterDelay:enterDuration];
    
    // 根据动画改变自身的frame 坐标
    __block CGRect frame = self.frame;
    [UIView animateWithDuration:exitDuration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        frame.origin.x -= wholeWidth;
        self.frame = frame;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        
        // 调用回调告诉外部状态，方便做下一步处理
        if(self.moveStatusBlock)
        {
            self.moveStatusBlock(Exit);
        }
    }];
}

/**
 结束动画
 */
- (void)mr_stopAnimation
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [self.layer removeAllAnimations];
    [self removeFromSuperview];
}

/**
 弹幕完全进入屏幕
 */
- (void)bulletEnterScrren
{
    if(self.moveStatusBlock)
    {
        self.moveStatusBlock(Enter);
    }
}

#pragma lazy-load

- (UILabel *)lbCommentLabel
{
    if(!_lbCommentLabel)
    {
        _lbCommentLabel = [[    UILabel alloc] initWithFrame:CGRectZero];
        _lbCommentLabel.font = [UIFont systemFontOfSize:17.f];
        _lbCommentLabel.textColor = [UIColor whiteColor];
        _lbCommentLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_lbCommentLabel];
    }
    return _lbCommentLabel;
}

- (UIImageView *)lbCommentIcon
{
    if(!_lbCommentIcon)
    {
        _lbCommentIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bullet_default.jpg"]];
        _lbCommentIcon.layer.masksToBounds = YES;
        [self addSubview:_lbCommentIcon];
    }
    return _lbCommentIcon;
}

@end
