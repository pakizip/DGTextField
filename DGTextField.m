//
//  DGTextField.m
//  Ogonium
//
//  Created by Goldberg, Dov on 1/17/13.
//  Copyright (c) 2013 Ogonium. All rights reserved.
//

#import "DGTextField.h"

@interface CGTextField (Private)
- (void)setup:(CGRect)frame;
@end

@implementation CGTextField

-(id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup:frame];
    }
    return self;
}

- (void) setCursorColor:(UIColor *)cursorColor {
    cursor_.backgroundColor = cursorColor;
}

- (UIColor *) cursorColor {
    return cursor_.backgroundColor;
}

////////////////////////////////////////////////////
// Private Implementation
////////////////////////////////////////////////////

- (void)setup:(CGRect)frame {
    // init here
    // Set up cursor
    cursor_ = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 3.0f, frame.size.height)];
    [self addSubview:cursor_];
    [cursor_ setBackgroundColor:[UIColor whiteColor]];
    cursor_.hidden = NO;
    cursor_.alpha = 0.0f;
    
    [UIView animateWithDuration:0.5f
                          delay:0.5f
                        options:(UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse)
                     animations:^{
                                    cursor_.alpha = 1.0f;
                                }
                     completion:^(BOOL finished){}];
}

////////////////////////////////////////////////////
// Base Class Overrides
////////////////////////////////////////////////////

- (CGRect)textRectForBounds:(CGRect)bounds {
    // Hides Cursor when not editing
    cursor_.hidden = YES;
    return [super textRectForBounds:bounds];
}

// This overrides the default editing rect for UITextField.
- (CGRect)editingRectForBounds:(CGRect)bounds {
    
    UITextRange *range = [self selectedTextRange];
    
    // Shows then cursor in editing mode but only if no text is selected.  If text is selected then the default handles are shown.
    cursor_.hidden = !range.empty;
    
    CGRect rect = [self caretRectForPosition:range.start];
    rect.origin.x = ([self caretRectForPosition:range.start]).origin.x;
    rect.size.width = 3.0f;
    cursor_.frame = rect;
    
    return [super editingRectForBounds:bounds];
}

- (CGRect)caretRectForPosition:(UITextPosition *)position
{
    CGRect rect = [super caretRectForPosition:position];
    rect.size.width = 0.0f;
    return rect;
}

@end
