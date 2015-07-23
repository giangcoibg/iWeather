//
//  WeatherModel.m
//  iWeather
//
//  Created by admin on 7/22/15.
//  Copyright (c) 2015 triocviet. All rights reserved.
//

#import "WeatherModel.h"



@implementation WeatherModel {

}

-(id)initWith:(NSString *)location temp:(float)temp weatherCode:(int)weatherCode {
    self = [super init];
    self.location = location;
    self.temp = temp;
    self.weatherCode = weatherCode;
    return self;
}
@end
