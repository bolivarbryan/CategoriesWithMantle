//
//  Product.m
//  CategoriesWithMantle
//
//  Created by Bryan Bolivar Martinez on 5/4/15.
//  Copyright (c) 2015 Bryan Bolivar Martinez. All rights reserved.
//

#import "Product.h"

@implementation Product
+(NSDictionary *) JSONKeyPathsByPropertyKey{
    return @{@"categoryID": @"categoryID",
             @"categoryName": @"categoryName",
             @"refinementType": @"refinementType",
             @"subcategories": @"subcategories"
             };
}
+(NSValueTransformer *) RefinementTypeJSONTransformer{
    return [NSValueTransformer mtl_valueMappingTransformerWithDictionary:
            @{
              @"dimension": @(refinementTypeDimension),
              @"dimensionValue": @(refinementTypeDimensionValue)
              }];
}

@end
