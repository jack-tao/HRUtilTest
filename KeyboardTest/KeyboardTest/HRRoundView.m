//
//  KLRoundView.m
//  keluapp
//
//  Created by ZhangHeng on 15/1/14.
//  Copyright (c) 2015年 HuiYan. All rights reserved.
//

#import "HRRoundView.h"

@implementation HRRoundView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)setRoundType:(HRRoundType)roundType{
    _roundType = roundType;
    
    self.layer.mask = nil;
    UIRectCorner   corners;
    switch (roundType) {
        case HRRoundTypeLeft:
            corners = UIRectCornerBottomLeft | UIRectCornerTopLeft;
            break;
        case HRRoundTypeRight:
            corners = UIRectCornerBottomRight | UIRectCornerTopRight;
            break;
        case HRRoundTypeBottom:
            corners = UIRectCornerBottomLeft | UIRectCornerBottomRight;
            break;
        case HRRoundTypeTop:
            corners = UIRectCornerTopRight | UIRectCornerTopLeft;
            break;
        case HRRoundTypeNone:
            corners = UIRectCornerBottomLeft & UIRectCornerBottomRight;
            break;
        case HRRoundTypeAll:
            corners = UIRectCornerAllCorners;
            break;
            
        default:
            break;
    }
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:corners
                                                         cornerRadii:CGSizeMake(10.0, 10.0)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame         = self.bounds;
    maskLayer.path          = maskPath.CGPath;
    self.layer.mask         = maskLayer;
}
@end
