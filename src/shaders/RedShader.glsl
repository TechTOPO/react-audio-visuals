uniform sampler2D tAudioData;
varying vec4 vUv;
float rand(vec2 co){
  return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}
void main() {
  float random1 = rand(vec2(vUv.x, vUv.y));
  float random2 = rand(vec2(vUv.x, vUv.z));
  float M_PI = 3.1415926535897932384626433832795;
  float f =  texture2D( tAudioData, vec2( 0.5 + 0.5 * sin(M_PI * vUv.x) * cos(2.0 * M_PI * vUv.y), 0.0) ).g;
  //float f = texture2D( tAudioData, vec2((random1 * abs(vUv.x) * random2 * abs(vUv.y)), 0.0 ) ).g;
  float radius = 0.5;
  //vec3 backgroundColor = vec3( min(vUv.y, f), min(radius, f), min((f / 10.0), 0.1) );
  //vec3 backgroundColor = vec3( min(abs(vUv.y), 1.0), f, min((f / 10.0), 0.1) );
  //vec3 backgroundColor = vec3( (vUv.z), 1.0), min(1.0 - abs(vUv.z), random1) * f, 0.0 );
  //vec3 backgroundColor = vec3(abs(vUv.x) / length(vUv.xyz), abs(vUv.y) / length(vUv.xyz) , abs(vUv.z) / length(vUv.xyz));
  float red  = min(vUv.y / 4.0, 1.0);
  vec3 color = vec3( red, sin(f), cos(f));
  float i = step(radius, f) * step(radius, f - 0.5);
  //gl_FragColor = vec4( mix(color, backgroundColor, i), 1.0 );

  gl_FragColor = vec4(color, 0.0);
  //gl_FragColor = vec4(vec3(1,0,0), 1.0);
  //gl_FragColor.a = f;
}
