#import "Cursor_HighlightAppDelegate.h"

@implementation Cursor_HighlightAppDelegate

@synthesize window;

const float defaultAlpha = 0.2;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [NSTimer scheduledTimerWithTimeInterval:0.01 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSPoint p = [NSEvent mouseLocation];
        p.x -= 25;
        p.y += 25;
        [self.window setFrameTopLeftPoint:p];
    }];
    
    [self.window setIsVisible: TRUE];
    [self.window setLevel: 1000];
    [self.window setOpaque: NO];
    [self.window setBackgroundColor: [NSColor clearColor]];
    [self.window setAlphaValue: defaultAlpha];

    [NSEvent addGlobalMonitorForEventsMatchingMask:NSEventMaskLeftMouseDown
                                           handler:^(NSEvent * _Nonnull event) {
        [self.window setAlphaValue:1.0];
    }];

    [NSEvent addGlobalMonitorForEventsMatchingMask:NSEventMaskLeftMouseUp
                                           handler:^(NSEvent * _Nonnull event) {
        [self.window.animator setAlphaValue:defaultAlpha];
    }];
}

@end
