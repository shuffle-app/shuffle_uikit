// Vertex shader example in SkSL style for Flutter
uniform float2 u_resolution; // assuming you're passing resolution or other necessary uniforms

out float2 v_texCoord; // Output texture coordinate to the fragment shader

void main(int vertexId, out float4 position) {
    // Define your vertices and texture coordinates in some way
    float2 vertices[3] = float2[3](float2(0, 0), float2(1, 0), float2(0, 1));
    float2 texCoords[3] = float2[3](float2(0, 0), float2(1, 0), float2(0, 1));

    // Set the position of the vertex
    position = float4(vertices[vertexId], 0.0, 1.0);

    // Pass texture coordinate to fragment shader
    v_texCoord = texCoords[vertexId];
}
