# Vendored Dependencies

To simplify SDL dependencies,
this folder manages a simple CMake script,
which is run by alire during `post-fetch`
and `pre-build`.
In this way, dependencies
can be explicitly downloaded
and built by the user.

To use this script manually, run `cmake . -B .`
