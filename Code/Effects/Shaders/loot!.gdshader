shader_type canvas_item;
uniform float progress: hint_range(0.0, 1.0);
uniform bool reverse = true;
uniform vec2 numberOftiles = vec2(15,8.4375);
// You can use this for what ever you want.
void fragment(){
	vec2 posinsqr = UV * numberOftiles;
	vec2 frac = fract(posinsqr);
	if(frac.x + frac.y >= progress* 2.0){
		if(!reverse){
			discard;
		}
	}
	else if(reverse){
		discard;
	}
}
