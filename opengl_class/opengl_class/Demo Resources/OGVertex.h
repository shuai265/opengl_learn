

#import <OpenGLES/gltypes.h>
#import <OpenGLES/ES2/gl.h>

typedef enum {
    OGVertexAttribPosition = 0,
    OGVertexAttribColor = 1,
} OGVertexAttributes;

typedef struct {
    GLfloat Position[3];
    GLfloat Color[4];
} OGVertex;
