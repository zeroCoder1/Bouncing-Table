//
//  ViewController.m
//  BouncyTable
//
//  Created by Shrutesh Sharma on 30/09/13.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

 
    self.aArray = [[NSMutableArray alloc]init];
    
    float INCREMENT = 0.01;
    for (float hue = 0.5; hue < 1.0; hue += INCREMENT) {
        UIColor *color = [UIColor colorWithHue:hue
                                    saturation:1.0
                                    brightness:1.0
                                         alpha:1.0];
        [self.aArray addObject:color];
    
    }
    NSLog(@"self array count %d",[self.aArray count]);

    
    [self.aTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];

}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.aArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    
//    double numSections = [self numberOfSectionsInTableView:tableView];
//    double numRows = [self tableView:tableView numberOfRowsInSection:indexPath.section];
//    [cell setBackgroundColor:[UIColor colorWithRed:0.8/numRows*((double)indexPath.row)+0.2 green:0.8/numSections*((double)indexPath.section)+0.2 blue:((double)(random()%1000))/1000.0 alpha:1]];

    

    cell.backgroundColor = [self.aArray objectAtIndex:indexPath.row];
    
    return cell;
}


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_direction==1) {
        
        cell.frame = CGRectMake(0,cell.frame.origin.y+55 , 1024, 50);
        
        
        [UIView animateWithDuration:2
                              delay:0
             usingSpringWithDamping:10.0
              initialSpringVelocity:25.5
                            options:UIViewAnimationOptionAllowUserInteraction
                         animations:^{
                             
                             cell.frame = CGRectMake(0,cell.frame.origin.y-55 , 1024, 50);

                             
                         }
                         completion:^(BOOL finished) {
                             
                             
                             
                         }];
    }
    else{
        
        cell.frame = CGRectMake(0,cell.frame.origin.y-55 , 1024, 50);
        
        
        [UIView animateWithDuration:2
                              delay:0
             usingSpringWithDamping:10.0
              initialSpringVelocity:25.5
                            options:UIViewAnimationOptionAllowUserInteraction
                         animations:^{
                             cell.frame = CGRectMake(0,cell.frame.origin.y+55, 1024, 50);
                             cell.autoresizingMask = UIViewAutoresizingFlexibleWidth;

                         }
                         completion:^(BOOL finished) {
                             
                         }];
    }
    

}




- (void) scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
    CGPoint currentOffset = scrollView.contentOffset;
    if (currentOffset.y > self.lastContentOffset.y)
    {
        // Upward
        
        _direction =1;
    }
    else
    {
        // Downward
        
        _direction =0;
    }
    self.lastContentOffset = currentOffset;
    
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
