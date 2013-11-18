//
//  OtherServices.h
//  ChurchApp
//
//  Created by Greg Tropino on 11/18/13.
//  Copyright (c) 2013 Jhaybie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface OtherServices : NSManagedObject

@property (nonatomic, retain) NSString * serviceDescription;
@property (nonatomic, retain) NSString * serviceDays;
@property (nonatomic, retain) NSString * serviceTimes;

@end
