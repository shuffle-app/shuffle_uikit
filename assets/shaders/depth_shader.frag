// Fragment shader example in SkSL style for Flutter
uniform sampler2D u_image;  // Texture sampler for the image
in float2 v_texCoord;       // Input from vertex shader

out half4 color;  // Output color of the pixel

void main() {
    color = texture(u_image, v_texCoord); // Sample the texture at the coordinates
}
