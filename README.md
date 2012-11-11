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

This project is available under the MIT license. See the LICENSE file for details.
