//
//  GuidCollectionViewCell.m
//  OC.Tool
//
//  Created by xueranit on 2019/8/8.
//  Copyright © 2019 xr. All rights reserved.
//

#import "GuidCollectionViewCell.h"
@interface GuidCollectionViewCell (){
    __weak IBOutlet UIImageView *bgImgView;
    
}
@end
@implementation GuidCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    bgImgView.backgroundColor = UIColor.whiteColor;
}
-(void)setImg:(NSString *)imgName
{
    bgImgView.image = [UIImage imageNamed:imgName];
//    bgImgView.contentMode = UIViewContentModeScaleToFill;
}

@end
