//
//  ViewController.h
//  HotelsDotCom
//
//  Created by Nuzhat Zari on 21/12/20.
//  Copyright © 2020 Nuzhat Zari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Hotel.h"

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *tfSearch;
@property (weak, nonatomic) IBOutlet UIView *loadingView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (nonatomic, strong) NSMutableArray<Hotel*> *hotels;

@end

