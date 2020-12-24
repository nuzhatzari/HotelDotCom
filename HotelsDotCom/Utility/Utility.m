//
//  Utility.m
//  HotelsDotCom
//
//  Created by Nuzhat Zari on 24/12/20.
//  Copyright © 2020 Nuzhat Zari. All rights reserved.
//

#import "Utility.h"

@implementation Utility

+(nullable id)valueForKeyFromInfoPlist:(NSString *)key {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:key];
}
@end
