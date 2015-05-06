# Group and Count

Hey! Here's my solution to the exercise.

My approach was to solve the problem recursively, breaking the problem up into smaller, similar subproblems. This was a natural-seeming approach once I realized that I was effectively solving the same problem on multiple levels of a tree structure. I defined the base case as when the array of keys was empty. In this case I simply returned the size of the array. Otherwise, I called `Enumerable#group_by` on the array, grouping by the value of the first key. Then, I mapped my group_and_count function (a recursive call!) over the new hash.

There's still one problem with that, though, which is that `Enumerable#map` always returns an array, even when called on a hash. Not what we want! So I defined a `Hash#hmap` method that returns a hash with the block mapped over the values of the receiver while leaving the keys intact. I did this by calling #map on the hash, with a block that returns a pair `[k, prc.call(v)]` (`prc` being the block passed into `hmap`... yo dawg I heard you like blocks).

As far as I can tell (my test coverage isn't super-exhaustive but I think I handled the major corner cases) the code works great, and it's only 13 lines. I monkey-patched Array and Hash directly for convenience's sake but that's probably something I'd avoid in production code. It surprises me that nothing like `#hmap` seems to be built into Ruby.