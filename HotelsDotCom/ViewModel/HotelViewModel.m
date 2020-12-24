//
//  HotelViewModel.m
//  HotelsDotCom
//
//  Created by Nuzhat Zari on 24/12/20.
//  Copyright © 2020 Nuzhat Zari. All rights reserved.
//

#import "HotelViewModel.h"
#import "FetchHotelData.h"

@implementation HotelViewModel
-(void)fetchHotelsWithSearchText:(NSString *)searchText andCompletionBlock: (void(^)(NSArray<Hotel*> *hotelArray, NSString *error)) completionBlock {
    
    FetchHotelData *service = [[FetchHotelData alloc] init];
    [service fetchHotelsWithSearchText:searchText andCompletionBlock:^(NSArray<Hotel*> * _Nonnull hotelArray, NSString * _Nonnull error) {
        completionBlock(hotelArray, error);
        
    }];
}

@end
