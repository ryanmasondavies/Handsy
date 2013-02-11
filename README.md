Handsy
======

A bunch of iOS classes and extensions used for simulating gestures.

In order to press a button, the following code example would suffice:

    [button tap];

-tap, by default, performs the gesture in the center of the given view.
In order to tap a certain position, the following code could be used:

    [button tapAtPosition:CGPoint(32, 32)];

This library uses private APIs, and so should not be used in production. However, it serves as very useful during testing.

A big thanks to the Square crew, as much of the implementation is extracted from KIF (https://github.com/square/KIF).
This library is very much a work in progress, and so the API may be subject to simplification and potentially drastic change.

License
=======

    Copyright (c) 2012 Ryan Davies
    
    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:
    
    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.
    
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.
