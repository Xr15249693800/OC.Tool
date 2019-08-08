//
//  HomeViewController.m
//  OC.Tool
//
//  Created by xueranit on 2019/8/5.
//  Copyright © 2019 xr. All rights reserved.
//

#import "HomeViewController.h"

static NSString * const reuseIdentifier = @"HomeCell";
@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)UICollectionViewFlowLayout *layout;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    1.添加导航条
    [self.navigationItem setTitleView:[KOC_Control createNavigationNormalTitle:@"首页"]];
// mainScrollerView
    [self setupCollectionView];
//    刷新页面

}
#pragma mark ======mainScrollerView======
-(void)setupCollectionView{
    
    [self.view addSubview:self.collectionView];
}



#pragma mark ======UICollectionViewDasoure======
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 1;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    return cell;
}
#pragma mark ======懒加载======
-(UICollectionViewFlowLayout *)layout
{
    if (!_layout) {
        _layout = [[UICollectionViewFlowLayout alloc]init];
        _layout.minimumInteritemSpacing = 0;
        _layout.itemSize = self.view.bounds.size;
    }
    return _layout;
}
-(UICollectionView *)collectionView
{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:self.layout];
        _collectionView.backgroundColor = [UIColor redColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    }
    return _collectionView;
}
@end
