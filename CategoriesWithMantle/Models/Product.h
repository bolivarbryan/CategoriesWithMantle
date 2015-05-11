//
//  Product.h
//  CategoriesWithMantle
//
//  Created by Bryan Bolivar Martinez on 5/4/15.
//  Copyright (c) 2015 Bryan Bolivar Martinez. All rights reserved.
//
#import <Mantle/Mantle.h>
typedef NS_ENUM(NSInteger, RefinementType)
{
    refinementTypeDimension,
    refinementTypeDimensionValue
};
@interface Product : MTLModel <MTLJSONSerializing>
@property (nonatomic, assign) NSInteger categoryID;
@property (nonatomic, copy) NSString *categoryName;
@property (nonatomic, assign) RefinementType refinementType;
@property (nonatomic, strong) NSArray * subcategories;
@end
