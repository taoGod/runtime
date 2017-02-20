//
//  HomeTableViewController.m
//  Rumtime-MessageForwarding
//
//  Created by juliu on 17/2/18.
//  Copyright © 2017年 juliu. All rights reserved.
//

#import "HomeTableViewController.h"
#import "ViewController.h"
#import "MetaClassController.h"

@interface HomeTableViewController ()

@end

@implementation HomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    UIViewController *vc = nil;
    switch (row) {
        case 0:
            vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ViewController"];
            break;
        case 1:
            vc = [[MetaClassController alloc] init];
            break;
        default:
            break;
    }
    if (vc) {
        [self.navigationController pushViewController:vc animated:YES];
    }
}



@end
