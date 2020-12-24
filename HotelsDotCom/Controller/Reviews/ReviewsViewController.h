//
//  ReviewsViewController.h
//  HotelsDotCom
//
//  Created by Nuzhat Zari on 23/12/20.
//  Copyright © 2020 Nuzhat Zari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Hotel.h"
#import "Review.h"

NS_ASSUME_NONNULL_BEGIN

@interface ReviewsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *loadingView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (nonatomic, strong) Hotel *hotel;
@property (nonatomic, strong) NSMutableArray<Review*> *reviews;
@end

NS_ASSUME_NONNULL_END
