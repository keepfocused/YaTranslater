//
//  YTGetLangs.h
//  YaTranslater
//
//  Created by Danil on 11.12.17.
//  Copyright © 2017 Danil. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YTSupportLanguage;
@interface YTGetLangs : NSObject

@property (strong, nonatomic, readonly) NSArray <YTSupportLanguage*> *supports;

-(void)addInputOutputCountryCode:(NSString *)inputOutputCode andLangsDictionary:(NSDictionary *)langsDictionary;

@end
