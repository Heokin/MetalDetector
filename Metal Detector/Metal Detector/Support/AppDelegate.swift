//
//  AppDelegate.swift
//  BuilderHelper
//
//  Created by Kirill Sedliarov on 6.11.22.
//

import UIKit
import Firebase
import GoogleMobileAds
import SwiftyStoreKit
import AVFAudio

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var orientationLock = UIInterfaceOrientationMask.portrait
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
            return self.orientationLock
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if UserDefaults.standard.value(forKey: "FullAccess") == nil {
            UserDefaults.standard.set(0, forKey: "FullAccess")
        }
        if UserDefaults.standard.value(forKey: "note") == nil {
            let setValue = 1
            UserDefaults.standard.set(setValue, forKey: "note")
        } else {
            var helper = UserDefaults.standard.value(forKey: "note") as! Int
            helper += 1
            UserDefaults.standard.set(helper, forKey: "note")
        }
        if UserDefaults.standard.value(forKey: "freeMD") == nil {
            let setValue = 0
            UserDefaults.standard.set(setValue, forKey: "freeMD")
        }
        if UserDefaults.standard.value(forKey: "freeM") == nil {
            let setValue = 0
            UserDefaults.standard.set(setValue, forKey: "freeM")
        }
        if UserDefaults.standard.value(forKey: "freeR") == nil {
            let setValue = 0
            UserDefaults.standard.set(setValue, forKey: "freeR")
        }
        if UserDefaults.standard.value(forKey: "freeP") == nil {
            let setValue = 0
            UserDefaults.standard.set(setValue, forKey: "freeP")
        }
        if UserDefaults.standard.value(forKey: "freeL") == nil {
            let setValue = 0
            UserDefaults.standard.set(setValue, forKey: "freeL")
        }
        UserDefaults.standard.set("0", forKey: "random")
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = [ "871653f84bb218b9acf9ebff5324a3e7" ]
        FirebaseApp.configure()
        window?.overrideUserInterfaceStyle = .dark
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        if IsFirstLaunch.shared.isFirstLaunch {
            window?.rootViewController = CustomTabBarController()
        } else {
            VibrateSound.shared.isVabrateAccess = true
            SoundAccess.shared.isSoundAccess = true
            window?.rootViewController = OnBoard()
        }
        SwiftyStoreKit.completeTransactions(atomically: true) { purchases in
                for purchase in purchases {
                    switch purchase.transaction.transactionState {
                    case .purchased, .restored:
                        if purchase.needsFinishTransaction {
                            // Deliver content from server, then:
                            SwiftyStoreKit.finishTransaction(purchase.transaction)
                        }
                        // Unlock content
                    case .failed, .purchasing, .deferred:
                        break // do nothing
                    @unknown default:
                        fatalError()
                    }
                }
        }
        SwiftyStoreKit.retrieveProductsInfo(["com.metaldetector.1mo"]) {  result in
                    if let product = result.retrievedProducts.first {
                        let priceString = product.localizedPrice!
                        
                    }
                    else if result.invalidProductIDs.first != nil {
                    }
                    else {
                    }
                }
        SwiftyStoreKit.retrieveProductsInfo(["com.metaldetector.1ye"]) {  result in
                    if let product = result.retrievedProducts.first {
                        let priceString = product.localizedPrice!
                        
                    }
                    else if result.invalidProductIDs.first != nil {
                    }
                    else {
                    }
                }
        SwiftyStoreKit.retrieveProductsInfo(["com.metaldetector.1we"]) {  result in
                    if let product = result.retrievedProducts.first {
                        let priceString = product.localizedPrice!
                        
                    }
                    else if result.invalidProductIDs.first != nil {
                    }
                    else {
                    }
                }
        SwiftyStoreKit.retrieveProductsInfo(["com.metaldetector.1motr"]) {  result in
                    if let product = result.retrievedProducts.first {
                        let priceString = product.localizedPrice!
                        
                    }
                    else if result.invalidProductIDs.first != nil {
                    }
                    else {
                    }
                }
        SwiftyStoreKit.retrieveProductsInfo(["com.metaldetector.1yetr"]) {  result in
                    if let product = result.retrievedProducts.first {
                        let priceString = product.localizedPrice!
                        
                    }
                    else if result.invalidProductIDs.first != nil {
                    }
                    else {
                    }
                }
        SwiftyStoreKit.retrieveProductsInfo(["com.metaldetector.1wetr"]) {  result in
                    if let product = result.retrievedProducts.first {
                        let priceString = product.localizedPrice!
                        
                    }
                    else if result.invalidProductIDs.first != nil {
                    }
                    else {
                    }
                }
        
        
        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {

        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
        } catch {
            print("AVAudioSessionCategoryPlayback not work")
        }
    }
}

