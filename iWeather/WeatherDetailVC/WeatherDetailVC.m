//
//  WeatherDetailVC.m
//  iWeather
//
//  Created by admin on 7/22/15.
//  Copyright (c) 2015 triocviet. All rights reserved.
//

#import "WeatherDetailVC.h"
#import "WeatherModel.h"
#import "ViewController.h"


static NSString * Celsius = @"°C";
static NSString * Fahrenheit = @"°F";

@interface WeatherDetailVC ()
@property (weak, nonatomic) IBOutlet UILabel *lLocation;
@property (weak, nonatomic) IBOutlet UIButton *btnTempetature;
@property (weak, nonatomic) IBOutlet UILabel *lblUnit;
@property (weak, nonatomic) IBOutlet UILabel *lblQuotation;
@property (strong, nonatomic) NSArray *mArrQtts;
@property (weak, nonatomic) IBOutlet UIImageView *imgWeather;

@end

@implementation WeatherDetailVC {
    bool isCelsiusUnit;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _mArrQtts = @[@"Ai ai cũng tưởng bậu hiền \n Cắn cơm không bể, cắn tiền bể hai",
                  @"Ai đem con sáo sang song \n Để cho con sáo sổ lồng bay cao",
                  @"Áo anh đứt chỉ đường tà \n  Vợ anh chưa có, mẹ già chưa khâu",
                  @"Ghét của nào trời trao của ấy.",
                  @"Coi trời bằng vung.",
                  @"Ăn mày đòi xôi gấc.",
                  @"Chưa đỗ ông nghè, đã đe hàng tổng.",
                  @"Ăn quả nhớ kẻ trồng cây",
                  @"Của đi thay người",
                  @"Đàn gảy tai trâu.",
                  @"Gieo nhân nào , gặt quả nấy",
                  @"Kiến tha lâu cũng đầy tổ",
                  ];
    [self showWeatherDetail:[self getWeatherInfo]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)showWeatherDetail:(WeatherModel *)weatherInfo {
    _lLocation.text = weatherInfo.location;
    [self showTemperature:weatherInfo.temp];
    [self showWeather:weatherInfo.weatherCode];
    [self chooseAQuotations];
}
- (IBAction)getWeatherInfo:(id)sender {
    [self showWeatherDetail:[self getWeatherInfo]];
}
-(WeatherModel *)getWeatherInfo {
    return [ViewController getWeatherInfo];
}
- (IBAction)switchTempUnit:(id)sender {
    [self switchTempUnit];
    float temp = _btnTempetature.titleLabel.text.floatValue;
    
    if (isCelsiusUnit) {
        temp = [self convertF2C:temp];
    } else {
        temp = [self convertC2F:temp];
    }
    
    NSString *tempStr = [NSString stringWithFormat:@"%2.1f",temp];
    [_btnTempetature setTitle:tempStr forState:UIControlStateNormal];
    [_btnTempetature setTitle:tempStr forState:UIControlStateSelected];
}

-(void) switchTempUnit {
    if (isCelsiusUnit) {
        _lblUnit.text = Fahrenheit;
        isCelsiusUnit = NO;
    } else {
        _lblUnit.text = Celsius;
        isCelsiusUnit = YES;
    }
}

-(void) showTemperature:(float) temp {
    if (_lblUnit.text.length<=0) {
        _lblUnit.text = Celsius;
        isCelsiusUnit = YES;
    }
    if (!isCelsiusUnit) {
        temp = [self convertC2F:temp];
    }
    
    NSString *tempStr = [NSString stringWithFormat:@"%2.1f",temp];
    [_btnTempetature setTitle:tempStr forState:UIControlStateNormal];
    [_btnTempetature setTitle:tempStr forState:UIControlStateSelected];
}

-(void) showWeather:(int) weatherCode {
    switch (weatherCode) {
        case wRainD:
            _imgWeather.image = [UIImage imageNamed:@"ic_rain_d"];
            break;
        case wThunderD:
            _imgWeather.image = [UIImage imageNamed:@"ic_thunder_d"];
            break;
        case wClearD:
            _imgWeather.image = [UIImage imageNamed:@"ic_clear_d"];
            break;
        case wCloudyD:
            _imgWeather.image = [UIImage imageNamed:@"ic_cloudy_d"];
            break;
        case wSnowD:
            _imgWeather.image = [UIImage imageNamed:@"ic_snow_d"];
            break;
        case wThunderN:
            _imgWeather.image = [UIImage imageNamed:@"ic_thunder_n"];
            break;
        case wRainN:
            _imgWeather.image = [UIImage imageNamed:@"ic_rain_n"];
            break;
        case wCloudyN:
            _imgWeather.image = [UIImage imageNamed:@"ic_cloudy_n"];
            break;
        case wSnowN:
            _imgWeather.image = [UIImage imageNamed:@"ic_snow_n"];
            break;
        default:
            // wClearN
            _imgWeather.image = [UIImage imageNamed:@"ic_clear_n"];
            break;
    }
}
-(void) chooseAQuotations {
    int index = arc4random_uniform(_mArrQtts.count);
    _lblQuotation.text = _mArrQtts[index];
}

-(float) convertC2F:(float ) celsius {
    float fahrenheit = celsius*9/5 +32;
    return fahrenheit;
}
-(float) convertF2C:(float ) fahrenheit {
    float celsius = (fahrenheit-32)*5/9;
    return celsius;
}

@end
