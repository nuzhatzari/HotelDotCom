//
//  Review.h
//  HotelsDotCom
//
//  Created by Nuzhat Zari on 23/12/20.
//  Copyright © 2020 Nuzhat Zari. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Review : NSObject
@property(nonatomic, strong)NSString *title;
@property(nonatomic, strong)NSString *summary;
@property(nonatomic, strong)NSString *rating;
@property(nonatomic, strong)NSString *formattedRating;
@property(nonatomic, strong)NSString *recommendedBy;
@property(nonatomic, strong)NSString *postedOn;
@property(nonatomic, strong)NSString *qualitativeBadgeText;

@end

NS_ASSUME_NONNULL_END
