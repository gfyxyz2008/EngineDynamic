//
//  ios_context_accelerator_gl.h
//  products
//
//  Created by zjq on 2018/10/25.
//
#if defined(UC_BUILD_STARTUP_OPTIMIZE_IOS_WARM_UP)

#ifndef FLUTTER_UC_SHELL_PLATFORM_DARWIN_IOS_IOS_CONTEXT_ACCELERATOR_GL_H_
#define FLUTTER_UC_SHELL_PLATFORM_DARWIN_IOS_IOS_CONTEXT_ACCELERATOR_GL_H_

#import <OpenGLES/EAGL.h>
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>

#include <mutex>

#include "flutter/fml/platform/darwin/scoped_nsobject.h"
namespace flutter {
namespace uc {

class IOSGLContextAccelerator {
 public:
  static void AcceptContext(EAGLContext *context, EAGLContext *resource_context);
  static std::pair<fml::scoped_nsobject<EAGLContext>, fml::scoped_nsobject<EAGLContext>>ConsumeContext();
};

}
}

#endif /* FLUTTER_UC_SHELL_PLATFORM_DARWIN_IOS_IOS_CONTEXT_ACCELERATOR_GL_H_ */

#endif
