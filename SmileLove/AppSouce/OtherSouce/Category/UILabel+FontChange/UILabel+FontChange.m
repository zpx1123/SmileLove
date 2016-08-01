//
//  UILabel+FontChange.m
//  LiquoriceDoctorProject
//
//  Created by HenryCheng on 15/12/7.
//  Copyright © 2015年 iMac. All rights reserved.
//

#import "UILabel+FontChange.h"
#import <objc/runtime.h>

#define CustomFontName @"FZLBJW--GB1-0"

@implementation UILabel (FontChange)

//+ (void)load {
//   
//    SEL origSel = @selector(willMoveToSuperview:);
//    SEL swizSel = @selector(myWillMoveToSuperview:);
//    [UILabel swizzleMethods:[self class] originalSelector:origSel swizzledSelector:swizSel];
//}
////exchange implementation of two methods
//+ (void)swizzleMethods:(Class)class originalSelector:(SEL)origSel swizzledSelector:(SEL)swizSel
//{
//    Method origMethod = class_getInstanceMethod(class, origSel);
//    Method swizMethod = class_getInstanceMethod(class, swizSel);
//    
//    //class_addMethod will fail if original method already exists
//    BOOL didAddMethod = class_addMethod(class, origSel, method_getImplementation(swizMethod), method_getTypeEncoding(swizMethod));
//    if (didAddMethod) {
//        class_replaceMethod(class, swizSel, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
//    } else {
//        //origMethod and swizMethod already exist
//        method_exchangeImplementations(origMethod, swizMethod);
//    }
//}
//- (void)myWillMoveToSuperview:(UIView *)newSuperview {
//    
//    [self myWillMoveToSuperview:newSuperview];
////    if ([self isKindOfClass:NSClassFromString(@"UIButtonLabel")]) {
////        return;
////    }
//    if (self) {
//        
//        if (self.tag == 10086) {
//            self.font = [UIFont systemFontOfSize:self.font.pointSize];
//        } else {
//            if ([UIFont fontNamesForFamilyName:CustomFontName])
//                self.font  = [UIFont fontWithName:CustomFontName size:self.font.pointSize];
//            
//        }
//    }
//
//}


@end
