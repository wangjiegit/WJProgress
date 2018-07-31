//
//  LZProgressView.m
//  LZLC
//
//  Created by 王杰 on 2018/7/9.
//  Copyright © 2018年 com.ystz.ysd. All rights reserved.
//

#import "WJProgressView.h"

@interface WJProgressView()

@property (nonatomic, strong) UIBezierPath *bezierPath;

@property (nonatomic, strong) CAShapeLayer *progressLayer;

@end

@implementation WJProgressView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.progressLayer = [CAShapeLayer layer];
        self.progressLayer.strokeStart = 0;
        self.progressLayer.strokeEnd = 0;
        self.progressLayer.lineCap = kCALineCapRound;
        [self.layer addSublayer:self.progressLayer];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.progressLayer.frame = self.bounds;
    self.progressLayer.path = self.bezierPath.CGPath;
}

- (UIBezierPath *)bezierPath {
    if (!_bezierPath) {
        _bezierPath = [UIBezierPath bezierPath];
        CGFloat point = self.progressLayer.lineWidth / 2.0;
        [_bezierPath moveToPoint:CGPointMake(point, point)];
        [_bezierPath addLineToPoint:CGPointMake(CGRectGetWidth(self.progressLayer.frame) - point, point)];
    }
    return _bezierPath;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    self.progressLayer.backgroundColor = backgroundColor.CGColor;
}

- (void)setProgress:(CGFloat)progress {
    if (_progress != progress) {
        _progress = progress;
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        self.progressLayer.strokeEnd = progress;
        [CATransaction commit];
    }
}

- (void)setProgressColor:(UIColor *)progressColor {
    if (_progressColor != progressColor) {
        _progressColor = progressColor;
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        self.progressLayer.strokeColor = progressColor.CGColor;
        [CATransaction commit];
    }
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.progressLayer.lineWidth = frame.size.height;
    self.progressLayer.cornerRadius = self.progressLayer.lineWidth/ 2.0;
}

@end
