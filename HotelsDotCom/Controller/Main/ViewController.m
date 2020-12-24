//
//  ViewController.m
//  HotelsDotCom
//
//  Created by Nuzhat Zari on 21/12/20.
//  Copyright © 2020 Nuzhat Zari. All rights reserved.
//

#import "ViewController.h"
#import "HotelTableViewCell.h"
#import "HotelsDotCom-Swift.h"
#import "CustomViews.h"
#import "ReviewsViewController.h"
#import "HotelViewModel.h"

@interface ViewController ()
@property (nonatomic, strong) HotelViewModel *hotelViewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.hotels = [[NSMutableArray alloc] init];
    self.hotelViewModel = [[HotelViewModel alloc] init];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqual:@"showReviews"]) {
        ReviewsViewController *reviewsViewController = (ReviewsViewController *)segue.destinationViewController;
        reviewsViewController.hotel = (Hotel *)sender;
    }
}

//MARK: - UIButton
-(IBAction)onSearchBtnClicked:(id)sender {
    
    [self.tfSearch resignFirstResponder];
    NSString *searchText = [_tfSearch text];
    
    if (searchText != nil && searchText.length > 0 ) {
        
        [self showLoading];
        
        __weak ViewController *weakSelf = self;
        [self.hotelViewModel fetchHotelsWithSearchText:searchText andCompletionBlock:^(NSArray<Hotel *> * _Nonnull hotelArray, NSString * _Nonnull error) {
            
            [weakSelf hideLoading];
            if (hotelArray != nil) {
                weakSelf.hotels = [NSMutableArray arrayWithArray:hotelArray];
            } else if (error != nil) {
                [weakSelf.hotels removeAllObjects];
                [CustomViews showAlertWithTitle:@"Error!" message:error andViewController:self];
            } else {
                [weakSelf.hotels removeAllObjects];
                [CustomViews showAlertWithTitle:@"Error!" message:@"Something went wrong, please try again later." andViewController:self];

            }
            [weakSelf.tableView reloadData];
        }];
        
    } else {
        [CustomViews showAlertWithTitle:@"Warning!" message:@"Please enter location to search." andViewController:self];
    }
    
}

//MARK: - TableView DataSource & Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_hotels count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"HotelCell";

    HotelTableViewCell *cell = (HotelTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];

    cell.title.text = [[_hotels objectAtIndex:indexPath.row] name];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"showReviews" sender:[self.hotels objectAtIndex:indexPath.row]];
    
}

//MARK: - TextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.tfSearch resignFirstResponder];
    return true;
}

//MARK: - Loader
-(void)showLoading{
    [self.view bringSubviewToFront:self.loadingView];
    [self.activityIndicator startAnimating];
}

-(void)hideLoading{
    [self.activityIndicator stopAnimating];
    [self.view sendSubviewToBack:self.loadingView];
}

@end
