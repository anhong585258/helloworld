//
//  BaseTableViewCell.m
//  MyAppDemo
//
//  Created by zhangx on 2017/7/7.
//  Copyright © 2017年 zhangx. All rights reserved.
//

#import "DFBaseTableViewCell.h"

@implementation DFBaseTableViewCell
- (void)clearCellContentView{
        while ([self.contentView.subviews lastObject ]!=nil) {
            [(UIView*)[self.contentView.subviews lastObject]removeFromSuperview];
        }
}
- (void)clearCellView{
    while ([self.subviews lastObject ]!=nil) {
        [(UIView*)[self.subviews lastObject]removeFromSuperview];
    }

}
- (void)awakeFromNib{
    [super awakeFromNib];
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initView];
    }
    return self;
}
- (void)initView{
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
    
}
- (void)setCellVO:(id)vo{
    _vo = vo;
}
- (void)setDelegate:(id<UIViewCollectEventsDelegate>)delegate{
    _delegate = delegate;
}
- (void)uiView:(UIView *)uiView collectEventsType:(id)type params:(id)params{
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(uiView:collectEventsType:params:)]) {
            [self.delegate uiView:uiView collectEventsType:type params:params];
        }
    }
}
@end
