//
//  BaseBannerItem.h
//  Unity-iPhone
//
//  Created by administrator on 16/3/9.
//
//

#import "DFBaseView.h"

@interface BaseBannerItem : DFBaseView

@property (nonatomic, retain) NSString *imageUrl;

- (void)updateView:(id)datas;

@end
