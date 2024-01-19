// Copyright (c) 2023 bjin (https://github.com/bjin/mpv-prescalers)
// Modifications Copyright (c) 2023 Artoriuz
// Changes: Replaced the AR solution with a simpler 4-tap clipper
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

//!DESC RAVU-Zoom-PC (rgb, r3)
//!HOOK MAIN
//!BIND HOOKED
//!BIND ravu_zoom_lut3
//!WIDTH OUTPUT.w
//!HEIGHT OUTPUT.h
//!OFFSET ALIGN
//!WHEN HOOKED.w OUTPUT.w < HOOKED.h OUTPUT.h < *
const vec3 color_primary = vec3(0.2126, 0.7152, 0.0722);
#define LUTPOS(x, lut_size) mix(0.5 / (lut_size), 1.0 - 0.5 / (lut_size), (x))
vec4 hook() {
vec2 pos = HOOKED_pos * HOOKED_size;
vec2 subpix = fract(pos - 0.5);
pos -= subpix;
subpix = LUTPOS(subpix, vec2(9.0));
vec2 subpix_inv = 1.0 - subpix;
vec2 subpix_ar = subpix / vec2(2.0, 288.0);
vec2 subpix_inv_ar = subpix_inv / vec2(2.0, 288.0);
subpix /= vec2(5.0, 288.0);
subpix_inv /= vec2(5.0, 288.0);
float ar_strength = 0.8;
vec3 sample0 = HOOKED_tex((pos + vec2(-2.0,-2.0)) * HOOKED_pt).xyz;
vec3 sample1 = HOOKED_tex((pos + vec2(-2.0,-1.0)) * HOOKED_pt).xyz;
vec3 sample2 = HOOKED_tex((pos + vec2(-2.0,0.0)) * HOOKED_pt).xyz;
vec3 sample3 = HOOKED_tex((pos + vec2(-2.0,1.0)) * HOOKED_pt).xyz;
vec3 sample4 = HOOKED_tex((pos + vec2(-2.0,2.0)) * HOOKED_pt).xyz;
vec3 sample5 = HOOKED_tex((pos + vec2(-2.0,3.0)) * HOOKED_pt).xyz;
vec3 sample6 = HOOKED_tex((pos + vec2(-1.0,-2.0)) * HOOKED_pt).xyz;
vec3 sample7 = HOOKED_tex((pos + vec2(-1.0,-1.0)) * HOOKED_pt).xyz;
vec3 sample8 = HOOKED_tex((pos + vec2(-1.0,0.0)) * HOOKED_pt).xyz;
vec3 sample9 = HOOKED_tex((pos + vec2(-1.0,1.0)) * HOOKED_pt).xyz;
vec3 sample10 = HOOKED_tex((pos + vec2(-1.0,2.0)) * HOOKED_pt).xyz;
vec3 sample11 = HOOKED_tex((pos + vec2(-1.0,3.0)) * HOOKED_pt).xyz;
vec3 sample12 = HOOKED_tex((pos + vec2(0.0,-2.0)) * HOOKED_pt).xyz;
vec3 sample13 = HOOKED_tex((pos + vec2(0.0,-1.0)) * HOOKED_pt).xyz;
vec3 sample14 = HOOKED_tex((pos + vec2(0.0,0.0)) * HOOKED_pt).xyz;
vec3 sample15 = HOOKED_tex((pos + vec2(0.0,1.0)) * HOOKED_pt).xyz;
vec3 sample16 = HOOKED_tex((pos + vec2(0.0,2.0)) * HOOKED_pt).xyz;
vec3 sample17 = HOOKED_tex((pos + vec2(0.0,3.0)) * HOOKED_pt).xyz;
vec3 sample18 = HOOKED_tex((pos + vec2(1.0,-2.0)) * HOOKED_pt).xyz;
vec3 sample19 = HOOKED_tex((pos + vec2(1.0,-1.0)) * HOOKED_pt).xyz;
vec3 sample20 = HOOKED_tex((pos + vec2(1.0,0.0)) * HOOKED_pt).xyz;
vec3 sample21 = HOOKED_tex((pos + vec2(1.0,1.0)) * HOOKED_pt).xyz;
vec3 sample22 = HOOKED_tex((pos + vec2(1.0,2.0)) * HOOKED_pt).xyz;
vec3 sample23 = HOOKED_tex((pos + vec2(1.0,3.0)) * HOOKED_pt).xyz;
vec3 sample24 = HOOKED_tex((pos + vec2(2.0,-2.0)) * HOOKED_pt).xyz;
vec3 sample25 = HOOKED_tex((pos + vec2(2.0,-1.0)) * HOOKED_pt).xyz;
vec3 sample26 = HOOKED_tex((pos + vec2(2.0,0.0)) * HOOKED_pt).xyz;
vec3 sample27 = HOOKED_tex((pos + vec2(2.0,1.0)) * HOOKED_pt).xyz;
vec3 sample28 = HOOKED_tex((pos + vec2(2.0,2.0)) * HOOKED_pt).xyz;
vec3 sample29 = HOOKED_tex((pos + vec2(2.0,3.0)) * HOOKED_pt).xyz;
vec3 sample30 = HOOKED_tex((pos + vec2(3.0,-2.0)) * HOOKED_pt).xyz;
vec3 sample31 = HOOKED_tex((pos + vec2(3.0,-1.0)) * HOOKED_pt).xyz;
vec3 sample32 = HOOKED_tex((pos + vec2(3.0,0.0)) * HOOKED_pt).xyz;
vec3 sample33 = HOOKED_tex((pos + vec2(3.0,1.0)) * HOOKED_pt).xyz;
vec3 sample34 = HOOKED_tex((pos + vec2(3.0,2.0)) * HOOKED_pt).xyz;
vec3 sample35 = HOOKED_tex((pos + vec2(3.0,3.0)) * HOOKED_pt).xyz;

float luma1 = dot(sample1, color_primary);
float luma2 = dot(sample2, color_primary);
float luma3 = dot(sample3, color_primary);
float luma4 = dot(sample4, color_primary);
float luma6 = dot(sample6, color_primary);
float luma7 = dot(sample7, color_primary);
float luma8 = dot(sample8, color_primary);
float luma9 = dot(sample9, color_primary);
float luma10 = dot(sample10, color_primary);
float luma11 = dot(sample11, color_primary);
float luma12 = dot(sample12, color_primary);
float luma13 = dot(sample13, color_primary);
float luma14 = dot(sample14, color_primary);
float luma15 = dot(sample15, color_primary);
float luma16 = dot(sample16, color_primary);
float luma17 = dot(sample17, color_primary);
float luma18 = dot(sample18, color_primary);
float luma19 = dot(sample19, color_primary);
float luma20 = dot(sample20, color_primary);
float luma21 = dot(sample21, color_primary);
float luma22 = dot(sample22, color_primary);
float luma23 = dot(sample23, color_primary);
float luma24 = dot(sample24, color_primary);
float luma25 = dot(sample25, color_primary);
float luma26 = dot(sample26, color_primary);
float luma27 = dot(sample27, color_primary);
float luma28 = dot(sample28, color_primary);
float luma29 = dot(sample29, color_primary);
float luma31 = dot(sample31, color_primary);
float luma32 = dot(sample32, color_primary);
float luma33 = dot(sample33, color_primary);
float luma34 = dot(sample34, color_primary);

vec3 pix_min = vec3(1e8);
// pix_min = min(pix_min, sample0 );
// pix_min = min(pix_min, sample1 );
// pix_min = min(pix_min, sample2 );
// pix_min = min(pix_min, sample3 );
// pix_min = min(pix_min, sample4 );
// pix_min = min(pix_min, sample5 );
// pix_min = min(pix_min, sample6 );
// pix_min = min(pix_min, sample7 );
// pix_min = min(pix_min, sample8 );
// pix_min = min(pix_min, sample9 );
// pix_min = min(pix_min, sample10);
// pix_min = min(pix_min, sample11);
// pix_min = min(pix_min, sample12);
// pix_min = min(pix_min, sample13);
pix_min = min(pix_min, sample14);
pix_min = min(pix_min, sample15);
// pix_min = min(pix_min, sample16);
// pix_min = min(pix_min, sample17);
// pix_min = min(pix_min, sample18);
// pix_min = min(pix_min, sample19);
pix_min = min(pix_min, sample20);
pix_min = min(pix_min, sample21);
// pix_min = min(pix_min, sample22);
// pix_min = min(pix_min, sample23);
// pix_min = min(pix_min, sample24);
// pix_min = min(pix_min, sample25);
// pix_min = min(pix_min, sample26);
// pix_min = min(pix_min, sample27);
// pix_min = min(pix_min, sample28);
// pix_min = min(pix_min, sample29);
// pix_min = min(pix_min, sample30);
// pix_min = min(pix_min, sample31);
// pix_min = min(pix_min, sample32);
// pix_min = min(pix_min, sample33);
// pix_min = min(pix_min, sample34);
// pix_min = min(pix_min, sample35);

vec3 pix_max = vec3(-1e8);
// pix_max = max(pix_max, sample0 );
// pix_max = max(pix_max, sample1 );
// pix_max = max(pix_max, sample2 );
// pix_max = max(pix_max, sample3 );
// pix_max = max(pix_max, sample4 );
// pix_max = max(pix_max, sample5 );
// pix_max = max(pix_max, sample6 );
// pix_max = max(pix_max, sample7 );
// pix_max = max(pix_max, sample8 );
// pix_max = max(pix_max, sample9 );
// pix_max = max(pix_max, sample10);
// pix_max = max(pix_max, sample11);
// pix_max = max(pix_max, sample12);
// pix_max = max(pix_max, sample13);
pix_max = max(pix_max, sample14);
pix_max = max(pix_max, sample15);
// pix_max = max(pix_max, sample16);
// pix_max = max(pix_max, sample17);
// pix_max = max(pix_max, sample18);
// pix_max = max(pix_max, sample19);
pix_max = max(pix_max, sample20);
pix_max = max(pix_max, sample21);
// pix_max = max(pix_max, sample22);
// pix_max = max(pix_max, sample23);
// pix_max = max(pix_max, sample24);
// pix_max = max(pix_max, sample25);
// pix_max = max(pix_max, sample26);
// pix_max = max(pix_max, sample27);
// pix_max = max(pix_max, sample28);
// pix_max = max(pix_max, sample29);
// pix_max = max(pix_max, sample30);
// pix_max = max(pix_max, sample31);
// pix_max = max(pix_max, sample32);
// pix_max = max(pix_max, sample33);
// pix_max = max(pix_max, sample34);
// pix_max = max(pix_max, sample35);

vec3 abd = vec3(0.0);
float gx, gy;
gx = (luma13-luma1)/2.0;
gy = (luma8-luma6)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.04792235409415088;
gx = (luma14-luma2)/2.0;
gy = (-luma10+8.0*luma9-8.0*luma7+luma6)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.06153352068439959;
gx = (luma15-luma3)/2.0;
gy = (-luma11+8.0*luma10-8.0*luma8+luma7)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.06153352068439959;
gx = (luma16-luma4)/2.0;
gy = (luma11-luma9)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.04792235409415088;
gx = (-luma25+8.0*luma19-8.0*luma7+luma1)/12.0;
gy = (luma14-luma12)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.06153352068439959;
gx = (-luma26+8.0*luma20-8.0*luma8+luma2)/12.0;
gy = (-luma16+8.0*luma15-8.0*luma13+luma12)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.07901060453704994;
gx = (-luma27+8.0*luma21-8.0*luma9+luma3)/12.0;
gy = (-luma17+8.0*luma16-8.0*luma14+luma13)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.07901060453704994;
gx = (-luma28+8.0*luma22-8.0*luma10+luma4)/12.0;
gy = (luma17-luma15)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.06153352068439959;
gx = (-luma31+8.0*luma25-8.0*luma13+luma7)/12.0;
gy = (luma20-luma18)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.06153352068439959;
gx = (-luma32+8.0*luma26-8.0*luma14+luma8)/12.0;
gy = (-luma22+8.0*luma21-8.0*luma19+luma18)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.07901060453704994;
gx = (-luma33+8.0*luma27-8.0*luma15+luma9)/12.0;
gy = (-luma23+8.0*luma22-8.0*luma20+luma19)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.07901060453704994;
gx = (-luma34+8.0*luma28-8.0*luma16+luma10)/12.0;
gy = (luma23-luma21)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.06153352068439959;
gx = (luma31-luma19)/2.0;
gy = (luma26-luma24)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.04792235409415088;
gx = (luma32-luma20)/2.0;
gy = (-luma28+8.0*luma27-8.0*luma25+luma24)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.06153352068439959;
gx = (luma33-luma21)/2.0;
gy = (-luma29+8.0*luma28-8.0*luma26+luma25)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.06153352068439959;
gx = (luma34-luma22)/2.0;
gy = (luma29-luma27)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.04792235409415088;
float a = abd.x, b = abd.y, d = abd.z;
float T = a + d, D = a * d - b * b;
float delta = sqrt(max(T * T / 4.0 - D, 0.0));
float L1 = T / 2.0 + delta, L2 = T / 2.0 - delta;
float sqrtL1 = sqrt(L1), sqrtL2 = sqrt(L2);
float theta = mix(mod(atan(L1 - a, b) + 3.141592653589793, 3.141592653589793), 0.0, abs(b) < 1.192092896e-7);
float lambda = sqrtL1;
float mu = mix((sqrtL1 - sqrtL2) / (sqrtL1 + sqrtL2), 0.0, sqrtL1 + sqrtL2 < 1.192092896e-7);
float angle = floor(theta * 24.0 / 3.141592653589793);
float strength = mix(mix(0.0, 1.0, lambda >= 0.004), mix(2.0, 3.0, lambda >= 0.05), lambda >= 0.016);
float coherence = mix(mix(0.0, 1.0, mu >= 0.25), 2.0, mu >= 0.5);
float coord_y = ((angle * 4.0 + strength) * 3.0 + coherence) / 288.0;
vec3 res = vec3(0.0);
vec4 w;
w = texture(ravu_zoom_lut3, vec2(0.0, coord_y) + subpix);
res += sample0 * w[0];
res += sample1 * w[1];
res += sample2 * w[2];
res += sample3 * w[3];
w = texture(ravu_zoom_lut3, vec2(0.2, coord_y) + subpix);
res += sample4 * w[0];
res += sample5 * w[1];
res += sample6 * w[2];
res += sample7 * w[3];
w = texture(ravu_zoom_lut3, vec2(0.4, coord_y) + subpix);
res += sample8 * w[0];
res += sample9 * w[1];
res += sample10 * w[2];
res += sample11 * w[3];
w = texture(ravu_zoom_lut3, vec2(0.6, coord_y) + subpix);
res += sample12 * w[0];
res += sample13 * w[1];
res += sample14 * w[2];
res += sample15 * w[3];
w = texture(ravu_zoom_lut3, vec2(0.8, coord_y) + subpix);
res += sample16 * w[0];
res += sample17 * w[1];
w = texture(ravu_zoom_lut3, vec2(0.0, coord_y) + subpix_inv);
res += sample35 * w[0];
res += sample34 * w[1];
res += sample33 * w[2];
res += sample32 * w[3];
w = texture(ravu_zoom_lut3, vec2(0.2, coord_y) + subpix_inv);
res += sample31 * w[0];
res += sample30 * w[1];
res += sample29 * w[2];
res += sample28 * w[3];
w = texture(ravu_zoom_lut3, vec2(0.4, coord_y) + subpix_inv);
res += sample27 * w[0];
res += sample26 * w[1];
res += sample25 * w[2];
res += sample24 * w[3];
w = texture(ravu_zoom_lut3, vec2(0.6, coord_y) + subpix_inv);
res += sample23 * w[0];
res += sample22 * w[1];
res += sample21 * w[2];
res += sample20 * w[3];
w = texture(ravu_zoom_lut3, vec2(0.8, coord_y) + subpix_inv);
res += sample19 * w[0];
res += sample18 * w[1];

res = mix(res, clamp(res, pix_min, pix_max), ar_strength);
return vec4(res, 1.0);
}
//!TEXTURE ravu_zoom_lut3
//!SIZE 45 2592
//!FORMAT rgba16f
//!FILTER LINEAR