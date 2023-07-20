# Noise Library Documentation
## Description
This is a Noise Library code, written in DM (Dream Maker) language. It contains a set of functions that help generate different types of noise, including 2D noise, wrapped 2D noise, and Fractal Brownian Motion (FBM) noise, and also wrapped FBM. These noise generation functions can be useful for procedural content generation such as landscapes, random variations in AI behavior, etc.

## Definitions
`NOISE_WRAP(x, min, max)`: Macro that wraps a value `x` into the range `[min, max]` in a cyclic manner.
## Procedures
`Lerp(a, b, t)`: This function linearly interpolates between two points `a` and `b`, based on the parameter `t` `(0 ≤ t ≤ 1)`.

`Fade(t)`: This function returns a fade function value of the input `t`, which is typically used to smooth results of other functions.

`Noise2D(x, y, seed = 0)`: This function returns a 2D Perlin noise value at coordinates `(x, y)`, using the provided seed.

`Noise2DWrap(x, y, seed = 0, min_x = 1, max_x = world.icon_size, min_y = 1, max_y = world.icon_size)`: This function returns a 2D Perlin noise value at coordinates `(x, y)`, with wrapping on `x` and `y` axis. `seed`, range of `x` and `y` are optional parameters.

`FBM(x, y, amplitude = 1, frequency = 1, octaves = 1, persistance = 0.5, lacunarity = 2, seed = 0)`: This function returns a Fractal Brownian Motion (FBM) noise value at coordinates `(x, y)`, with customizable amplitude, frequency, number of octaves, persistence, lacunarity and seed values.

`FBMWrap(x, y, amplitude = 1, frequency = 1, octaves = 1, persistance = 0.5, lacunarity = 2, seed = 0, min_x = 1, max_x = world.icon_size, min_y = 1, max_y = world.icon_size)`: Similar to FBM, but with wrapping on `x` and `y` axis. Parameters `min_x`, `max_x`, `min_y`, `max_y` define the wrapping boundaries.

# Note
To use these functions, make sure to define your own `noise_hash` function to generate hash values from given `x`, `y` coordinates and `seed` value. The `world.icon_size` refers to a globally available size value that you need to provide for wrapping calculations in your program.