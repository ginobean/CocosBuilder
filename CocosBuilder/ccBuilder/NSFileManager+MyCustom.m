//
//  NSFileManager+MyCustom.m
//  CocosBuilder
//
//  Created by Gino on 11/16/13.
//
//

#import "NSFileManager+MyCustom.h"

static NSString * safeSuffixes[] = {
    @"/com.cocosbuilder.CocosBuilder",
};

static int NumSafeSuffixes = sizeof (safeSuffixes) / sizeof (NSString *);

@implementation NSFileManager (MyCustom)

- (BOOL)safeRemoveItemAtPath:(NSString *)path error:(NSError **)error
{
    if (! path)
        return NO;
    
    BOOL isDirectory = NO;
    BOOL fileOrDirectoryExists = [self fileExistsAtPath:path isDirectory:&isDirectory];
    if (! fileOrDirectoryExists)
        return YES;
    
    if ( ! isDirectory) {
        NSLog(@"allowing deletion, since path %@ is not a directory..", path);
        return [self removeItemAtPath:path error:error];
    }
    
    if ([self hasSafeSuffix:path]) {
        NSLog(@"allowing deletion, since path %@ contains a safe suffix..", path);
        return [self removeItemAtPath:path error:error];
    }

    NSLog(@" disallowing deletion in call to removeItemAtPath = [%@]", path);

    return YES;
}


- (BOOL) hasSafeSuffix:(NSString *)path
{
    for (int i = 0; i < NumSafeSuffixes; i++) {
            if ([path hasSuffix:safeSuffixes[i]])
                return YES;
    }
    
    return NO;
}

@end
