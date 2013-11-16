//
//  NSFileManager+MyCustom.h
//  CocosBuilder
//
//  Created by Gino on 11/16/13.
//
//

#import <Foundation/Foundation.h>

@interface NSFileManager (MyCustom)

- (BOOL)  safeRemoveItemAtPath:(NSString *)path error:(NSError **) error;

@end
