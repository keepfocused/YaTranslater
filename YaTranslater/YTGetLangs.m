//
//  YTGetLangs.m
//  YaTranslater
//
//  Created by Danil on 11.12.17.
//  Copyright © 2017 Danil. All rights reserved.
//

#import "YTGetLangs.h"
#import "YTSupportLanguage.h"

@implementation YTGetLangs


-(void)addInputOutputCountryCode:(NSString *)inputOutputCode andLangsDictionary:(NSDictionary *)langsDictionary {
    NSUInteger loc = [inputOutputCode rangeOfString:@"-"].location;
    if (loc == NSNotFound) {
        return;
    }
    
    NSString *inputCode = [inputOutputCode substringToIndex:loc];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"inputCountry.code == %@", inputCode];
    NSArray *result = [self.supports filteredArrayUsingPredicate:predicate];
    if ( result.count == 0) {
        //Create new
        NSMutableArray *mutableSupports = self.supports ? [self.supports mutableCopy] : [NSMutableArray array];
        YTSupportLanguage *support = [[YTSupportLanguage alloc] initWithInputOutputCode:inputOutputCode andLangsDictionary:langsDictionary];
        [mutableSupports addObject:support];
        _supports = [mutableSupports copy];
    } else {
        //refresh current
        YTSupportLanguage *currentSupport = result.firstObject;
        [currentSupport addInputOutputCode:inputOutputCode andLangsDictionary:langsDictionary];
    }
}



@end
