//
//  Request.h
//  HotelsDotCom
//
//  Created by Nuzhat Zari on 22/12/20.
//  Copyright © 2020 Nuzhat Zari. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Request : NSObject

@property (assign) NSString *method;
@property (assign) NSString *route;

-(Request *)initWithRoute: (NSString *)route andMethod: (NSString *)method;
@end

NS_ASSUME_NONNULL_END
