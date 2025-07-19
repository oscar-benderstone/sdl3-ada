# Vendored Dependencies

To simplify SDL dependencies,
this folder manages a simple CMake script,
which is run by alire during `post-fetch`
and `pre-build`.
In this way, dependencies
can be explicitly downloaded
and built by the user.

You will need to have CMake installed.
An easy way to get CMake is through
Python, using: `pip install cmake`.
(This also works for `pipx`, `conda`, etc.)

To use this script manually, run `cmake . -B build`
in this folder.
