//
//  ChurchPictures.h
//  ChurchApp
//
//  Created by Greg Tropino on 11/27/13.
//  Copyright (c) 2013 Jhaybie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ChurchPictures : NSManagedObject

@property (nonatomic, retain) NSString * captions;
@property (nonatomic, retain) NSData * image;
@property (nonatomic, retain) NSString * links;

@end
