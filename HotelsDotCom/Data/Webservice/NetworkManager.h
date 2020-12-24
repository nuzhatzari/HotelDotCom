//
//  NetworkManager.h
//  HotelsDotCom
//
//  Created by Nuzhat Zari on 22/12/20.
//  Copyright © 2020 Nuzhat Zari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Request.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetworkManager : NSObject

+(NetworkManager *)sharedInstance;
-(void)fetchDataWithRequest:(Request *)request andCompletionBlock: (void(^)(NSDictionary *hotelArray, NSError *error)) completionBlock;

@end

NS_ASSUME_NONNULL_END
