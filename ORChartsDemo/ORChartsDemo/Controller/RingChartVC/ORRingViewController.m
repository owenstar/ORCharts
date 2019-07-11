//
//  ORRingViewController.m
//  ORChartView
//
//  Created by OrangesAL on 2019/4/27.
//  Copyright © 2019年 OrangesAL. All rights reserved.
//

#import "ORRingViewController.h"
#import "ORRingChartView.h"

@interface ORRingViewController ()<ORRingChartViewDatasource> {
    NSInteger _randowValue;
}

@property (nonatomic, strong) ORRingChartView *ringView;

@end

@implementation ORRingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _randowValue = 8;
    self.view.backgroundColor = [UIColor blackColor];
    
    ORRingChartView *ringView = [ORRingChartView new];
    
    ringView.config.neatInfoLine = YES;
    
    ringView.dataSource = self;
    ringView.frame = CGRectMake(0, 0, 375, 375);
    ringView.center = self.view.center;
    
    
    [self.view addSubview:ringView];
    
    self.ringView = ringView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.ringView.style = arc4random() % 3;
    _randowValue = arc4random() % 10 + 1;
    [self.ringView reloadData];
}

- (NSInteger)numberOfRingsOfChartView:(ORRingChartView *)chartView {
    return _randowValue;
}

- (CGFloat)chartView:(ORRingChartView *)chartView valueAtRingIndex:(NSInteger)index {
    return arc4random() % 50 + 10;
}

- (UIView *)chartView:(ORRingChartView *)chartView viewForTopInfoAtRingIndex:(NSInteger)index {
    UILabel *label = [UILabel new];
    label.text = [NSString stringWithFormat:@"TopIndex %zd", index];
    label.font = [UIFont systemFontOfSize:12];
    label.textColor = [UIColor redColor];
    [label sizeToFit];
    return label;
}

- (UIView *)chartView:(ORRingChartView *)chartView viewForBottomInfoAtRingIndex:(NSInteger)index {
    UILabel *label = [chartView dequeueBottomInfoViewAtIndex:index];
    if (!label) {
        label = [UILabel new];
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor lightGrayColor];
    }
    label.text = [NSString stringWithFormat:@"BotIndex %zd", index];
    [label sizeToFit];
    return label;
}

- (CGFloat)chartView:(ORRingChartView *)chartView pointWidthForInfoLineAtRingIndex:(NSInteger)index {
    return 4;
}

@end
