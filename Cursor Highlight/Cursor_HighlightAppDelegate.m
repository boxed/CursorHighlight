//
//  Cursor_HighlightAppDelegate.m
//  Cursor Highlight
//
//  Created by Anders Hovmöller on 2011-09-27.
//  Copyright 2011 TriOptima AB. All rights reserved.
//

#import "Cursor_HighlightAppDelegate.h"

@implementation Cursor_HighlightAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(timer:) userInfo:nil repeats:YES];
    [self.window setIsVisible:TRUE];
    [self.window setLevel:1000];
    [self.window setOpaque:NO];
    [self.window setBackgroundColor:[NSColor clearColor]];
    [self.window setAlphaValue:0.2];
}

- (void)timer:(id)sender
{
    NSPoint p = [NSEvent mouseLocation];
    p.x -= 25;
    p.y += 25;
    [self.window setFrameTopLeftPoint:p];
}

@end
