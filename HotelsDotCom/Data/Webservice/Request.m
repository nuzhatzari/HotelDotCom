//
//  Request.m
//  HotelsDotCom
//
//  Created by Nuzhat Zari on 22/12/20.
//  Copyright © 2020 Nuzhat Zari. All rights reserved.
//

#import "Request.h"

@implementation Request

-(Request *)initWithRoute: (NSString *)route andMethod: (NSString *)method {
    
    self.route = route;
    self.method = method;
    return self;
}
@end
