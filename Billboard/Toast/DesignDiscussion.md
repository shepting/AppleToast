

# View Hierarchy
The great feature about this library is the way you can show a message without (necessarily) needing a references to the parent view controller for a reference to its view.

That also makes the design a little weird when handling both situations (with/without the reference to the parent view)

Without, we just make one stack view and add all the side views there.

With, we just add the stack view to the parent view controller. But we would need some type of dictionary to hold references to each of those stack views.

I think that really, the design has to have just one parent side stack view. And then move it around based on which view controller is on top.

# Side View
