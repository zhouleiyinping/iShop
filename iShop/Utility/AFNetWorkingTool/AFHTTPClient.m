//
//  AFHTTPClient.m
//  iShop
//
//  Created by 周磊 on 2017/2/17.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "AFHTTPClient.h"
#import "AFHTTPSessionManager.h"
#import "AFURLRequestSerialization.h"

@implementation AFHTTPClient


#pragma mark - 创建请求者
+(AFHTTPSessionManager *)manager {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 超时时间
    manager.requestSerializer.timeoutInterval = kTimeoutInterval;
    
    // 声明上传的是json格式的参数，需要后台约定好，不然会出现后台无法获取到上传的参数问题
    manager.requestSerializer = [AFHTTPRequestSerializer serializer]; // 上传普通格式
    
    // 声明获取到的数据格式
    manager.responseSerializer = [AFHTTPResponseSerializer serializer]; // AFN不会解析,数据是data，需要自己解析
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];

    return manager;
}

#pragma mark - post请求
+ (void)postRequestWithMethod:(NSString *)method
                                 params:(NSDictionary *)params
                          progressBlock:(HTTPRequestProgressBlock)progressReqBlock
                           successBlock:(HTTPRequestSuccessBlock)successReqBlock
                            failedBlock:(HTTPRequestFailedBlock)failedReqBlock{
    
    [self requestWithMethod:method params:params httpMethod:HttpMethodPost  progressBlock:progressReqBlock successBlock:successReqBlock failedBlock:failedReqBlock];
}
#pragma mark - get请求
+ (void)getRequestWithMethod:(NSString *)method
                                params:(NSDictionary *)params
                         progressBlock:(HTTPRequestProgressBlock)progressReqBlock
                          successBlock:(HTTPRequestSuccessBlock)successReqBlock
                           failedBlock:(HTTPRequestFailedBlock)failedReqBlock{
    
    return [self requestWithMethod:method params:params httpMethod:HttpMethodGet progressBlock:progressReqBlock successBlock:successReqBlock failedBlock:failedReqBlock];
}

#pragma mark - 处理请求
+ (void)requestWithMethod:(NSString *)method
                             params:(NSDictionary *)params
                         httpMethod:(HttpMethod)httpMethod
                      progressBlock:(HTTPRequestProgressBlock)progressReqBlock
                       successBlock:(HTTPRequestSuccessBlock)successReqBlock
                        failedBlock:(HTTPRequestFailedBlock)failedReqBlock{
    
    
    // 判断有无网络
    if ([AFHTTPUtility connectedToNetwork] == NO) {
        // ...<无网络>...<不进行网络请求>
        return;
    }
    
    NSString *requestUrl = method;
    requestUrl = [requestUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *requestParams = [AFHTTPUtility getRequestAllDict:params];
    AFHTTPSessionManager *manager = [self manager];
    
    [kApplication setNetworkActivityIndicatorVisible:YES]; // 开启状态栏动画

        if (httpMethod == HttpMethodGet) {
            
            [manager GET:requestUrl parameters:requestParams progress:^(NSProgress * _Nonnull downloadProgress) {
                if (downloadProgress) {
                    if (progressReqBlock) {
                        progressReqBlock(downloadProgress);
                    }
                }
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                
#if LogDebugPrintJSONString
                NSString *originJsonString = [(NSDictionary *) responseObject convertToJsonString];
                NSLog(@"\n\n【 %@ 】请求返回内容:\n%@\n\n", method, originJsonString);
#else
                NSLog(@"【 %@ 】请求返回内容:\n%@", method, (NSDictionary *) responseObject);
#endif
                
                 // 请求成功
                if (responseObject) {
                    if (successReqBlock) {
                        successReqBlock(responseObject);
                    }
                }else {
                    if (successReqBlock) {
                        successReqBlock(@{@"msg":@"暂无数据"});
                    }
                }
                
                [kApplication setNetworkActivityIndicatorVisible:NO]; // 关闭状态栏动画

                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                NSLog(@"Error: %@", [error description]);
                // 请求失败
                if (failedReqBlock) {
                    failedReqBlock(error);
                }
                [kApplication setNetworkActivityIndicatorVisible:NO]; // 关闭状态栏动画
            }];
            
        }else if (httpMethod == HttpMethodPost) {
            
            [manager POST:requestUrl parameters:requestParams progress:^(NSProgress * _Nonnull uploadProgress) {
                if (uploadProgress) {
                    if (progressReqBlock) {
                        progressReqBlock(uploadProgress);
                    }
                }
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
#if LogDebugPrintJSONString
                NSString *originJsonString = [(NSDictionary *) responseObject convertToJsonString];
                NSLog(@"\n\n【 %@ 】请求返回内容:\n%@\n\n", method, originJsonString);
#else
                NSLog(@"【 %@ 】请求返回内容:\n%@", method, (NSDictionary *) responseObject);
#endif
                
                // 请求成功
                if (responseObject) {
                    if (successReqBlock) {
                        successReqBlock(responseObject);
                    }
                }else {
                    if (successReqBlock) {
                        successReqBlock(@{@"msg":@"暂无数据"});
                    }
                }
                
                [kApplication setNetworkActivityIndicatorVisible:NO]; // 关闭状态栏动画

                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                // 请求失败
                if (failedReqBlock) {
                    failedReqBlock(error);
                }
                [kApplication setNetworkActivityIndicatorVisible:NO]; // 关闭状态栏动画

            }];
            
        }else if (httpMethod == HttpMethodDelete) {
            
            [manager DELETE:requestUrl parameters:requestParams success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
#if LogDebugPrintJSONString
                NSString *originJsonString = [(NSDictionary *) responseObject convertToJsonString];
                NSLog(@"\n\n【 %@ 】请求返回内容:\n%@\n\n", method, originJsonString);
#else
                NSLog(@"【 %@ 】请求返回内容:\n%@", method, (NSDictionary *) responseObject);
#endif
                
                // 请求成功
                if (responseObject) {
                    if (successReqBlock) {
                        successReqBlock(responseObject);
                    }
                }else {
                    if (successReqBlock) {
                        successReqBlock(@{@"msg":@"暂无数据"});
                    }
                }
                [kApplication setNetworkActivityIndicatorVisible:NO]; // 关闭状态栏动画

                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                // 请求失败
                if (failedReqBlock) {
                    failedReqBlock(error);
                }
                [kApplication setNetworkActivityIndicatorVisible:NO]; // 关闭状态栏动画

            }];
            
        }
    
}

#pragma mark - 单张图片上传
+ (void)uploadWithURL:(NSString *)URLString
           parameters:(NSDictionary *)parameters
             andImage:(UIImage *)pic
            imageName:(NSString *)imageName
        progressBlock:(HTTPRequestProgressBlock)progressReqBlock
         successBlock:(HTTPUploadSuccessBlock)successReqBlock
          failedBlock:(HTTPUploadFailedBlock)failedReqBlock {
    
    // 判断有无网络
    if ([AFHTTPUtility connectedToNetwork] == NO) {
        // ...<无网络>...<不进行网络请求>
        return;
    }
    
    NSString *requestUrl = URLString;
    NSDictionary *requestParams = [AFHTTPUtility getRequestAllDict:parameters];
    AFHTTPSessionManager *manager = [self manager];

    [manager POST:requestUrl parameters:requestParams constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        /**
         *  压缩图片然后再上传(1.0代表无损 0~~1.0区间)
         */
        NSData *data = UIImageJPEGRepresentation(pic, 1.0);

        NSString *fileName = [NSString stringWithFormat:@"%@.jpg", imageName];
        
        [formData appendPartWithFileData:data name:imageName fileName:fileName mimeType:@"image/jpeg"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progressReqBlock) {
            progressReqBlock(uploadProgress);
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successReqBlock)  {
            successReqBlock(task,responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failedReqBlock)  {
            failedReqBlock(task,error);
        }
    }];
    
}
#pragma mark - 多张图片上传
+ (void)uploadWithURL:(NSString *)URLString
           parameters:(NSDictionary *)parameters
          andPicArray:(NSArray *)picArray
        progressBlock:(HTTPRequestProgressBlock)progressReqBlock
         successBlock:(HTTPUploadSuccessBlock)successReqBlock
          failedBlock:(HTTPUploadFailedBlock)failedReqBlock {
    
    // 判断有无网络
    if ([AFHTTPUtility connectedToNetwork] == NO) {
        // ...<无网络>...<不进行网络请求>
        return;
    }
    
    NSString *requestUrl = URLString;
    NSDictionary *requestParams = [AFHTTPUtility getRequestAllDict:parameters];
    AFHTTPSessionManager *manager = [self manager];

    [manager POST:requestUrl parameters:requestParams constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSInteger count = picArray.count;
        NSString *fileName = @"";
        NSData *data = [NSData data];
        
        for (int i = 0; i < count; i++)  {
            
            @autoreleasepool {
                
                UpLoadPicModel *picModle = picArray[i];
                
                fileName = [NSString stringWithFormat:@"pic%02d.jpg", i];
                /**
                 *  压缩图片然后再上传(1.0代表无损 0~~1.0区间)
                 */
                data = UIImageJPEGRepresentation(picModle.pic, 1.0);
                
                [formData appendPartWithFileData:data name:picModle.picName fileName:fileName mimeType:@"image/jpeg"];
                
                data = nil;
                picModle.pic = nil;
            }
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progressReqBlock) {
            progressReqBlock(uploadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successReqBlock)  {
            successReqBlock(task,responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failedReqBlock)  {
            failedReqBlock(task,error);
        }
    }];
}
#pragma mark - url图片地址上传
+ (void)uploadWithURL:(NSString *)URLString
           parameters:(NSDictionary *)parameters
            andPicUrl:(NSString *)picUrl
              picName:(NSString *)picName
        progressBlock:(HTTPRequestProgressBlock)progressReqBlock
         successBlock:(HTTPUploadSuccessBlock)successReqBlock
          failedBlock:(HTTPUploadFailedBlock)failedReqBlock {
    
    // 判断有无网络
    if ([AFHTTPUtility connectedToNetwork] == NO) {
        // ...<无网络>...<不进行网络请求>
        return;
    }
    
    NSString *requestUrl = URLString;
    NSDictionary *requestParams = [AFHTTPUtility getRequestAllDict:parameters];
    AFHTTPSessionManager *manager = [self manager];

    [manager POST:requestUrl parameters:requestParams constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSString *fileName = [NSString stringWithFormat:@"%@.jpg", picName];
        // 根据本地路径获取url(相册等资源上传)
        NSURL *url = [NSURL fileURLWithPath:picUrl]; // [NSURL URLWithString:picUrl] 可以换成网络的图片在上传
        
        [formData appendPartWithFileURL:url name:picName fileName:fileName mimeType:@"application/octet-stream" error:nil];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progressReqBlock) {
            progressReqBlock(uploadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successReqBlock)  {
            successReqBlock(task,responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failedReqBlock)  {
            failedReqBlock(task,error);
        }
    }];
    
}

#pragma mark - 下载
+ (NSURLSessionDownloadTask *)downLoadWithURL:(NSString *)URLString
                                  destination:(Destination)destination
                              downLoadSuccess:(DownLoadSuccess)downLoadSuccess
                                  failedBlock:(HTTPRequestFailedBlock)failedReqBlock
                                progressBlock:(HTTPRequestProgressBlock)progressReqBlock {
    
    // 判断有无网络
    if ([AFHTTPUtility connectedToNetwork] == NO) {
        // ...<无网络>...<不进行网络请求>
        return nil;
    }
    
    NSString *requestUrl = URLString;
    AFHTTPSessionManager *manager = [self manager];

    NSURL *url = [NSURL URLWithString:requestUrl];

    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    // 下载任务
    NSURLSessionDownloadTask *task = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
        if (progressReqBlock)  {
            progressReqBlock(downloadProgress);
        }
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        if (destination)  {
            return destination(targetPath, response);
        }   else  {
            return nil;
        }
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        if (error)  {
            if (failedReqBlock) {
                failedReqBlock(error);
            }
        }  else  {
            if (downLoadSuccess) {
                downLoadSuccess(response, filePath);
            }
        }
    }];
    // 开始启动任务
    [task resume];
    return task;
}

@end
