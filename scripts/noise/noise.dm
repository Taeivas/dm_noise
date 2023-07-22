#define NOISE_WRAP(x, min, max) (((x - min) % (max - min + 1) + (max - min + 1)) % (max - min + 1) + min)
noise
	proc
		Lerp(a, b, t)
			return a + (b - a) * t

		Fade(t)
			return ((6 * t - 15) * t + 10) * t * t * t

		Noise2D(x, y, seed = 0)
			var
				xi = floor(x)
				yi = floor(y)
				xf = x - xi
				yf = y - yi


				x0y0 = noise_hash(xi, yi, seed)
				x0y1 = noise_hash(xi, yi + 1, seed)
				x1y0 = noise_hash(xi + 1, yi, seed)
				x1y1 = noise_hash(xi + 1, yi + 1, seed)

				u = Fade(xf)
				v = Fade(yf)

			return Lerp(Lerp(x0y0, x0y1, v), Lerp(x1y0, x1y1, v), u)

		Noise2DWrap(x, y, seed = 0, min_x = 1, max_x = world.icon_size, min_y = 1, max_y = world.icon_size)
			var
				xi = floor(x)
				yi = floor(y)
				xf = x - xi
				yf = y - yi

				x0 = NOISE_WRAP(xi, min_x, max_x)
				x1 = NOISE_WRAP(xi + 1, min_x, max_x)
				y0 = NOISE_WRAP(yi, min_y, max_y)
				y1 = NOISE_WRAP(yi + 1, min_y, max_y)

				x0y0 = noise_hash(x0, y0, seed)
				x0y1 = noise_hash(x0, y1, seed)
				x1y0 = noise_hash(x1, y0, seed)
				x1y1 = noise_hash(x1, y1, seed)

				u = Fade(xf)
				v = Fade(yf)

			return Lerp(Lerp(x0y0, x0y1, v), Lerp(x1y0, x1y1, v), u)

		FBM(x, y, amplitude = 1, frequency = 1, octaves = 1, persistance = 0.5, lacunarity = 2, seed = 0)
			var/value = 0
			for(var/i = 1 to octaves)
				value += amplitude * Noise2D(x * frequency, y * frequency, seed)
				amplitude *= persistance
				frequency *= lacunarity
			return value

		FBMWrap(x, y, amplitude = 1, frequency = 1, octaves = 1, persistance = 0.5, lacunarity = 2, seed = 0, min_x = 1, max_x = world.icon_size, min_y = 1, max_y = world.icon_size)
			var/value = 0
			var/scale = frequency
			for(var/i = 1 to octaves)
				value += amplitude * Noise2DWrap(x * frequency, y * frequency, seed, min_x = min_x, max_x = max_x * scale, min_y = min_y, max_y = max_y * scale)
				amplitude *= persistance
				frequency *= lacunarity
			return value