//
//  CategoriesTableViewController.m
//  CategoriesWithMantle
//
//  Created by Bryan Bolivar Martinez on 5/4/15.
//  Copyright (c) 2015 Bryan Bolivar Martinez. All rights reserved.
//

#import "CategoriesTableViewController.h"
#import <AFNetworking/AFNetworking.h>

@interface CategoriesTableViewController (){
    NSMutableArray * products;
}

@end

@implementation CategoriesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.selectedProduct !=  Nil){
        self.title = self.selectedProduct.categoryName;
        products = [NSMutableArray arrayWithArray:self.selectedProduct.subcategories];
    }else{
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager GET:@"http://www.kbapi.co/g/TaOuEQl2.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSArray * productsJSON = [[responseObject objectForKey:@"data"] objectForKey: @"Category"];
            [self parseProductsJSONArray:productsJSON];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
        }];
    }
    
}

-(void)parseProductsJSONArray:(NSArray *)productsJSON{
    products = [NSMutableArray array];
    for (NSDictionary *productJSON in productsJSON) {
        NSError *error;
        Product *product = [MTLJSONAdapter modelOfClass:[Product class] fromJSONDictionary:productJSON error:&error];
        if (product) {
            NSLog(@"product: %@", product);
            [products addObject:productJSON];
        }else{
            NSLog(@"ERROR: %@", error);
        }
        
    }
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return products.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Product * product = [[Product alloc] init];
    product.categoryName = [[products objectAtIndex:indexPath.row] objectForKey:@"categoryName"];
    product.subcategories = [[products objectAtIndex:indexPath.row] objectForKey:@"subcategories"];
    NSLog(@"%@",product);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    cell.textLabel.text = product.categoryName;

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.selectedProduct = [[Product alloc] init];
    self.selectedProduct.categoryName = [[products objectAtIndex:indexPath.row] objectForKey:@"categoryName"];
    self.selectedProduct.subcategories = [[products objectAtIndex:indexPath.row] objectForKey:@"subcategories"];
    [self performSegueWithIdentifier:@"productDetailsSegue" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"productDetailsSegue" ]) {
        [[segue destinationViewController] setSelectedProduct:self.selectedProduct];
    }

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
