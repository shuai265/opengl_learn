
#import "ViewController.h"
#import "OGVertex.h"
#import "OGBaseEffect.h"

@interface ViewController ()

@end

@implementation ViewController {
    // track the buffers we gen
    GLuint _vertexBuffer;
    
    OGBaseEffect *_shader;
}

- (void)setupVertexBuffer {
    
    //vertex info in cpu
    const static OGVertex vertices[] = {
        {{-1,-1,0}},
        {{1,-1,0}},
        {{0,0,0}}
    };
    
    /// send data from CPU to GPU
    // step_1: create an empty buffer on the GPU with glGenBuffers
    // 1.the number of buffers we want create
    // 2.returns buffers in an array
    glGenBuffers(1, &_vertexBuffer);
    // step_2: bind buffer active, so we can work with it
    glBindBuffer(GL_ARRAY_BUFFER, _vertexBuffer);
    // step_3:
    // 1.set target
    // 2.the number of data to send
    // 3.the pointer to the data itself
    // 4.gl updating parameter, determine update frequence
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
    
}

- (void)setupShader {
    _shader = [[OGBaseEffect alloc] initWithVertexShader:@"OGSimpleVertex.glsl" fragmentShader:@"OGSimpleFragment.glsl"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    GLKView *view = (GLKView *)self.view;
    view.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    
    //set current context
    [EAGLContext setCurrentContext:view.context];
    
    [self setupShader];
    [self setupVertexBuffer];
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    glClearColor(0.2, 0.4, 0.5, 1);
    glClear(GL_COLOR_BUFFER_BIT);
    
    [_shader prepareToDraw];
    
    //enable shader attributes
    glEnableVertexAttribArray(OGVertexAttribPosition);
    
    //2.the number of components per vertex attributes
    //3.the type of components
    //4.what the value should be normalized,for example we send interger with range 1 to 255,we want translate it to float with range 0 to 1.
    //5.how big of the structure which storing this vertex information
    //6.where the offset inside the array at which it can find these values, we can use 0,but there is a trick, keyword in c called offsetof
    glVertexAttribPointer(OGVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, sizeof(OGVertex), (const GLvoid *)offsetof(OGVertex, Position));
    
    glBindBuffer(GL_ARRAY_BUFFER, _vertexBuffer);
    //1.gl draw mode: triangles,line or point
    //2.the first vertex to use
    //3.the count of vertex to draw
    glDrawArrays(GL_TRIANGLES, 0, 3);
    
    //
    glDisableVertexAttribArray(OGVertexAttribPosition);
}

@end
