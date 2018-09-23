
attribute vec4 a_Position;
attribute vec4 a_Color;

// send data from vertex shader to fragment shader, declear the same variable in fragment shader, so it could be pass
varying lowp vec4 frag_Color;

void main(void) {
    frag_Color = a_Color;
    gl_Position = a_Position;
}
