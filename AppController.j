/*
 * AppController.j
 * cappex
 *
 * Created by Patrick Logan on August 27, 2011.
 * Copyright 2011, Patrick Logan All rights reserved.
 */

@import <Foundation/CPObject.j>


@implementation GreenViewController : CPObject
{
}

- (id)initWithView:(CPView)aView
{
  self = [self init];
  if (self) {
    [aView setBackgroundColor: [CPColor greenColor]];
  }
  return self;
}

@end

@implementation PurpleViewController : CPObject
{
}

- (id)initWithView:(CPView)aView
{
  self = [self init];
  if (self) {
    [aView setBackgroundColor: [CPColor purpleColor]];
  }
  return self;
}

@end

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

    var rightView = [[CPView alloc] initWithFrame: CGRectMake(width - 300, 0, 300, height)];
    [rightView setAutoresizingMask: CPViewHeightSizable | CPViewMinXMargin];
    [rightView setBackgroundColor: [CPColor yellowColor]];

    [self addSubviewsToView: rightView];

    [contentView addSubview: rightView];

    [theWindow orderFront:self];

    // Uncomment the following line to turn on the standard menu bar.
    //[CPMenu setMenuBarVisible:YES];
}

- (void)addSubviewsToView:(CPView)aView
{
  var bounds = [aView bounds];
  var width = CGRectGetWidth(bounds);
  var height = CGRectGetHeight(bounds);

  var topView = [[CPView alloc] initWithFrame: CGRectMake(0, 0, width, 200)];
  [topView setAutoresizingMask: CPViewWidthSizable | CPViewMaxYMargin];
  var topController = [[GreenViewController alloc] initWithView: topView];

  [aView addSubview: topView];

  var bottomView = [[CPView alloc] initWithFrame: CGRectMake(0, 200, width, height - 200)];
  [bottomView setAutoresizingMask: CPViewWidthSizable | CPViewHeightSizable];
  var bottomController = [[PurpleViewController alloc] initWithView: bottomView];

  [aView addSubview: bottomView];
}

@end
