//
//  UserDefaultsManager.h
//  ProjectTemplate
//
//  Created by 郭磊 on 2018/12/24.
//  Copyright © 2018 guolei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserDefaultsManager : NSObject


+ (void)saveUserName:(NSString *)userName;

+ (NSString *)getUserNam;


@end

NS_ASSUME_NONNULL_END
