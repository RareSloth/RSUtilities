//
//  RSULocalizationHelper.m
//  Pods
//
//  Created by Austin Borden on 3/3/16.
//
//

#import "RSULocalizationHelper.h"

@interface RSULocalizationHelper()
@property (nonatomic, strong) NSBundle *bundle;
@end

@implementation RSULocalizationHelper

static RSULocalizationHelper *_sharedInstance = nil;

+ (RSULocalizationHelper *)sharedInstance
{
    if (!_sharedInstance)
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _sharedInstance = [[RSULocalizationHelper alloc] init];
        });
    }
    
    return _sharedInstance;
}

- (instancetype)init
{
    if (!(self = [super init]))
    {
        return nil;
    }
    
    _bundle = [NSBundle mainBundle];
    
    return self;
}

- (NSString *)localizedStringForKey:(NSString *)key
{
    return [_bundle localizedStringForKey:key value:@"" table:nil];
}

- (NSString *)localizedStringForKey:(NSString *)key withDefault:(NSString *)defaultValue
{
    return [_bundle localizedStringForKey:key value:defaultValue table:nil];
}

- (void)setLanguage:(NSString *)language
{
    NSString *path = [[NSBundle mainBundle] pathForResource:language ofType:@"lproj"];
    if (path.length)
    {
        NSLog(@"[RSULocalizationHelper] Update bundle language to %@", language);
        _bundle = [NSBundle bundleWithPath:path];
    }
    else
    {
        NSLog(@"[RSULocalizationHelper] Could not find bundle language %@", language);
    }
    
    if (!_bundle)
    {
        _bundle = [NSBundle mainBundle];
    }
}

@end
