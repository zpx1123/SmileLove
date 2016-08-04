//
//  QQComposePhotosView.m
//  访问相册和相机
//
//  Created by lqq on 16/4/13.
//  Copyright © 2016年 LQQ. All rights reserved.
//


/**
 *  图片显示View
 */
//- (void)setUpPhotosView {
//    self.photosView = [[QQComposePhotosView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 510)];
//    self.photosView.delegate = self;
//    self.photosView.addButton.hidden = NO;
//    [self.view addSubview:self.photosView];
//    self.photosView = self.photosView;
//}
////添加图片
//- (void)addButtonClicked {
//    JKImagePickerController *imagePicker = [[JKImagePickerController alloc] init];
//    imagePicker.delegate = self;
//    imagePicker.showsCancelButton = YES;
//    imagePicker.minimumNumberOfSelection = 1;
//    imagePicker.maximumNumberOfSelection = 9;
//    imagePicker.selectedAssetArray = self.photosView.assetsArray;
//    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:imagePicker];
//    [self presentViewController:navigationController animated:YES completion:nil];
//}
//
//#pragma mark - JKImagePickerControllerDelegate
//- (void)imagePickerController:(JKImagePickerController *)imagePicker didSelectAsset:(JKAssets *)asset isSource:(BOOL)source {
//    [imagePicker dismissViewControllerAnimated:YES completion:nil];
//}
//- (void)imagePickerController:(JKImagePickerController *)imagePicker didSelectAssets:(NSArray *)assets isSource:(BOOL)source {
//    
//    self.photosView.assetsArray = [NSMutableArray arrayWithArray:assets];
//    [imagePicker dismissViewControllerAnimated:YES completion:^{
//        if (self.photosView.assetsArray.count > 0) {
//            //返回数据放到显示中
//            self.photosView.addButton.hidden = NO;
//        }
//        [self.photosView.collectionView reloadData];
//    }];
//    
//}
//- (void)imagePickerControllerDidCancel:(JKImagePickerController *)imagePicker {
//    [imagePicker dismissViewControllerAnimated:YES completion:nil];
//}
//- (void)updateImages {
//    NSMutableArray *upImages = [NSMutableArray array];
//    for (JKAssets *asset in self.photosView.assetsArray) {
//        [upImages addObject:asset.photo];
//    }
//    NSLog(@"%@", upImages);
//    //这里上传的图片应该是九宫格中还剩的图片
//    [QQQNSystemService qq_uploadImages:upImages token:self.token domain:self.domain progress:^(CGFloat progress) {
//        NSLog(@"上传图片的进度 == %lf", progress);
//    } success:^(NSArray *array) {
//        NSLog(@"图片地址 : %@", array);
//    } failure:^{
//        NSLog(@"上传失败");
//    }];
//}

#import "QQComposePhotosView.h"
#import "JKImagePickerController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "QQComposePhotoViewCell.h"
#import "QQComposeAddPhotoViewCell.h"
@interface QQComposePhotosView () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end
@implementation QQComposePhotosView

static NSString *kPhotoCellIdentifier = @"kPhotoCellIdentifier";
static NSString *kAddPhotoCellIdentifier = @"kAddPhotoCellIdentifier";
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 5.0;
        layout.minimumInteritemSpacing = 5.0;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(15, 5, frame.size.width - 30, frame.size.height - 10) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        [_collectionView registerClass:[QQComposePhotoViewCell class] forCellWithReuseIdentifier:kPhotoCellIdentifier];
        [_collectionView registerClass:[QQComposeAddPhotoViewCell class] forCellWithReuseIdentifier:kAddPhotoCellIdentifier];
        [self addSubview:_collectionView];
        UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongGesture:)];
        [_collectionView addGestureRecognizer:longGesture];
    }
    return self;
}
- (void)runInMainQueue:(void (^)())queue {
    dispatch_async(dispatch_get_main_queue(), queue);
}
- (void)runInGlobalQueue:(void(^)())queue {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), queue);
}
- (BOOL)endEditing:(BOOL)force {
    [super endEditing:false];
    [_collectionView endEditing:YES];
    return YES;
}
- (void)setAssetsArray:(NSMutableArray *)assetsArray {
    _assetsArray = assetsArray;
    NSMutableArray *tempBox = [NSMutableArray array];
    for (JKAssets *asset in assetsArray) {
        [tempBox addObject:asset.photo];
    }
    self.selectdPhotos = [NSArray arrayWithArray:tempBox];
}
#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = ([UIScreen mainScreen].bounds.size.width - 30 - 10) / 3;
    return CGSizeMake(width, width);
}
#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld", (long)indexPath.row);
}
#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    NSLog(@"%ld", (long)self.assetsArray.count);
    if (self.assetsArray.count == 9) {
        return 9;
    } else {
        return self.assetsArray.count + 1;
    }
  
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.assetsArray.count != 0 && indexPath.row < self.assetsArray.count) {
        QQComposePhotoViewCell *cell = (QQComposePhotoViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kPhotoCellIdentifier forIndexPath:indexPath];
        cell.asset = self.assetsArray[indexPath.row];
        cell.deletePhotoButton.tag = indexPath.row;
        cell.indexpath = indexPath;
        [cell.deletePhotoButton addTarget:self action:@selector(deleteView:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }
    QQComposeAddPhotoViewCell *cell = (QQComposeAddPhotoViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kAddPhotoCellIdentifier forIndexPath:indexPath];
    self.addButton = cell.addButton;
    [self.addButton addTarget:self action:@selector(addButtonAction) forControlEvents:UIControlEventTouchUpInside];
    return cell;
    
 
}
- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
        //取得item数据
        id objc = [self.assetsArray objectAtIndex:sourceIndexPath.item];
        //从资源数组中移除
        [self.assetsArray removeObject:objc];
        //将数据插入到目标位置
        [self.assetsArray insertObject:objc atIndex:destinationIndexPath.item];
        NSLog(@" --- %ld", destinationIndexPath.item);

}
/**
 *  长按图片可以调整顺序
 *
 *  @param sender
 */
- (void)handleLongGesture:(UILongPressGestureRecognizer *)sender {
    switch (sender.state) {
        case UIGestureRecognizerStateBegan: {
            //判断手势落点是否在路径上
            NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:[sender locationInView:self.collectionView]];
            id objc = [self.collectionView cellForItemAtIndexPath:indexPath];
            
            //当时添加的cell时不可以移动
            if (indexPath == nil || [objc isKindOfClass: [QQComposeAddPhotoViewCell class]]) {
                break;
            }
            //在路径上则开始移动该路径上的cell
            [self.collectionView beginInteractiveMovementForItemAtIndexPath:indexPath];
            
            break;
        }
        case UIGestureRecognizerStateChanged: {
            //移动过程中随时更新cell位置
            NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:[sender locationInView:self.collectionView]];
            id objc = [self.collectionView cellForItemAtIndexPath:indexPath];
            if (indexPath == nil || [objc isKindOfClass: [QQComposeAddPhotoViewCell class]]) {
                break;
            }
            [self.collectionView updateInteractiveMovementTargetPosition:[sender locationInView:self.collectionView]];
            break;
        }
        case UIGestureRecognizerStateEnded: {
            //移动结束后关闭cell移动
            [self.collectionView endInteractiveMovement];
            break;
        }
        default:
            [self.collectionView cancelInteractiveMovement];
            break;
        
    }
}
- (void)addButtonAction {
    [self.delegate addButtonClicked];
}
- (void)deleteView:(id)sender {
    NSInteger deletedPhoto = ((UIButton *)sender).tag;
    [self.assetsArray removeObjectAtIndex:deletedPhoto];
//    NSLog(@"删除tag: %ld", deletedPhoto);
    [self.collectionView reloadData];
}
@end
