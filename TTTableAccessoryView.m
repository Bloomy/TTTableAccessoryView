//
//  TTTableAccessoryView
//
//  Created by Orlando Aleman Ortiz on 06/03/13.
//  Copyright (c) 2013 orlandoaleman.com. All rights reserved.
//

#import "TTTableAccessoryView.h"


@implementation TTTableAccessoryView


+ (TTTableAccessoryView *)accessoryWithColor:(UIColor *)color type:(UITableViewCellAccessoryType)type
{
	TTTableAccessoryView *view = [[TTTableAccessoryView alloc] initWithFrame:CGRectMake(0, 0, 15.0, 15.0)];
	view.accessoryColor = color;
    view.type = type;
	return view;
}


- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
		self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    switch (self.type) {
        case UITableViewCellAccessoryCheckmark:
            [self drawCheckmark:rect];
            break;

        default:
            [self drawDisclosure:rect];
            break;
    }
}


- (void)drawDisclosure:(CGRect)rect
{
    // (x,y) is the tip of the arrow
    CGFloat x = CGRectGetMaxX(self.bounds)-3.0;
    CGFloat y = CGRectGetMidY(self.bounds);
    
    const CGFloat R = 4.5;
    CGContextRef ctxt = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(ctxt, x-R, y-R);
    CGContextAddLineToPoint(ctxt, x, y);
    CGContextAddLineToPoint(ctxt, x-R, y+R);
    CGContextSetLineCap(ctxt, kCGLineCapSquare);
    CGContextSetLineJoin(ctxt, kCGLineJoinMiter);
    CGContextSetLineWidth(ctxt, 3);

    if (self.highlighted) {
        [self.highlightedColor setStroke];
    }
    else {
        [self.accessoryColor setStroke];
    }
    CGContextStrokePath(ctxt);
}


- (void)drawCheckmark:(CGRect)rect
{
    // (x,y) is the tip of the arrow
    CGFloat x = CGRectGetMaxX(self.bounds)-3.0;
    CGFloat y = 3;
    const CGFloat R = 3.5;
    
    CGContextRef ctxt = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(ctxt, x, y);
    CGContextAddLineToPoint(ctxt, x-1.8*R, y+3*R);
    CGContextAddLineToPoint(ctxt, x-2.7*R, y+2*R);
    CGContextSetLineCap(ctxt, kCGLineCapRound);
    CGContextSetLineJoin(ctxt, kCGLineJoinRound);
    CGContextSetLineWidth(ctxt, 3);

    if (self.highlighted) {
        [self.highlightedColor setStroke];
    }
    else {
        [self.accessoryColor setStroke];
    }
    CGContextStrokePath(ctxt);
}


- (void)setHighlighted:(BOOL)highlighted
{
	[super setHighlighted:highlighted];
	[self setNeedsDisplay];
}


- (UIColor *)accessoryColor
{
	if (!_accessoryColor)
        return [UIColor blackColor];
	return _accessoryColor;
}


- (UIColor *)highlightedColor
{
	if (!_highlightedColor)
        return [UIColor whiteColor];
	return _highlightedColor;
}

@end