//
//  YTCountry.h
//  YaTranslater
//
//  Created by Danil on 11.12.17.
//  Copyright © 2017 Danil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YTCountry : NSObject

@property (strong, nonatomic, readonly) NSString *code;
@property (strong, nonatomic, readonly) NSString *name;

- (instancetype) initCountryCode:(NSString *)countryCode andCountryName:(NSString *)countryName;
@end
