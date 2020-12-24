//
//  UIView+Border.h
//  HotelsDotCom
//
//  Created by Nuzhat Zari on 23/12/20.
//  Copyright © 2020 Nuzhat Zari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Border)

@property (nonatomic) IBInspectable CGFloat borderWidth;
@property (nonatomic) IBInspectable UIColor *borderColor;
@property (nonatomic) IBInspectable CGFloat cornerRadius;

@end

NS_ASSUME_NONNULL_END
