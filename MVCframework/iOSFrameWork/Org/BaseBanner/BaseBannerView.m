//
//  BaseBannerView.m
//  Unity-iPhone
//
//  Created by administrator on 16/3/9.
//
//

#import "BaseBannerView.h"
#import "BaseBannerItem.h"
#import "BaseBannerVO.h"

#define ITEM_WIDTH [UIScreen mainScreen].bounds.size.width

@implementation BaseBannerView

- (void)initProperties{
    
    _datas = [NSMutableArray array];
    
}

- (void)initView{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
   
    _scrollView.bounces = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.frame.size.height -8-5, ITEM_WIDTH, 5)];
    _pageControl.userInteractionEnabled = NO;
    _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
//    _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    _pageControl.currentPage = 0;
    [self addSubview:_scrollView];
    [self addSubview:_pageControl];
    
}

- (void)updateView:(id)datas{
    
    _datas = [NSMutableArray arrayWithArray:datas];
    
    _pageControl.numberOfPages = _datas.count;
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width * _datas.count,  _scrollView.frame.size.height);
    for (int i = 0; i < _datas.count; i++) {
        BaseBannerVO * vo = [_datas objectAtIndex:i];
        BaseBannerItem * item = [self createBannerItem];
        item.frame = CGRectMake(i * _scrollView.frame.size.width, 0,_scrollView.frame.size.width, _scrollView.frame.size.height);
            if (i%2==0) {
                item.backgroundColor = [UIColor purpleColor];
                [item updateView:vo];
            }else{
                item.backgroundColor = [UIColor blueColor];
                [item updateView:vo];
            }
            [_scrollView addSubview:item];
    }
   
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = (_scrollView.contentOffset.x+ITEM_WIDTH/2.0) / ITEM_WIDTH;
    if ([_datas count] > 1)
    {
        if (page >= _pageControl.numberOfPages)
        {
            page = 0;
        }else if(page <0)
        {
            page = _pageControl.numberOfPages -1;
        }
    }
    _pageControl.currentPage = page;
}
-(BaseBannerItem*)createBannerItem
{
    BaseBannerItem * item = [BaseBannerItem view:CGRectMake(0, 0, 0, 0)];
    return item;
}
@end
