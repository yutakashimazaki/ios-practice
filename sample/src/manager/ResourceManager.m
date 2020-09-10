//
//  ResourceManager.m
//  sample
//
//  Created by Yutaka Shimazaki on 2020/09/06.
//  Copyright © 2020 sample. All rights reserved.
//

#import "ResourceManager.h"

@implementation ResourceManager

+ (NSString *)messageStringWithKey:(NSString *)key
{
    return NSLocalizedString(key, nil);
}

@end
