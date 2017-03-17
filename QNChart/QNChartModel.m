//
//  QNChartModel.m
//  QNChart
//
//  Created by 研究院01 on 17/3/15.
//  Copyright © 2017年 YanJiuYuan. All rights reserved.
//

#import "QNChartModel.h"

@implementation QNChartModel

- (id)initWithXValue:(NSString *)xValue LeftYValue:(NSString *)leftYValue RightYValue:(NSString *)rightYValue{
    self = [super init];
    if (self)
    {
        self.coordinateXValue = xValue;
        self.coordinateLeftYValue = leftYValue;
        self.coordinateRightYValue = rightYValue;
    }
    return self;
}


@end
