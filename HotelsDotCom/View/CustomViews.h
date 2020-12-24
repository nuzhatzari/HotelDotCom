//
//  CustomViews.h
//  HotelsDotCom
//
//  Created by Nuzhat Zari on 22/12/20.
//  Copyright © 2020 Nuzhat Zari. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomViews : NSObject
+(void)showAlertWithTitle:(NSString*)title message:(NSString *)message andViewController: (UIViewController *)viewController;
@end

NS_ASSUME_NONNULL_END
