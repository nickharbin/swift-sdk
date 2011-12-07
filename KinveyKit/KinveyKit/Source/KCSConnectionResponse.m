//
//  KCSConnectionResponse.m
//  KinveyKit
//
//  Created by Brian Wilson on 11/23/11.
//  Copyright (c) 2011 Kinvey. All rights reserved.
//

#import "KCSConnectionResponse.h"

@implementation KCSConnectionResponse

@synthesize responseCode=_responseCode;
@synthesize responseData=_responseData;
@synthesize userData=_userData;
@synthesize responseHeaders=_responseHeaders;

- (id)initWithCode:(NSInteger)code responseData:(NSData *)data headerData:(NSDictionary *)header userData:(NSDictionary *)userDefinedData
{
    self = [super init];
    if (self){
        _responseCode = code;
        _responseData = data;
        _userData = userDefinedData;
        _responseHeaders = header;
        
        [_userData retain];
        [_responseData retain];
        [_responseHeaders retain];
    }
    
    return self;
}

+ (KCSConnectionResponse *)connectionResponseWithCode:(NSInteger)code responseData:(NSData *)data headerData:(NSDictionary *)header userData:(NSDictionary *)userDefinedData
{
    // Return the autoreleased instance.
    return [[[KCSConnectionResponse alloc] initWithCode:code responseData:data headerData:header userData:userDefinedData] autorelease];
}

- (void)dealloc
{
    [_responseData release];
    [_userData release];
}


@end