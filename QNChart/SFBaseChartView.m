//
//  SFBaseChartView.m
//  图表
//
//  Created by yake on 15/10/19.
//  Copyright (c) 2015年 yake. All rights reserved.
//

#import "SFBaseChartView.h"
#import "QNChartModel.h"

@implementation SFBaseChartView

- (id)initWithDataSource:(NSMutableArray *)dataSource oneChartColor:(UIColor *)colorOone twoChartColor:(UIColor *)colorTwo chartInfo:(QNChartInfo *)chartInfo
{
    self = [super init];
    if(self){
        self.dataSource = dataSource;
        self.oneChartColor = colorOone;
        self.twoChartColor = colorTwo;
        self.chartInfo = chartInfo;
        }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [self drawCoordinate];
    
    [self buildLabels];
}


- (void)drawCoordinate
{
    
    CGContextRef currentCtx = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(currentCtx, [[UIColor grayColor] CGColor]);
    CGContextSetLineWidth(currentCtx, 0.5);
    
    // 1.绘制x轴和y轴
    CGPoint points1[] = {CGPointMake(MARGIN_LEFT, MARGIN_TOP),CGPointMake(MARGIN_LEFT, self.frame.size.height - MARGIN_DOWN)};

    CGPoint points2[] = {CGPointMake(MARGIN_LEFT, self.frame.size.height - MARGIN_DOWN),CGPointMake(self.frame.size.width - MARGIN_LEFT, self.frame.size.height - MARGIN_DOWN)};
    
    CGPoint points3[] = {CGPointMake(self.frame.size.width - MARGIN_LEFT, self.frame.size.height - MARGIN_DOWN),CGPointMake(self.frame.size.width-MARGIN_LEFT,MARGIN_TOP)};
    
    CGContextAddLines(currentCtx, points1, 2);
    CGContextAddLines(currentCtx, points2, 2);
    CGContextAddLines(currentCtx, points3, 2);

    
    CGContextClosePath(currentCtx);
    CGContextStrokePath(currentCtx);
    
    // 2.设置纵坐标
    self.leftYNumberSpace = [[self.leftYCoordinateArray objectAtIndex:0] intValue] - [[self.leftYCoordinateArray objectAtIndex:1] intValue];
    self.rightYNumberSpace = [[self.rightYCoordinateArray objectAtIndex:0] floatValue] - [[self.rightYCoordinateArray objectAtIndex:1] floatValue];
    self.dashedSpace = (self.frame.size.height - MARGIN_TOP - MARGIN_DOWN)/Y_SECTION;
    for(int index = 0; index < Y_SECTION+1; index++){
        CGPoint leftCenterPoint = CGPointMake(MARGIN_LEFT/2, MARGIN_TOP + self.dashedSpace * index);
        CGPoint rightCenterPoint = CGPointMake(self.frame.size.width - MARGIN_LEFT/2, MARGIN_TOP + self.dashedSpace * index);
        
        CGRect bounds = CGRectMake(0, 0, MARGIN_LEFT - 2, 15);
        
        UILabel * leftyNumber = [self createLabelWithCenter:leftCenterPoint withBounds:bounds withText:[self.leftYCoordinateArray objectAtIndex:index] withTextAlignment:NSTextAlignmentRight];
        NSString * rightText = [NSString stringWithFormat:@"%.f%%",[[self.rightYCoordinateArray objectAtIndex:index] floatValue]*100];
        UILabel * rightyNumber = [self createLabelWithCenter:rightCenterPoint withBounds:bounds withText:rightText withTextAlignment:NSTextAlignmentLeft];
        [self addSubview:leftyNumber];
        [self addSubview:rightyNumber];
    }
    // 3.设置横坐标
    self.xdashedSpace = (self.frame.size.width - MARGIN_LEFT*2)/(self.dataSource.count);
    
    for(int index = 0; index < [self.dataSource count];index++){
        
        CGRect bounds = CGRectMake(0, 0, self.xdashedSpace + 18, 15);
        CGPoint centerPoint = CGPointMake(MARGIN_LEFT + self.xdashedSpace * (index+0.5), self.frame.size.height - (MARGIN_DOWN - bounds.size.height/2));
        QNChartModel * item = [self.dataSource objectAtIndex:index];
        
        UILabel * xNumber = [self createLabelWithCenter:centerPoint withBounds:bounds withText:item.coordinateXValue withTextAlignment:NSTextAlignmentCenter];
      [self addSubview:xNumber];
        
    }
}

- (void)buildLabels
{
    //1.标题
//    SFUUTitleLableView * titleView = [[SFUUTitleLableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 36)];
//    titleView.titleLable.text = self.chartInfo.chartTitle;
//    [self addSubview:titleView];
    
    //2.表头左上方描述性文字
    UILabel * leftUnitLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 70, 25)];
    CGPoint center = CGPointMake(MARGIN_LEFT, MARGIN_TOP - 20);
    leftUnitLabel.center = center;
//    leftUnitLabel.font = [Utilities getFont:24.0];
    leftUnitLabel.textColor = [UIColor grayColor];
    leftUnitLabel.textAlignment = NSTextAlignmentCenter;
    leftUnitLabel.text = self.chartInfo.leftUnitInfo;
    [self addSubview:leftUnitLabel];
    
    //3.表头右上方描述性文字
    UILabel * rightUnitLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 70, 25)];
    CGPoint rightCenter = CGPointMake(self.frame.size.width - MARGIN_LEFT, MARGIN_TOP - 20);
    rightUnitLabel.center = rightCenter;
//    rightUnitLabel.font = [Utilities getFont:24.0];
    rightUnitLabel.textColor = [UIColor grayColor];
    rightUnitLabel.textAlignment = NSTextAlignmentCenter;
    rightUnitLabel.text = self.chartInfo.rightUnitInfo;
    [self addSubview:rightUnitLabel];
    
    
    //4.下方图表区分说明
    UIView * oneDescribe = [self createDescribeLabelWithColor:self.twoChartColor subTitle:self.chartInfo.oneChartDescription withPosition:@"left"];
    oneDescribe.center = CGPointMake(self.frame.size.width/2 - oneDescribe.frame.size.width/2 - 10, self.frame.size.height - 10 - oneDescribe.frame.size.height/2);
    [self addSubview:oneDescribe];
    
    UIView * twoDescribe = [self createDescribeLabelWithColor:self.oneChartColor subTitle:self.chartInfo.twoChartDescription withPosition:@"right"];
    twoDescribe.center = CGPointMake(self.frame.size.width/2 + 10 + twoDescribe.frame.size.width/2, self.frame.size.height - twoDescribe.frame.size.height/2 - 10);
    [self addSubview:twoDescribe];
}
/**
 *
 *
 *  UILabel的工厂方法
 *
 *  @param centerPoint   label的中心
 *  @param bounds        label的大小
 *  @param labelText     label的内容
 *  @param textAlignment label的内容排版方式
 *
 */
- (UILabel *)createLabelWithCenter:(CGPoint)centerPoint withBounds:(CGRect)bounds withText:(NSString *)labelText withTextAlignment:(NSTextAlignment)textAlignment
{
    UILabel * label = [[UILabel alloc] init];
    label.center = centerPoint;
    label.bounds = bounds;
    label.textAlignment = textAlignment;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:10.0];
    label.textAlignment = textAlignment;
    label.text = labelText;
    return label;
}

- (UIView *)createDescribeLabelWithColor:(UIColor *)color subTitle:(NSString *)subTitle withPosition:(NSString *)position
{
    UIView * bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DESCRIBE_WIDTH, DESCRIBE_HEIGHT)];
    UIButton * colorButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, DESCRIBE_HEIGHT, DESCRIBE_HEIGHT)];
    colorButton.backgroundColor = color;
    colorButton.layer.cornerRadius = DESCRIBE_HEIGHT/2;
    [bgView addSubview:colorButton];
    if([position isEqualToString:@"left"]){
        self.leftButton = colorButton;
    }else{
        self.rightButton = colorButton;
    }
    
    UILabel * describeLabel = [[UILabel alloc] initWithFrame:CGRectMake(colorButton.frame.origin.x + colorButton.frame.size.width + 6, 0, bgView.frame.size.width - colorButton.frame.origin.x - colorButton.frame.size.width - 10, DESCRIBE_HEIGHT)];
    describeLabel.text = subTitle;
    describeLabel.font = [UIFont systemFontOfSize:12.0];
    describeLabel.textAlignment = NSTextAlignmentCenter;
    describeLabel.textColor = [UIColor blackColor];
    [bgView addSubview:describeLabel];
    return bgView;
}
@end
