//
//  ios_context_accelerator_gl.m
//  sources
//
//  Created by zjq on 2018/10/25.
//
#if defined(UC_BUILD_STARTUP_OPTIMIZE_IOS_WARM_UP)

#include "flutter/uc/shell/platform/darwin/ios/ios_context_accelerator_gl.h"

#import <Foundation/Foundation.h>

namespace flutter {
namespace uc {

static fml::scoped_nsobject<EAGLContext> g_context_;
static fml::scoped_nsobject<EAGLContext> g_resource_context_;
static std::mutex g_mutex_;
void IOSGLContextAccelerator::AcceptContext(EAGLContext *context, EAGLContext *resource_context) {
  std::lock_guard<std::mutex> lock(g_mutex_);
  g_context_.reset([context retain]);
  g_resource_context_.reset([resource_context retain]);
}

std::pair<fml::scoped_nsobject<EAGLContext>, fml::scoped_nsobject<EAGLContext>>IOSGLContextAccelerator::ConsumeContext() {
  std::lock_guard<std::mutex> lock(g_mutex_);
  fml::scoped_nsobject<EAGLContext> context([g_context_.get() retain]);
  fml::scoped_nsobject<EAGLContext> resource_context([g_resource_context_.get() retain]);
  g_context_.reset(NULL);
  g_resource_context_.reset(NULL);
  return {context, resource_context};
}

}
}
#endif //UC_BUILD_STARTUP_OPTIMIZE_IOS_WARM_UP

