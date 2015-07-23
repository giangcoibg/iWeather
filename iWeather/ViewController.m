//
//  ViewController.m
//  iWeather
//
//  Created by admin on 7/22/15.
//  Copyright (c) 2015 triocviet. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController {
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
+(WeatherModel *)getWeatherInfo {
    NSArray * arrLocation = @[@"Ha Noi",@"Hue",@"Ho Chi Minh",@"Da Nang",@"Nha Trang",@"Vinh",@"Bac Giang",];
    WeatherModel *weather = [[WeatherModel alloc] initWith:arrLocation[arc4random_uniform(arrLocation.count)] temp:14.0+arc4random_uniform(18) +(float) arc4random()/(float)INT32_MAX weatherCode:arc4random_uniform(9)];
    
    return weather;
}

@end
