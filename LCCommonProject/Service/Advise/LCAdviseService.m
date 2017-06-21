//
//  LCAdviseService.m
//  LCCommonProject
//
//  Created by 刘成 on 17/3/28.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import "LCAdviseService.h"
#import "FMDB.h"
#import "LCAdviseView.h"
#import "LCAdviseWebController.h"

@implementation LCAdviseService

static FMDatabase *_db;

#define SaveTablePath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject]stringByAppendingPathComponent:@"advise.sqlite"]


+(void)initialize{
    [self createAdviseDB];
}

+ (BOOL)createAdviseDB {
    _db = [FMDatabase databaseWithPath:SaveTablePath];
    if ([_db open]) {
        
        if ([_db executeUpdate:@"create table if not exists t_advise(imageUrl text, adviseUrl text, imageData blob, adviseId integer)"]) {
                NSLog(@"创建成功");
            [_db close];
            return YES;
        }else {
            NSLog(@"创建失败");
            [_db close];
            return NO;
        }
    }else {
        NSLog(@"打开数据库失败");
        return NO;
    }
}

+(BOOL)addAdvise:(AdviseModel *)adviseInfo{
    if ([_db open]) {
        return [_db executeUpdateWithFormat:@"INSERT INTO t_advise(imageUrl, adviseUrl, imageData, adviseId) VALUES(%@,%@,%@,%@);",adviseInfo.imageUrl,adviseInfo.adviseUrl,adviseInfo.imageData,adviseInfo.adviseId];
    }
    return NO;
}

+(BOOL)deleteAllAdvise{
    
    if ([_db open]) {
        return [_db executeUpdateWithFormat:@"delete from t_advise;"];
    }
    return NO;
}

/**
 获取广告数据列表,一般只有一个,不为0则调用showAdvise
 
 @return AdviseModel的列表
 */

+(NSArray *)getAdviseList{
    if([_db open]){
        NSString *str=[NSString stringWithFormat:@"SELECT * FROM t_advise"];
        FMResultSet *set = [_db executeQuery: str];
        NSMutableArray *marr = [NSMutableArray array];
        while (set.next) {
            AdviseModel *adviseModel = [[AdviseModel alloc] init];
            NSString *imageUrl = [set objectForColumnName:@"imageUrl"];
            adviseModel.imageUrl = imageUrl;
            NSString *adviseId = [set objectForColumnName:@"adviseId"];
            adviseModel.adviseId = adviseId;
            NSString  *adviseUrl = [set objectForColumnName:@"adviseUrl"];
            adviseModel.adviseUrl = adviseUrl;
            NSData *imageData = [set dataForColumn:@"imageData"];
            adviseModel.imageData = imageData;
            [marr addObject:adviseModel];
        }
        return marr;
    }
    
    return [NSMutableArray new];
}


/**
 根据广告数据下载具体的广告图片

 @param model 广告数据
 */
+ (void)downloadImageDataWithAdviseModel:(AdviseModel *)model{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:model.imageUrl]];
        model.imageData = data;
        
        if ([self deleteAllAdvise]) {
            
            [self addAdvise:model];
        }
    });
}

/**
 广告数据的网络请求,根据项目需求调用自己的请求方法
 */
+ (void)downloadAdviseData{

    AdviseModel *model = [[AdviseModel alloc]init];
    model.imageUrl = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1491892332057&di=186fa14e7d6c1b14a9ce7c657679edf4&imgtype=0&src=http%3A%2F%2Fuserimage8.360doc.com%2F17%2F0219%2F01%2F12472239_201702190120380917157395.jpg";
    model.adviseUrl = @"http://www.baidu.com";
    
    
    [self downloadImageDataWithAdviseModel:model];

    
//    [LCHttpEngineTool downloadImageWithControl:nil downloadProgressBlock:^(NSProgress *taskProgress) {
//        
//    } complete:^(id data, NSError *error) {
//        
//        DELog(@"data=%@",data);
//        
//    }];
    
}


/**
 展示广告页
 */
+ (void)showAdvise{

    NSArray *arr = [self getAdviseList];
    if (arr.count) {
        
        AdviseModel *model = [arr firstObject];
        
        LCAdviseView *adviseView = [[LCAdviseView alloc]initWithFrame:CGRectMake(0, 0, kWIDTH, kHEIGHT) adviseModel:model clickImg:^(NSString *clikImgUrl) {
            
            //可以获取到具体哪个tabbar的navigation,此处视需求而定,
            UIViewController *vc = [LCAppConfig getCurrentVC];
            
            LCAdviseWebController *web = [[LCAdviseWebController alloc]init];
            web.urlStr = model.adviseUrl;
            vc.hidesBottomBarWhenPushed = YES;
            [vc.navigationController pushViewController:web animated:YES];
            
        } dismisBlock:^{
            
            [self downloadAdviseData];
            
        }];
        
        [adviseView show];
    }else{
        
        [self downloadAdviseData];
    }
    
}





@end
