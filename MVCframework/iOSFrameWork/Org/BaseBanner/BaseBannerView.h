//
//  BaseBannerView.h
//  Unity-iPhone
//
//  Created by administrator on 16/3/9.
//
//

#import "DFBaseView.h"
#import "BaseBannerItem.h"

@interface BaseBannerView : DFBaseView <UIScrollViewDelegate>

@property (nonatomic,copy)NSMutableArray *datas;

@property (nonatomic,retain)UIScrollView *scrollView;

@property (nonatomic,retain)UIPageControl *pageControl;

@property (nonatomic,assign)BOOL isAutoPaly;

-(BaseBannerItem*)createBannerItem;

@end
