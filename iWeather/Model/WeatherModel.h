//
//  WeatherModel.h
//  iWeather
//
//  Created by admin on 7/22/15.
//  Copyright (c) 2015 triocviet. All rights reserved.
//

#import <Foundation/Foundation.h>

enum {
    wThunderD = 0,
    wClearD =1,
    wRainD=2,
    wSnowD=3,
    wCloudyD=4,
    wThunderN = 5,
    wClearN =6,
    wRainN=7,
    wSnowN=8,
    wCloudyN=9
};


@interface WeatherModel : NSObject
@property (nonatomic,strong) NSString *location;
@property (nonatomic,assign) float temp;
@property (nonatomic,assign) int weatherCode;
-(id) initWith:(NSString *) location temp:(float)temp weatherCode:(int)weatherCode;
@end
