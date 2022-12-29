#version 440

layout(location = 0) in vec2 qt_TexCoord0;
layout(location = 0) out vec4 fragColor;

layout(std140, binding = 0) uniform buf {
    mat4 qt_Matrix;
    float qt_Opacity;

    float count;
    float dashWidth;
    vec4 color;
};

void main() {
    vec2 normal = qt_TexCoord0 - vec2(0.5);
    fragColor = color;
    float ticks = smoothstep(0,0.001 * count, -abs(fract(qt_TexCoord0.x * count) - 0.5) + dashWidth * count);
    fragColor = fragColor * ticks;
}
