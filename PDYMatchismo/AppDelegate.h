//
//  AppDelegate.h
//  PDYMatchismo
//
//  Created by LX_PDY on 2023/10/31.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

