
#import "ViewController.h"
#import "OGVertex.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)setupVertexBuffer {
    const static OGVertex vertices[] = {
        {{-1,-1,0}},
        {{1,-1,0}},
        {{0,0,0}}
    };
}

- (void)viewDidLoad {
    [super viewDidLoad];
    GLKView *view = (GLKView *)self.view;
    view.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    glClearColor(0.2, 0.4, 0.5, 1);
    glClear(GL_COLOR_BUFFER_BIT);
}

@end
