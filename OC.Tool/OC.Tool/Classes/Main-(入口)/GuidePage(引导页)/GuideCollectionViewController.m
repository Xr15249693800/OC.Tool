//
//  GuideCollectionViewController.m
//  OC.Tool
//
//  Created by xueranit on 2019/8/8.
//  Copyright © 2019 xr. All rights reserved.
//

#import "GuideCollectionViewController.h"
#import "GuidCollectionViewCell.h"

@interface GuideCollectionViewController ()

@end

@implementation GuideCollectionViewController

static NSString * const reuseIdentifier = @"guideCell";

-(instancetype)init{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = kScreenBounds.size;
    layout.minimumLineSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    return [super initWithCollectionViewLayout:layout];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = UIColor.whiteColor;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.bounces = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([GuidCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];

}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GuidCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    if (kiPhone_X) {
         [cell setImg:[NSString stringWithFormat:@"BigGuide%ld",indexPath.row]];
    }else{
         [cell setImg:[NSString stringWithFormat:@"Guide%ld",indexPath.row]];
    }
   
    
    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld", indexPath.row);
    if (indexPath.row == 1) {
        
        //    跳转到登录界面
        
        OC_NavigationController *nav = [[OC_NavigationController alloc]initWithRootViewController:[LoginViewController new]];
        kKeyWindow.rootViewController = nav;
        CATransition *anim = [CATransition animation];
        anim.duration = 0.5;
        anim.type = @"rippleEffect";
        [kKeyWindow.layer addAnimation:anim forKey:nil];
    }
}
@end
