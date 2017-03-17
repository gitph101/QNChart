//
//  QNChartModel.m
//  QNChart
//
//  Created by 研究院01 on 17/3/15.
//  Copyright © 2017年 YanJiuYuan. All rights reserved.
//

#import "QNChartInfo.h"

@implementation QNChartInfo

- (id)initWithInfoDic:(NSDictionary *)infoDic
{
    self = [super init];
    if(self){
        self.chartTitle = [infoDic objectForKey:@"chartTitle"];
        self.leftUnitInfo = [infoDic objectForKey:@"leftUnit"];
        self.rightUnitInfo = [infoDic objectForKey:@"rightUnit"];
        self.oneChartDescription = [infoDic objectForKey:@"oneChartDescription"];
        self.twoChartDescription = [infoDic objectForKey:@"twoChartDescription"];
    }
    return self;
}

@end
