//
//  ViewController.m
//  iShop
//
//  Created by 周磊 on 2017/2/15.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = kRandomColor;
    
   NSLog(@"-------%d",[UIDevice isSimulator]);

    NSLog(@"------ooo");
    
    NSLog(@"------wwwww");
    

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    [AFHTTPClient downLoadWithURL:@"https://v2-3rd-miner.baijincdn.com/file/8b812017fd28d7876f8dc33fd9caa61f?sdk_id=258&task_id=3364128173898924296&business_id=4097&bkt=p3-14008b812017fd28d7876f8dc33fd9caa61f5a23b2e10000017a3a00&xcode=8e857d541f9003061be6b616fbae6f003d3957cb6f1e3af30b2977702d3e6764&fid=1546552275-250528-651800563247057&time=1487312908&sign=FDTAXGERLBH-DCb740ccc5511e5e8fedcff06b081203-5cYQtLt%2B1m7eW1QavEctJHe%2B1DU%3D&to=sds&fm=Yan,B,U,nc&sta_dx=24787456&sta_cs=21001&sta_ft=avi&sta_ct=6&sta_mt=5&fm2=Yangquan,B,U,nc&newver=1&newfm=1&secfm=1&flow_ver=3&pkey=14008b812017fd28d7876f8dc33fd9caa61f5a23b2e10000017a3a00&sl=81068110&expires=8h&rt=pr&r=938886522&mlogid=1104050361702601903&vuk=1546552275&vbdid=4251695650&fin=01_%E5%9F%BA%E7%A1%80%E7%8F%AD%E4%BB%8B%E7%BB%8D.avi&fn=01_%E5%9F%BA%E7%A1%80%E7%8F%AD%E4%BB%8B%E7%BB%8D.avi&uta=0&rtype=1&iv=0&isw=0&dp-logid=1104050361702601903&dp-callid=0.1.1&sdk_id=258&hps=1&csl=10&csign=RLYF%2BIUngdweEdHfRuVdeM57l5Y%3D&by=flowserver" destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        
        NSLog(@"targetPath == %@, response == %@", targetPath, response);
        // 设置下载路径,通过沙盒获取缓存地址,最后返回NSURL对象
        NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"hhhh.mp3"];
        
        return [NSURL fileURLWithPath:filePath];

    } downLoadSuccess:^(NSURLResponse *response, NSURL *filePath) {
        // 下载完成调用的方法
        NSLog(@"下载完成\n%@--%@",response, filePath);
        
    } failedBlock:^(NSError *error) {
        NSLog(@"下载失败\n%@",error);
    } progressBlock:^(NSProgress *requestProgress) {
        //下载进度
        NSLog(@"progress == %@", requestProgress);
        NSLog(@"%lf", 1.0 * requestProgress.completedUnitCount / requestProgress.totalUnitCount);
        
    }];

}

@end
