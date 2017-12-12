//
//  YTCoreDataService.m
//  YaTranslater
//
//  Created by Danil on 12.12.17.
//  Copyright © 2017 Danil. All rights reserved.
//



#import "YTCoreDataService.h"
#import "AppDelegate.h"

@interface YTCoreDataService ()
@property (strong, nonatomic, readonly) NSManagedObjectContext *managedObjectContext;
@end

@implementation YTCoreDataService

#pragma mark - Save
-(void)saveSupportLanguages:(NSArray<YTSupportLanguage *> *)supports {
    
}
#pragma mark - Getter
-(NSArray<YTCountry *> *)getInputCountries {
    return @[];
}

-(NSArray<YTCountry *> *)getOutputCountriesWithInputCountryCode:(NSString *)inputCountryCode {
    return @[];
}

#pragma mark - Property

-(NSManagedObjectContext *)managedObjectContext {
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    return app.persistentContainer.viewContext;
}


@end
