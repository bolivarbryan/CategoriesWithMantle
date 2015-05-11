//
//  SubcategoryViewController.m
//  CategoriesWithMantle
//
//  Created by Bryan Bolivar Martinez on 5/4/15.
//  Copyright (c) 2015 Bryan Bolivar Martinez. All rights reserved.
//

#import "SubcategoryViewController.h"

@interface SubcategoryViewController ()

@end

@implementation SubcategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", self.product);
    self.title = self.product.categoryName;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
