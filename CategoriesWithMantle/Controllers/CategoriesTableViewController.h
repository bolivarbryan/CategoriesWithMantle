//
//  CategoriesTableViewController.h
//  CategoriesWithMantle
//
//  Created by Bryan Bolivar Martinez on 5/4/15.
//  Copyright (c) 2015 Bryan Bolivar Martinez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

@interface CategoriesTableViewController : UITableViewController
@property (nonatomic, strong) Product * selectedProduct;
@end
