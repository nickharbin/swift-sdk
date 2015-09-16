//
//  KCSProtocolTestsResponseContentType.swift
//  KinveyKit
//
//  Created by Victor Barros on 2015-08-21.
//  Copyright (c) 2015 Kinvey. All rights reserved.
//

class KCSProtocolTestsResponseContentType: KCSTestCase {
    
    private class MockURLProtocol : NSURLProtocol {
        
        override class func canInitWithRequest(request: NSURLRequest) -> Bool {
            return true
        }
        
        override class func canonicalRequestForRequest(request: NSURLRequest) -> NSURLRequest {
            return request
        }
        
        private override func startLoading() {
            let response = NSHTTPURLResponse(
                URL: request.URL!,
                statusCode: 200,
                HTTPVersion: "1.1",
                headerFields: [
                    "Content-Type" : "text/plain"
                ]
                )!
            client!.URLProtocol(
                self,
                didReceiveResponse: response,
                cacheStoragePolicy: NSURLCacheStoragePolicy.NotAllowed
            )
            client!.URLProtocol(self, didLoadData: "test".dataUsingEncoding(NSUTF8StringEncoding)!)
            client!.URLProtocolDidFinishLoading(self)
        }
        
        private override func stopLoading() {
        }
        
    }
    
    override func setUp() {
        super.setUp()
        
        KCSURLProtocol.registerClass(MockURLProtocol.self)
    }
    
    func testResponseContentType() {
        let config = KCSClientConfiguration(
            appKey: "kid_-1WAs8Rh2",
            secret: "2f355bfaa8cb4f7299e914e8e85d8c98",
            options: nil
        )
        KCSClient.sharedClient().initializeWithConfiguration(config)
        
        weak var expectationCreateUser = expectationWithDescription("createUser")
        
        KCSUser.createAutogeneratedUser(
            nil,
            completion: { (user: KCSUser!, error: NSError!, actionResult: KCSUserActionResult) -> Void in
                XCTAssertNil(user)
                XCTAssertNotNil(error)
                
                expectationCreateUser?.fulfill()
            }
        )
        
        waitForExpectationsWithTimeout(30, handler: nil)
    }
    
    override func tearDown() {
        KCSURLProtocol.unregisterClass(MockURLProtocol.self)
        
        super.tearDown()
    }
    
}
