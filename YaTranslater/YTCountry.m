//
//  YTCountry.m
//  YaTranslater
//
//  Created by Danil on 11.12.17.
//  Copyright © 2017 Danil. All rights reserved.
//

#import "YTCountry.h"

@implementation YTCountry
-(instancetype)initCountryCode:(NSString *)countryCode andCountryName:(NSString *)countryName {
    self = [super init];
    if (self) {
        _code = countryCode;
        _name = countryName;
    }
    return self;
}

@end
