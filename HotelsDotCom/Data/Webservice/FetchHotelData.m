//
//  FetchHotelData.m
//  HotelsDotCom
//
//  Created by Nuzhat Zari on 22/12/20.
//  Copyright © 2020 Nuzhat Zari. All rights reserved.
//

#import "FetchHotelData.h"
#import "NetworkManager.h"
#import "Request.h"

@implementation FetchHotelData

-(void)fetchHotelsWithSearchText:(NSString *)searchText andCompletionBlock: (void(^)(NSArray<Hotel*> *hotelArray, NSString *error)) completionBlock {
    
    Request *request = [[Request alloc] initWithRoute:[NSString stringWithFormat:@"suggest/v1.7/json?query=%@&locale=en_US", [searchText stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLUserAllowedCharacterSet]]] andMethod:@"GET"];
    
    [[NetworkManager sharedInstance] fetchDataWithRequest:request andCompletionBlock:^(NSDictionary * _Nonnull hotelData, NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (hotelData != nil) {
                NSDictionary *parsedData = [self parseData:hotelData];
                completionBlock([parsedData objectForKey:@"hotels"], [parsedData objectForKey:@"error"]);
            }else {
                completionBlock(nil, @"Unexpected error occurred, please try again later.");

            }
            
        });
    }];
}

-(NSDictionary *)parseData:(NSDictionary *)data {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    
    if ([data objectForKey:@"suggestions"] != nil) {
        NSArray<Hotel*> *hotels = [[NSArray alloc] init];
        
        for (NSDictionary *suggestion in [data objectForKey:@"suggestions"]) {
            if ([[suggestion objectForKey:@"group"]  isEqual: @"HOTEL_GROUP"]) {
                if ([suggestion objectForKey:@"entities"] != nil) {
                    for (NSDictionary *entity in [suggestion objectForKey:@"entities"]) {
                        Hotel *hotel = [[Hotel alloc] init];
                        hotel.name = [entity valueForKey:@"name"];
                        hotel.destinationId = [entity valueForKey:@"destinationId"];
                        hotels = [hotels arrayByAddingObject:hotel];
                    }
                }
            }
        }
        dict[@"hotels"] = hotels;
        
    } else if ([data objectForKey:@"message"] != nil){
        dict[@"error"] = [data objectForKey:@"message"];
    } else {
        dict[@"error"] = @"Unexpected error occurred, please try again later.";
    }
    return dict;
}

@end
