//
//  FetchHotelReviews.h
//  HotelsDotCom
//
//  Created by Nuzhat Zari on 23/12/20.
//  Copyright © 2020 Nuzhat Zari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Review.h"

NS_ASSUME_NONNULL_BEGIN

@interface FetchHotelReviews : NSObject

-(void)fetchHotelReviewsForId:(NSString *)hotelId andCompletionBlock: (void(^)(NSArray<Review*> *reviewArray, NSString *error)) completionBlock;

@end

NS_ASSUME_NONNULL_END
