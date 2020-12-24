//
//  NetworkManager.m
//  HotelsDotCom
//
//  Created by Nuzhat Zari on 22/12/20.
//  Copyright © 2020 Nuzhat Zari. All rights reserved.
//

#import "NetworkManager.h"

@implementation NetworkManager

+(NetworkManager *) sharedInstance
{
    static NetworkManager *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[NetworkManager alloc] init];
    });
    return _sharedInstance;
}

-(void)fetchDataWithRequest:(Request *)requestParameters andCompletionBlock: (void(^)(NSDictionary *hotelArray, NSError *error)) completionBlock {
    
    NSString *host = [[NSUserDefaults standardUserDefaults] objectForKey:@"Host"];
    NSString *apiKey = [[NSUserDefaults standardUserDefaults] objectForKey:@"APIKey"];

    NSDictionary *headers = @{
        @"x-rapidapi-key": apiKey,
        @"x-rapidapi-host": host };
    
    
    NSString *url = [NSString stringWithFormat:@"https://%@/%@", host, requestParameters.route];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:10.0];
    
    [request setHTTPMethod:requestParameters.method];
    [request setAllHTTPHeaderFields:headers];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"%@", error);
            completionBlock(nil, error);
        } else {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
            NSLog(@"%@", httpResponse);
            NSDictionary *dataDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            completionBlock(dataDict, nil);
        }
    }];
    [dataTask resume];
}
@end
