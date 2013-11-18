//
//  MassTimes.h
//  ChurchApp
//
//  Created by Greg Tropino on 11/18/13.
//  Copyright (c) 2013 Jhaybie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface MassTimes : NSManagedObject

@property (nonatomic, retain) NSString * days;
@property (nonatomic, retain) NSString * times;

@end
