#version 440

layout(location = 0) in vec2 qt_TexCoord0;
layout(location = 0) out vec4 fragColor;

layout(std140, binding = 0) uniform buf {
    mat4 qt_Matrix;
    float qt_Opacity;

    vec2 ratio;
    int hasGradient;
    vec4 radius;
    vec4 color;
    vec4 c0;
    vec4 c1;
    vec2 s0;
    vec2 s1;
};

void main() {
    // TextCoord is normalized based on item size.
    vec2 center = ratio / 2.0;
    vec2 coord = ratio * qt_TexCoord0;
    vec2 s0 = s0 * ratio;
    vec2 s1 = s1 * ratio;
    // This part sets the gradient color if one exists; otherwise, it just sets the color.
    if(hasGradient > 0) {
        float d = distance(s0,s1);
        float angle = (s0.x - s1.x)/((s1.y - s0.y) == 0.0 ? 0.001 : s1.y - s0.y);
        float line = angle * (coord.x - (s0.x+s1.x) / 2 ) + (s0.y + s1.y) / 2.0 - coord.y;
        float dist = line / sqrt(angle * angle + 1.0);
        float rotflag = (s0.y > s1.y) ? -1.0 : 1.0;
        fragColor = mix(c1, c0, smoothstep(0.0, 2.0 * d, rotflag * dist + d));
    } else {
        fragColor = color ;
    }
    // Create border radius.
    float radius[4] = float[4](radius.x, radius.y, radius.z, radius.w);
    int area = int(mod(-atan(coord.x - center.x, coord.y - center.y) * 0.636 + 3, 4.0));
    float dist = length(max(abs(center - coord) - center + radius[area], 0.0)) - radius[area];
    fragColor = fragColor * smoothstep(0.0, 0.01, - dist + 0.001) * qt_Opacity;
}
