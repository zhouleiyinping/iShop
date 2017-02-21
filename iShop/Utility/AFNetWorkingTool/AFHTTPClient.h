//
//  AFHTTPClient.h
//  iShop
//
//  Created by 周磊 on 2017/2/17.
//  Copyright © 2017年 zhuohan. All rights reserved.
//  封装网络请求相关

#import <Foundation/Foundation.h>

//AF请求超时的时间
#define kTimeoutInterval   30.

/**
 HTTP请求方式
 */
typedef enum : NSUInteger {
    HttpMethodGet = 1,
    HttpMethodPost  ,
    HttpMethodDelete,
} HttpMethod;


@class AFHTTPClient;

//请求成功
typedef void (^HTTPRequestSuccessBlock)(id responseObject);
//请求失败
typedef void (^HTTPRequestFailedBlock)(NSError *error);
//数据请求的进度
typedef void (^HTTPRequestProgressBlock)(NSProgress *requestProgress);
//上传成功
typedef void (^HTTPUploadSuccessBlock)(NSURLSessionDataTask *operation, id responseObject);
//上传失败
typedef void (^HTTPUploadFailedBlock)(NSURLSessionDataTask *operation, NSError *error);
// 下载成功
typedef void (^DownLoadSuccess)(NSURLResponse *response, NSURL *filePath);
//返回URL
typedef NSURL *(^Destination)(NSURL *targetPath, NSURLResponse *response);


@interface AFHTTPClient : NSObject

/**
 *  post请求
 *
 *  @param method           URL地址
 *  @param params           参数
 *  @param successReqBlock  成功
 *  @param failedReqBlock   失败
 *  @param progressReqBlock 进度
 *
 */
+ (void)postRequestWithMethod:(NSString *)method
                                 params:(NSDictionary *)params
                          progressBlock:(HTTPRequestProgressBlock)progressReqBlock
                           successBlock:(HTTPRequestSuccessBlock)successReqBlock
                            failedBlock:(HTTPRequestFailedBlock)failedReqBlock;
/**
 *  get请求
 *
 *  @param method           URL地址
 *  @param params           参数
 *  @param successReqBlock  成功
 *  @param failedReqBlock   失败
 *  @param progressReqBlock 进度
 *
 */
+ (void)getRequestWithMethod:(NSString *)method
                                params:(NSDictionary *)params
                         progressBlock:(HTTPRequestProgressBlock)progressReqBlock
                          successBlock:(HTTPRequestSuccessBlock)successReqBlock
                           failedBlock:(HTTPRequestFailedBlock)failedReqBlock;


+ (void)requestWithMethod:(NSString *)method
                             params:(NSDictionary *)params
                         httpMethod:(HttpMethod)httpMethod
                      progressBlock:(HTTPRequestProgressBlock)progressReqBlock
                       successBlock:(HTTPRequestSuccessBlock)successReqBlock
                        failedBlock:(HTTPRequestFailedBlock)failedReqBlock;





/**
 *  单张图片post上传
 *
 *  @param URLString        请求的链接
 *  @param parameters       请求的参数
 *  @param pic              上传的图片
 *  @param imageName        上传的图片名称
 *  @param successReqBlock  发送成功的回调
 *  @param failedReqBlock   发送失败的回调
 *  @param progressReqBlock 发送上传进度的回调
 */
+ (void)uploadWithURL:(NSString *)URLString
           parameters:(NSDictionary *)parameters
             andImage:(UIImage *)pic
            imageName:(NSString *)imageName
        progressBlock:(HTTPRequestProgressBlock)progressReqBlock
         successBlock:(HTTPUploadSuccessBlock)successReqBlock
          failedBlock:(HTTPUploadFailedBlock)failedReqBlock;



/**
 *  多张图片POST上传
 *
 *  @param URLString        请求的链接
 *  @param parameters       请求的参数
 *  @param picArray         存放图片模型（UpLoadPicModel）的数组
 *  @param successReqBlock  发送成功的回调
 *  @param failedReqBlock   发送失败的回调
 *  @param progressReqBlock 进度的回调
 */
+ (void)uploadWithURL:(NSString *)URLString
           parameters:(NSDictionary *)parameters
          andPicArray:(NSArray *)picArray
        progressBlock:(HTTPRequestProgressBlock)progressReqBlock
         successBlock:(HTTPUploadSuccessBlock)successReqBlock
          failedBlock:(HTTPUploadFailedBlock)failedReqBlock;


/**
 *  POST上传url资源
 *
 *  @param URLString        请求的链接
 *  @param parameters       请求的参数
 *  @param picUrl           上传的图片Url地址
 *  @param picName          上传的图片名称
 *  @param progressReqBlock 进度的回调
 *  @param successReqBlock  发送成功的回调
 *  @param failedReqBlock   发送失败的回调
 */
+ (void)uploadWithURL:(NSString *)URLString
           parameters:(NSDictionary *)parameters
             andPicUrl:(NSString *)picUrl
            picName:(NSString *)picName
        progressBlock:(HTTPRequestProgressBlock)progressReqBlock
         successBlock:(HTTPUploadSuccessBlock)successReqBlock
          failedBlock:(HTTPUploadFailedBlock)failedReqBlock;

/**
 *  下载
 *
 *  @param URLString        URL地址
 *  @param destination      返回URL
 *  @param downLoadSuccess  成功
 *  @param failedReqBlock   失败
 *  @param progressReqBlock 进度
 *
 *  @return NSURLSessionDownloadTask
 */
+ (NSURLSessionDownloadTask *)downLoadWithURL:(NSString *)URLString
                                  destination:(Destination)destination
                              downLoadSuccess:(DownLoadSuccess)downLoadSuccess
                                  failedBlock:(HTTPRequestFailedBlock)failedReqBlock
                                progressBlock:(HTTPRequestProgressBlock)progressReqBlock;


@end
