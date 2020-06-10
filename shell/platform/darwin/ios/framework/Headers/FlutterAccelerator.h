//
//  FlutterAccelerator.h
//  products
//
//  Created by zjq on 2018/10/24.
//
//#if defined(UC_BUILD_STARTUP_OPTIMIZE_IOS_WARM_UP)

#ifndef FLUTTER_FLUTTERACCELERATOR_H_
#define FLUTTER_FLUTTERACCELERATOR_H_

#import <Foundation/Foundation.h>

#include "FlutterMacros.h"

FLUTTER_EXPORT
@interface FlutterAccelerator : NSObject

/**
*   业务调用这个接口触发引擎资源预热
*
*/
+ (void)startAccelerator;

@end

#endif /* FLUTTER_FLUTTERACCELERATOR_H_ */

//#endif //UC_BUILD_STARTUP_OPTIMIZE_IOS_WARM_UP
