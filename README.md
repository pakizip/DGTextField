DGTextField
===================


## DESCRIPTION ##

* DGTextField extends UITextField to offer more customization options.

## WHAT CAN I CUSTOMIZE ##

1. Carat Color (Cursor Color)  
2. Right View Image (Clear Button)
2. Placeholder Color

## SETUP ##

1. Add DGTextField.h and DGTextField.m to your iOS XCode project.
2. Import DGTextField.h into the class file where you want to use DGTextField.

    <pre>#import "DGTextField.h"</pre>


## CUSTOMIZABLE PROPERTIES ##

DGTextField contains the following functions:

1. cursorColor - Sets the color of the blinking cursor of the DGTextField instance.
2. placeholderColor - Sets the color of the placeholder text of DGTextField instance.

## INSTANCE METHODS ##

	- (void)setRightButtonImage:(UIImage*)image;
	- (void)setRightButtonImage:(UIImage*)image viewMode:(UITextFieldViewMode)mode;

## LICENSE ##

The MIT License

Copyright (c) 2012 Dov Goldberg   
EMAIL: dov.goldberg@ogonium.com   
WEBSITE: http://www.ogonium.com

Copyright (c) 2013 Pasquale Ambrosini   
EMAIL: pakizip@gmail.com   
WEBSITE: http://www.pasqualeambrosini.net   

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


