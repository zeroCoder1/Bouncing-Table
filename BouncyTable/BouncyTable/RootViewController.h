//
//  ViewController.h
//  BouncyTable
//
//  Created by Shrutesh Sharma on 30/09/13.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *aTableView;
@property (strong, nonatomic) NSMutableArray * aArray;


@property (nonatomic) int direction;
@property (assign, nonatomic) CGPoint lastContentOffset;


@end
