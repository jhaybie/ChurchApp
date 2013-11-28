//
//  ParishInfo.h
//  ChurchApp
//
//  Created by Greg Tropino on 11/27/13.
//  Copyright (c) 2013 Jhaybie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ParishInfo : NSManagedObject

@property (nonatomic, retain) NSString * history;
@property (nonatomic, retain) NSString * missionStatement;

@end
