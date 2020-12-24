//
//  FetchHotelData.h
//  HotelsDotCom
//
//  Created by Nuzhat Zari on 22/12/20.
//  Copyright © 2020 Nuzhat Zari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hotel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FetchHotelData : NSObject

-(void)fetchHotelsWithSearchText:(NSString *)searchText andCompletionBlock: (void(^)(NSArray<Hotel*> *hotelArray, NSString *error)) completionBlock;

@end

NS_ASSUME_NONNULL_END
