//
//  ViewController.m
//  opengl_class
//
//  Created by shuai.liu on 2018/7/23.
//  Copyright © 2018年 ihandy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

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
