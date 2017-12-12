//
//  YTSupportTests.m
//  YaTranslater
//
//  Created by Danil on 11.12.17.
//  Copyright © 2017 Danil. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "YTSupportLanguage.h"
#import "YTCountry.h"
#import "YTGetLangs.h"
#import "YTCoreDataService.h"

@interface YTSupportTests : XCTestCase

@end

@implementation YTSupportTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSupportInit {
    NSDictionary *serverDictionary = @{KeySupportLanguagesDirs: @[@"ru-en", @"ru-pl", @"ru-fr", @"en-ru", @"en-fr"],
                                       KeySupportLanguagesLangs: @{@"ru":@"русский",
                                                                   @"en":@"английский",
                                                                   @"fr":@"французкий",
                                                                   @"pl":@"польский"}};
    
    YTGetLangs *getLangs = [YTGetLangs new];
    //Read
    NSArray *inputOutputCodes = serverDictionary[KeySupportLanguagesDirs];
    NSDictionary *langsDictionary = serverDictionary[KeySupportLanguagesLangs];
    
    for (NSString *inputOutputCode in inputOutputCodes) {
        [getLangs addInputOutputCountryCode:inputOutputCode andLangsDictionary:langsDictionary];
    }
    
    //Check
    NSArray *supports = getLangs.supports;
    XCTAssertTrue(supports.count == 3);
    XCTAssertEqual(supports.count, 3);
    
    for (YTSupportLanguage *support in supports) {
        XCTAssertGreaterThanOrEqual(support.outputCountries.count, 1);
        XCTAssertTrue(support.inputCountry.code.length > 1);
        XCTAssertTrue(support.inputCountry.name.length > 1);
        
        for (YTCountry *country in support.outputCountries) {
            XCTAssertTrue(country.code.length >= 2, @"Code: %@", country.code);
            XCTAssertTrue(country.name.length > 2);
        }
    }
}



- (void)testSupportInitAndSaveToCoreData {
    
    NSDictionary *serverDictionary = @{KeySupportLanguagesDirs: @[@"ru-en", @"ru-pl", @"ru-fr", @"en-ru", @"en-fr"],
                                       KeySupportLanguagesLangs: @{@"ru":@"русский",
                                                                   @"en":@"английский",
                                                                   @"fr":@"французкий",
                                                                   @"pl":@"польский",
                                                                   @"udm":@"Udmurt"}};
    
    YTGetLangs *getLangs = [YTGetLangs new];
    //Read
    NSArray *inputOutputCodes = serverDictionary[KeySupportLanguagesDirs];
    NSDictionary *langsDictionary = serverDictionary[KeySupportLanguagesLangs];
    
    for (NSString *inputOutputCode in inputOutputCodes) {
        [getLangs addInputOutputCountryCode:inputOutputCode andLangsDictionary:langsDictionary];
    }
    
    //Save
    YTCoreDataService *cDataService = [YTCoreDataService new];
    [cDataService saveSupportLanguages:getLangs.supports];
    
    
    //ReadInput
    NSArray *inputCountries = [cDataService getInputCountries];
    XCTAssertEqual(inputCountries.count, 3);
    for (YTCountry *country in inputCountries) {
        XCTAssertTrue(country.code.length >= 2, @"Code: %@", country.code);
        XCTAssertTrue(country.name.length > 2);
    }
    
    //Read Output
    NSString *code = [(YTCountry*)inputCountries.firstObject code];
    NSArray *outputCountries = [cDataService getOutputCountriesWithInputCountryCode:code];
    XCTAssertGreaterThanOrEqual(<#expression1#>, <#expression2, ...#>)(outputCountries.count, 1);
    for (YTCountry *country in outputCountries) {
        XCTAssertTrue(country.code.length >= 2, @"Code: %@", country.code);
        XCTAssertTrue(country.name.length > 2);
    }
    
}



@end
