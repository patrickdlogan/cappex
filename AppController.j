/*
 * AppController.j
 * cappex
 *
 * Created by Patrick Logan on August 27, 2011.
 * Copyright 2011, Patrick Logan All rights reserved.
 */

@import <Foundation/CPObject.j>


@implementation AppController : CPObject
{
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask],
        contentView = [theWindow contentView];

    var bounds = [contentView bounds];
    var width = CGRectGetWidth(bounds);
    var height = CGRectGetHeight(bounds);

    var leftView = [[CPView alloc] initWithFrame: CGRectMake(0, 0, width - 300, height)];
    [leftView setAutoresizingMask: CPViewHeightSizable | CPViewWidthSizable];
    [leftView setBackgroundColor: [CPColor blueColor]];

    [contentView addSubview: leftView];

    [theWindow orderFront:self];

    // Uncomment the following line to turn on the standard menu bar.
    //[CPMenu setMenuBarVisible:YES];
}

@end
