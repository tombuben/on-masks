shader_type canvas_item;

uniform float expansion;
uniform sampler2D noiseTexture : repeat_enable; 

#define NUM_BUBBLES 9.
#define SEED 10.
#define TWO_PI 6.28318530718

// via Dave Hoskins
float hash11(float p)
{
    p = fract(p * 0.1031);
    p *= p + 33.33;
    p *= p + p;
    p = fract(p);
    return p * 2. - 1.;
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec2 screen_resolution = 1.0 / SCREEN_PIXEL_SIZE;

	
	vec2 uv = UV.xy * 2. - 1.;

	float c = 0.;
    float r = expansion;//1.;//sin(TIME) * 0.5 + 0.5;
    
    // center circle
    c = 1. - (length(uv) - (0.4 * r));

    // edge circles	
	for (float i = 0.; i < NUM_BUBBLES; i++)
	{
        float rnd = hash11((i / NUM_BUBBLES) + SEED);
        
        float th = (i / NUM_BUBBLES) + rnd * 0.02;
        float x = cos(th * TWO_PI) * r;
        float y = sin(th * TWO_PI) * r;
       
		float size = abs(rnd) + sin(500. * rnd + TIME * 3.5) * 0.3;
		float rad = (0.2 + 0.5 * size * 0.25) * r;
		vec2  pos = vec2(x, y) * 0.5 * r;
		float dis = length(uv - pos);
		
		c = max(c, 1. - (dis - rad));
	}
    
	float c2 = smoothstep(0.99, 0.991, c);
    c = smoothstep(0.977, 0.978, c);
	
	float visibility = smoothstep(0.39,0.5,expansion);
	vec3 insideColor = mix(vec3(1.), texture(TEXTURE, UV).xyz, visibility);
	COLOR = vec4(vec3(c2) * insideColor, c);	
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
