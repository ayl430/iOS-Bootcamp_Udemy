//
//  AppDelegate.swift
//  Destini
//
//  Created by Philipp Muellauer on 01/09/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // viewDidLoad 이전에 실행됨
        
        // UserDefaults가 저장된 plist 위치 확인하기
//        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // 앱을 열었을 때 폰에 무언가가 in foreground 발생했을 때 실행됨
        // 예) 유저가 전화 받을 때, 이 메소드가 데이터를 잃지 않게 해줌
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // 앱이 화면에서 사라질 때 실행
        // 예) 홈버튼 누를 때 or 다른 앱을 열 때 - 앱이 더이상 보이지 않고, background로 들어가는 것
        
        print("applicationDidEnterBackground")
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        print("applicationWillTerminate")
        // 앱이 종료되기 전에 실행 - user-triggerd of system-triggered
        // OS가 trigger 하거나 or 이전 메모리나 유저가 앱을 종료함으로써 trigger하는 resource를 reclaim하거나
        
        // 테이블에 item을 추가 했음, 테이블을 reload 했음 -> 홈버튼 - 앱이 background로 갔음, 데이터를 폰 memory에 유지하고 있음 -> reopen - 테이블에 추가한 item이 존재
        // 앱이 background로 가지않고 terminate 된다면 -> 앱이 폰 memory에서 사라짐 -> 테이블에서 item이 사라짐
        // 시나리오 1: you're operating system trying to reclaim resources because the user is trying to  use like a really memory intensive app
        // 시나리오 2: 유저가 앱을 quit 할 때
        // 시나리오 3: 앱 업데이트할 때
        // 시나리오 4: 유저가 os를 업데이트 할 때
        // persistent data storage가 없기 때문! 배열에 추가하는 것은 TodoListViewController가 존재하는 동안만 memory에 유지되는 것!
        
    }
}
