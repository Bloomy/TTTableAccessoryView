//
//  TTTableAccessoryView
//
//  Created by Orlando Aleman Ortiz on 06/03/13.
//  Copyright (c) 2013 orlandoaleman.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTTableAccessoryView : UIControl

+ (TTTableAccessoryView *)accessoryWithColor:(UIColor *)color type:(UITableViewCellAccessoryType)type;

@property (nonatomic, strong) UIColor *accessoryColor;
@property (nonatomic, strong) UIColor *highlightedColor;
@property (nonatomic, assign) UITableViewCellAccessoryType type;
@end
