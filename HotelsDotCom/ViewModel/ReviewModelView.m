//
//  ReviewModelView.m
//  HotelsDotCom
//
//  Created by Nuzhat Zari on 24/12/20.
//  Copyright © 2020 Nuzhat Zari. All rights reserved.
//

#import "ReviewModelView.h"
#import "FetchHotelReviews.h"

@implementation ReviewModelView
    
-(void)fetchReviews:(NSString *)hotelId andCompletionBlock:(void(^)(NSArray<Review*> *reviewArray, NSString *error)) completionBlock {

    FetchHotelReviews *service = [[FetchHotelReviews alloc] init];
    [service fetchHotelReviewsForId:hotelId andCompletionBlock:^(NSArray<Review*> * _Nonnull reviewArray, NSString * _Nonnull error) {
        completionBlock(reviewArray, error);
    }];
    
}

-(NSString *)formattedPostedDate:(NSString *)value {
    NSDate *date = [[NSDate alloc] initWithTimeIntervalSinceNow:([value doubleValue]/100000)];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MMM-yyyy"];
    NSString *formattedDateString = [dateFormatter stringFromDate:date];
    return formattedDateString;
}

@end
