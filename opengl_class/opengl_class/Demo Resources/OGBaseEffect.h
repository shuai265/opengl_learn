
#import <Foundation/Foundation.h>

@interface OGBaseEffect : NSObject

@property (nonatomic, assign) GLuint ProgramHandle;

- (id)initWithVertexShader:(NSString *)vertexShader fragmentShader:(NSString *)fragmentShader;
- (void)prepareToDraw;

@end
