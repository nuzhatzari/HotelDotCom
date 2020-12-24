//
//  ReviewModelView.h
//  HotelsDotCom
//
//  Created by Nuzhat Zari on 24/12/20.
//  Copyright © 2020 Nuzhat Zari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Review.h"

NS_ASSUME_NONNULL_BEGIN

@interface ReviewModelView : NSObject

-(void)fetchReviews:(NSString *)hotelId andCompletionBlock:(void(^)(NSArray<Review*> *reviewArray, NSString *error)) completionBlock;
-(NSString *)formattedPostedDate:(NSString *)value;

@end

NS_ASSUME_NONNULL_END
