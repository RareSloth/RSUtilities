//
//  RSULocalizationHelper.h
//  Pods
//
//  Created by Austin Borden on 3/3/16.
//
//

#import <Foundation/Foundation.h>

#define RSULocalizedString(key) [[RSULocalizationHelper sharedInstance] localizedStringForKey:key]
#define RSULocalizedStringWithDefault(key, default) [[RSULocalizationHelper sharedInstance] localizedStringForKey:key withDefault:default]

/**
 *  RSULocalizationHelper is primarily used to enable changing the localized language used
 *  by the app at runtime.
 **/
@interface RSULocalizationHelper : NSObject

+ (RSULocalizationHelper *)sharedInstance;

- (NSString *)localizedStringForKey:(NSString *)key;
- (NSString *)localizedStringForKey:(NSString *)key withDefault:(NSString *)defaultValue;
- (void)setLanguage:(NSString *)language;

@end
