//
//  CyclePicView.m
//  OC.Tool
//
//  Created by xueranit on 2019/8/9.
//  Copyright © 2019 xr. All rights reserved.
//

#import "CyclePicView.h"

@implementation CyclePicView
+(CyclePicView*)creatCyclePicView{
    
    return [CyclePicView viewFromXib];
}
- (void)awakeFromNib{
    [super awakeFromNib];
    
    
}

@end
