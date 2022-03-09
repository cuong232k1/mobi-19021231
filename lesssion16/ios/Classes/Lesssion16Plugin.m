#import "Lesssion16Plugin.h"
#if __has_include(<lesssion16/lesssion16-Swift.h>)
#import <lesssion16/lesssion16-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "lesssion16-Swift.h"
#endif

@implementation Lesssion16Plugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftLesssion16Plugin registerWithRegistrar:registrar];
}
@end
