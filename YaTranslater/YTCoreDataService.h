//
//  YTCoreDataService.h
//  YaTranslater
//
//  Created by Danil on 12.12.17.
//  Copyright © 2017 Danil. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YTCountry;
@class YTSupportLanguage;
@interface YTCoreDataService : NSObject
//Save list of available laguages
- (void) saveSupportLanguages:(NSArray<YTSupportLanguage*>*)supports;


//Get all input languages for translate
- (NSArray<YTCountry*>*)getInputCountries;


//Get all output languages for country @param inputCountryCode Language code (ru, en, fr, etc)
- (NSArray<YTCountry*>*)getOutputCountriesWithInputCountryCode:(NSString*)inputCountryCode;








@end
