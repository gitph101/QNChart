//
//  SFBaseChartView.h
//  图表
//
//  Created by yake on 15/10/19.
//  Copyright (c) 2015年 qunian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QNChartInfo.h"
#define MARGIN_LEFT 35              //统计图的左间隔
#define MARGIN_TOP  70               //统计图的顶部间隔
#define MARGIN_DOWN 50               //统计图的底部间隔
#define Y_SECTION 4                 //纵坐标轴的区间数
#define DESCRIBE_WIDTH   80            //图表下方描述内容长度
#define DESCRIBE_HEIGHT  14           //图表下方描述内容高度

@interface SFBaseChartView : UIView

@property (strong, nonatomic) NSMutableArray *dataSource;

@property (nonatomic, strong) NSMutableArray * leftYCoordinateArray;

@property (nonatomic, strong) NSMutableArray * rightYCoordinateArray;

//纵坐标上标记点的间距(即虚线的间距)
@property (assign, nonatomic) CGFloat dashedSpace;

//纵坐标的数值间隔(显示出来的坐标值的间隔)
@property (assign, nonatomic) int leftYNumberSpace;

@property (assign, nonatomic) float rightYNumberSpace;

//横坐标之间的实际间距
@property (nonatomic, assign) int xdashedSpace;

//第一种图的颜色
@property (nonatomic, strong) UIColor * oneChartColor;

//第二种图的颜色
@property (strong, nonatomic) UIColor * twoChartColor;

//图表信息
@property (strong, nonatomic) QNChartInfo * chartInfo;

// 选择显示图表文字内容的按钮
@property (nonatomic, strong) UIButton * leftButton;

@property (nonatomic, strong) UIButton * rightButton;


/**
 *
 *
 *  构造函数
 *
 *  @param dataSource 数据源
 *  @param colorOone  第一种图的颜色
 *  @param colorTwo   第二种图的颜色
 */
- (id)initWithDataSource:(NSMutableArray *)dataSource oneChartColor:(UIColor *)colorOone twoChartColor:(UIColor *)colorTwo chartInfo:(QNChartInfo *)chartInfo;

@end
