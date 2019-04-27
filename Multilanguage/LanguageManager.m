//
//  LanguageManager.m
//  Multilanguage
//
//  Created by Eric JI on 2019/04/27.
//  Copyright © 2019 Eric JI. All rights reserved.
//

#import "LanguageManager.h"
#import "NSBundle+Language.h"

@implementation LanguageManager

+ (void)setLanguage:(NSString*)language {
    
    [NSBundle setLanguage: language];
    
}


@end
