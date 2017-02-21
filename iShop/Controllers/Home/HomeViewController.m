//
//  HomeViewController.m
//  iShop
//
//  Created by 周磊 on 2017/2/19.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "HomeViewController.h"
#import "ViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.titleLabel.text = @"首页";
    self.backButton.hidden = YES;
    
    UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
    but.frame = CGRectMake(100, 100, 50, 50);
    
    [but setTitle:@"点击" forState:UIControlStateNormal];
    
    [but setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [but addTarget:self action:@selector(ccchk) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:but];
    
}

-(void)ccchk {
    
    ViewController *vc = [[ViewController alloc]init];
//    vc.loadType = BasePresentType;
    [self.navigationController pushViewController:vc animated:YES];
    
}


@end
