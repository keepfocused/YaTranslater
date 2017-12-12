//
//  YTSupportLanguage.h
//  YaTranslater
//
//  Created by Danil on 11.12.17.
//  Copyright © 2017 Danil. All rights reserved.
//

#import <Foundation/Foundation.h>


extern NSString *const KeySupportLanguagesDirs;
extern NSString *const KeySupportLanguagesLangs;

@class YTCountry;
@interface YTSupportLanguage : NSObject

@property (copy, nonatomic, readonly) NSArray<YTCountry*> *outputCountries;
@property (copy, nonatomic, readonly) YTCountry *inputCountry;

//init with new values

- (instancetype) initWithInputOutputCode:(NSString *)inputOutputCode andLangsDictionary:(NSDictionary*) langsDictionary;

//Add new values

- (void) addInputOutputCode:(NSString *)inputOutputCode andLangsDictionary:(NSDictionary*)langsDictionary;
@end
