//
//  UIView+Border.m
//  HotelsDotCom
//
//  Created by Nuzhat Zari on 23/12/20.
//  Copyright © 2020 Nuzhat Zari. All rights reserved.
//

#import "UIView+Border.h"

IB_DESIGNABLE
@implementation UIView (Border)

@dynamic borderWidth;
@dynamic borderColor;
@dynamic cornerRadius;

- (void) setBorderWidth: (CGFloat)newValue
{
    self.layer.borderWidth = newValue;
}

- (void) setBorderColor: (UIColor *) newValue
{
    self.layer.borderColor = newValue.CGColor;
}

- (void) setCornerRadius: (CGFloat) newValue
{
    self.layer.cornerRadius = newValue;
}


@end
