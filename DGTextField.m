//
//  DGTextField.m
//  Ogonium
//
//  Created by Goldberg, Dov on 1/17/13.
//  Copyright (c) 2013 Ogonium. All rights reserved.
//

#import "DGTextField.h"

@interface DGTextField (Private)

- (void)setup:(CGRect)frame;
@end

@interface DGTextField ()

@property (nonatomic, retain) UIButton *customClearButton;
@property (nonatomic, retain) UIImage *clearButtonImage;
@property (nonatomic, assign) UITextFieldViewMode privateRightViewMode;
@end

@implementation DGTextField

- (id)initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];
    
  if (self) {
    self.placeholderColor = [DGTextField defaultPlaceholderColor];
    [self setup:self.frame];
  }
  return self;
}

-(id) initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
      
    self.placeholderColor = [DGTextField defaultPlaceholderColor];
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
  [cursor_ setBackgroundColor:[UIColor colorWithRed:81.0f/255.0f green:106.0f/255.0f blue:237.0f/255.0f alpha:1.0f]];
  cursor_.hidden = NO;
}

////////////////////////////////////////////////////
// Base Class Overrides
////////////////////////////////////////////////////

-(BOOL)becomeFirstResponder {
  cursor_.alpha = 1.0f;
  [UIView animateWithDuration:0.5f
                        delay:0.6f
                      options:(UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionCurveEaseInOut)
                   animations:^{
                     cursor_.alpha = 0.0f;
                   }
                   completion:^(BOOL finished){}];

    if (self.clearButtonImage) {
        if (self.rightViewMode == UITextFieldViewModeNever || self.rightViewMode == UITextFieldViewModeUnlessEditing) {
            [self setRightButtonImage:nil];
        }else{
            [self setRightButtonImage:self.clearButtonImage];
            NSLog(@"Init");
        }
    }
    return [super becomeFirstResponder];
}

- (BOOL)resignFirstResponder{
   
    if (self.clearButtonImage) { NSLog(@"Img");
        if (self.privateRightViewMode == UITextFieldViewModeNever || self.privateRightViewMode == UITextFieldViewModeWhileEditing) {
            [self setRightButtonImage:nil];
        }else{
            [self setRightButtonImage:self.clearButtonImage];
            NSLog(@"OK3");
        }
    }
    return [super resignFirstResponder];
}

- (CGRect)textRectForBounds:(CGRect)bounds {
  // Hides Cursor when not editing
  cursor_.hidden = YES;
  [self bringSubviewToFront:cursor_];
    
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


////////////////////////////////////////////////////
// @Pakizip Custom Cancel Button Implementation
////////////////////////////////////////////////////

- (void)setRightViewMode:(UITextFieldViewMode)rightViewMode{
    self.privateRightViewMode = rightViewMode;
}

- (UITextFieldViewMode)rightViewMode{
    
    return self.privateRightViewMode;
}

- (void)setRightButtonImage:(UIImage*)image viewMode:(UITextFieldViewMode)mode{
    
    self.privateRightViewMode = mode;
    [self setRightButtonImage:image];

}

- (void)setRightButtonImage:(UIImage*)image{
    
    if (image) {
        
        [self setClearButtonImage:image];
        //self.clearButtonMode = UITextFieldViewModeNever;
        
        if (!self.customClearButton) {
            self.customClearButton = [UIButton buttonWithType:UIButtonTypeCustom];
            self.customClearButton.frame = CGRectMake(0, 0, 16, 16);
            [self.customClearButton addTarget:self action:@selector(eraseText) forControlEvents:UIControlEventTouchUpInside];
            self.rightView = self.customClearButton;
        }
        [self.customClearButton setBackgroundImage:image forState:UIControlStateNormal];
        
    }else{
        
        self.customClearButton = nil;
        self.rightView = nil;
    }
}

- (void)eraseText{
    
    self.text = @"";
}

////////////////////////////////////////////////////
// @Pakizip Custom Placeholder color
////////////////////////////////////////////////////

- (void) drawPlaceholderInRect:(CGRect)rect {
    [self.placeholderColor setFill];
    [self.placeholder drawInRect:rect withFont:self.font lineBreakMode:UILineBreakModeClip alignment:self.textAlignment];
}

+(UIColor *) defaultPlaceholderColor {

    return [UIColor darkGrayColor];

}


@end
