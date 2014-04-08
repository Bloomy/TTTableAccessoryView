//
//  TTTableViewCell
//  closett
//
//  Created by Orlando Aleman Ortiz on 12/07/13.
//  Copyright (c) 2013 closett.com. All rights reserved.
//

#import "UITableViewCellWithColoredAccessory.h"
#import "TTTableAccessoryView.h"


@implementation UITableViewCellWithColoredAccessory

- (void)setAccessoryType:(UITableViewCellAccessoryType)accessoryType
{
    [super setAccessoryType:accessoryType];
    self.accessoryView = [TTTableAccessoryView accessoryWithColor:TABLEVIEWCELL_ACCESSORYCOLOR type:accessoryType];
}

@end
