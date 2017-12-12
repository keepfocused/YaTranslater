//
//  YTSupportLanguage.m
//  YaTranslater
//
//  Created by Danil on 11.12.17.
//  Copyright © 2017 Danil. All rights reserved.
//

#import "YTSupportLanguage.h"
#import "YTCountry.h"

NSString* const KeySupportLanguageDirs = @"dirs";
NSString* const KeySupportLanguagesLangs = @"langs";

@implementation YTSupportLanguage
-(instancetype)initWIthInputOutputCode:(NSString *)inputOutputCode andLangsDictionary:(NSDictionary *)langsDictionary {
    self = [super init];
    if (self) {
        [self addInputOutputCode:inputOutputCode andLangsDictionary:langsDictionary];
    }
    return self;
}

-(void)addInputOutputCode:(NSString *)inputOutputCode andLangsDictionary:(NSDictionary *)langsDictionary {
    NSUInteger loc = [inputOutputCode rangeOfString:@"-"].location;
    if (loc == NSNotFound) {
        return;
    }
    
    NSString *inputCode = [inputOutputCode substringToIndex:loc];
    NSString *name = langsDictionary[inputCode];
    if (inputOutputCode && name && !_inputCountry) {
        _inputCountry = [[YTCountry alloc] initCountryCode:inputCode andCountryName:name];
    }
    
    NSMutableArray *mutable = self.outputCountries ? [self.outputCountries mutableCopy] : [NSMutableArray array];
    NSString *outputCode = [inputOutputCode substringFromIndex:loc + 1];
    YTCountry *outputCountry = [[YTCountry  alloc] initCountryCode:outputCode andCountryName:langsDictionary[outputCode]];
    [mutable addObject:outputCountry];
    _outputCountries = [mutable copy];
}

@end
