//
//  ReviewTableViewCell.h
//  HotelsDotCom
//
//  Created by Nuzhat Zari on 23/12/20.
//  Copyright © 2020 Nuzhat Zari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotelsDotCom-Swift.h"
#import <Cosmos/Cosmos-Swift.h>

NS_ASSUME_NONNULL_BEGIN

@interface ReviewTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *summary;
@property (weak, nonatomic) IBOutlet UILabel *recommendedBy;
@property (weak, nonatomic) IBOutlet UILabel *postedOn;
@property (weak, nonatomic) IBOutlet CosmosView *ratingView;


@end

NS_ASSUME_NONNULL_END
