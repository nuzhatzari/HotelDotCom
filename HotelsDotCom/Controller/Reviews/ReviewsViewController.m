//
//  ReviewsViewController.m
//  HotelsDotCom
//
//  Created by Nuzhat Zari on 23/12/20.
//  Copyright © 2020 Nuzhat Zari. All rights reserved.
//

#import "ReviewsViewController.h"
#import "CustomViews.h"
#import "ReviewTableViewCell.h"
#import "ReviewModelView.h"

@interface ReviewsViewController ()
@property (nonatomic, strong) ReviewModelView *reviewModelView;

@end

@implementation ReviewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 300;
    self.reviews = [[NSMutableArray alloc] init];
    self.reviewModelView = [[ReviewModelView alloc] init];
    [self fetchReviews];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//MARK: - TableView DataSource & Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_reviews count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"ReviewCell";

    ReviewTableViewCell *cell = (ReviewTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];

    Review *review = [_reviews objectAtIndex:indexPath.row];
    cell.title.text = review.title;
    cell.summary.text = review.summary;
    cell.recommendedBy.text = review.recommendedBy;
    cell.postedOn.text = [self.reviewModelView formattedPostedDate:review.postedOn];
    cell.ratingView.rating = [review.rating doubleValue];
    return cell;
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

//MARK: - MISC
-(void)fetchReviews {
    
    [self showLoading];
    
    __weak ReviewsViewController *weakSelf = self;
    [self.reviewModelView fetchReviews:_hotel.destinationId andCompletionBlock:^(NSArray<Review *> * _Nonnull reviewArray, NSString * _Nonnull error) {
        [weakSelf hideLoading];

        if (reviewArray != nil) {
            weakSelf.reviews = [NSMutableArray arrayWithArray:reviewArray];
        } else if (error != nil) {
            [weakSelf.reviews removeAllObjects];
            [CustomViews showAlertWithTitle:@"Error!" message:error andViewController:self];
        } else {
            [weakSelf.reviews removeAllObjects];
            [CustomViews showAlertWithTitle:@"Error!" message:@"Something went wrong, please try again later." andViewController:self];
            
        }
        [weakSelf.tableView reloadData];
    }];
}

@end
