# Multilanguage

Objective-C category can override system funnction. 

⚠️**Unfortunately**⚠️

Extension in swift language can't override system function.

## Which problem shoud be resolved
**Localizable.strings** we can use it to implement Multilanguage
But how to let storyboard reload its label's text according to **.strings** file?

Set **AppleLanguages** in user default and then **restart** app. 
But sometimes we don't want user to restart app. it will affect user experience.

## How to reset in app? (So Storyboard must reload label's text also)

Actually the following function will be called everytime. no matter whether you use storyboard or you choose codes to do all implementations

```
- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName

```

Use Objc-runningtime function, we can change the bundle instance according to current language.

```
@implementation BundleEx

- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName
{
    NSBundle *bundle = objc_getAssociatedObject(self, &kBundleKey);
    if (bundle) {
        return [bundle localizedStringForKey:key value:value table:tableName];
    }
    else {
        return [super localizedStringForKey:key value:value table:tableName];
    }
}

@end

@implementation NSBundle (Language)

+ (void)setLanguage:(NSString *)language
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object_setClass([NSBundle mainBundle], [BundleEx class]);
    });
    id value = language ? [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:language ofType:@"lproj"]] : nil;
    objc_setAssociatedObject([NSBundle mainBundle], &kBundleKey, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

```

Because NSBundle can't be directly used in swift. even if you have imported it in your **xxxx-Bridging-Header** file.

Finally wrap a class which only provides interface to swift. 


Resource:
https://github.com/maximbilan/Language-Manager-iOS

