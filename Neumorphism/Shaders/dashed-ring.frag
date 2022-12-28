#version 440

layout(location = 0) in vec2 qt_TexCoord0;
layout(location = 0) out vec4 fragColor;

layout(binding = 1) uniform sampler2D source;

layout(std140, binding = 0) uniform buf {
    mat4 qt_Matrix;
    float qt_Opacity;

    float count;
    float dashWidth;
    float borderWidth;
    float smoothstp;
    vec4 color;
};


void main() {
    vec2 normal = qt_TexCoord0 - vec2(0.5);
    fragColor = color;
    float ticks = smoothstep(0.0, 20 * smoothstp / count, -abs(fract(atan(normal.x, normal.y) * 57.2958 / count) - 0.5) + dashWidth / count);
    float ring = smoothstep(0.0, smoothstp, -abs(length(normal) - 0.5 + borderWidth) + borderWidth);
    fragColor = fragColor * ring * ticks;
}
