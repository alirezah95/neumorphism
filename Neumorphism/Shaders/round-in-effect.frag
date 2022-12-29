#version 440

layout(location = 0) in vec2 qt_TexCoord0;
layout(location = 0) out vec4 fragColor;

layout(std140, binding = 0) uniform buf {
    mat4 qt_Matrix;
    float qt_Opacity;

    vec2 ratio;
    float shdiff;
    float angle;
    float offset;
    float spread;
    float radius;
    float smoothstp;
    vec4 color1;
    vec4 color2;
};


void main() {
    // Normalize the coordinates qt_TexCoord0
    vec2 center = ratio / 2.0;
    vec2 coord = qt_TexCoord0 * ratio;
    // Normalize the coordinates to the center of the scene
    vec2 ncoord = coord - center;
    // Set shadow gradient.
    float slop = tan(angle);
    float mult = 1.57079 < angle && angle < 4.7123 ? -1.0 : 1.0;
    float ratio = smoothstep(0.0, shdiff, mult * (slop * ncoord.x + ncoord.y)/sqrt(slop * slop + 1.0) + shdiff/2.0);
    fragColor = mix(color1, color2, ratio);
    // Creating shadow based on shadow offset and shadow spreads.
    float dist = length(max(abs(center - coord) - center + radius, 0.0)) - radius;
    fragColor = fragColor * smoothstep(0.0, spread, dist + offset) * qt_Opacity;
    // Clipping the scene to the circular region in the center.
    fragColor = fragColor * smoothstep(0.0, smoothstp, - dist + 0.005) * qt_Opacity;
}
