//
//  FetchHotelReviews.m
//  HotelsDotCom
//
//  Created by Nuzhat Zari on 23/12/20.
//  Copyright © 2020 Nuzhat Zari. All rights reserved.
//

#import "FetchHotelReviews.h"
#import "NetworkManager.h"
#import "Request.h"

@implementation FetchHotelReviews

-(void)fetchHotelReviewsForId:(NSString *)hotelId andCompletionBlock: (void(^)(NSArray<Review*> *reviewArray, NSString *error)) completionBlock {
    
    Request *request = [[Request alloc] initWithRoute:[NSString stringWithFormat:@"mobile_service/property-content/v1/hotels.com/property/%@/reviews?loc=en_US", hotelId] andMethod:@"GET"];
    
    [[NetworkManager sharedInstance] fetchDataWithRequest:request andCompletionBlock:^(NSDictionary * _Nonnull reviewData, NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (reviewData != nil) {
                NSDictionary *parsedData = [self parseData:reviewData];
                completionBlock([parsedData objectForKey:@"reviews"], [parsedData objectForKey:@"error"]);
            }else {
                completionBlock(nil, @"Unexpected error occurred, please try again later.");

            }
            
        });
    }];
}

-(NSDictionary *)parseData:(NSDictionary *)data {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    
    if ([data objectForKey:@"result"] != nil && [[data objectForKey:@"result"] isEqual:@"OK"]) {
        NSArray<Review*> *reviews = [[NSArray alloc] init];
            
        NSArray *guestReviews = [[[data objectForKey:@"reviewData"] objectForKey:@"guestReviewGroups"] objectForKey:@"guestReviews"];
        if (guestReviews != nil && guestReviews.count > 0) {
            for (NSDictionary *guestReview in guestReviews) {
             
               NSArray *reviewData = [guestReview objectForKey:@"reviews"];
                
                for (NSDictionary *entity in reviewData) {
                    Review *review = [[Review alloc] init];
                    review.title = [entity valueForKey:@"title"];
                    review.summary = [entity valueForKey:@"summary"];
                    review.rating = [entity valueForKey:@"rating"];
                    review.formattedRating = [entity valueForKey:@"formattedRating"];;
                    review.recommendedBy = [entity valueForKey:@"recommendedBy"];;
                    review.qualitativeBadgeText = [entity valueForKey:@"qualitativeBadgeText"];;
                    review.postedOn = [entity valueForKey:@"postedOn"];
                    reviews = [reviews arrayByAddingObject:review];
                }
            }
             
        }
        dict[@"reviews"] = reviews;
        
    } else if ([data objectForKey:@"message"] != nil){
        dict[@"error"] = [data objectForKey:@"message"];
    } else {
        dict[@"error"] = @"Unexpected error occurred, please try again later.";
    }
    return dict;
}

@end
