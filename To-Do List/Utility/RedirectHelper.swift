//
//  RedirectHelper.swift
//  To-Do List
//
//  Created by Awais Malik on 25/01/2023.
//

import UIKit

final class RedirectHelper {
    
    enum Stoyboard : String {
        case Home
        case Main
    }
    
    var window : UIWindow!
    
    private static let _shared = RedirectHelper()
    static var shared : RedirectHelper {
        return _shared
    }
    
    private init() {
        createWindow()
    }
    
    private func createWindow(){
        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first
            if let sceneDelegate : SceneDelegate = (scene?.delegate as? SceneDelegate) {
                self.window = sceneDelegate.window!
            }
            
            // iOS12 or earlier
        } else {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            guard let temp = appDelegate.window else {return}
            self.window = temp
        }
    }
    
    func determineRoutes(storyBoard: Stoyboard) {
        // User session manage here if needed
        if self.window == nil {
            self.createWindow()
        }
        
        if window == nil {
            assertionFailure("Window not found")
        }
        
        switch storyBoard{
        case .Main://redirect to Login
            let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
            let loginVC = mainStoryBoard.instantiateViewController(withIdentifier: "AuthNavigationController") as! UINavigationController
            self.window.rootViewController = loginVC
            self.window.makeKeyAndVisible()
            
        case .Home: //redirect to Home navigation
            let mainStoryBoard = UIStoryboard(name: "Home", bundle: nil)
            let loginVC = mainStoryBoard.instantiateViewController(withIdentifier: "HomeNavigationController") as! UINavigationController
            self.window.rootViewController = loginVC
            self.window.makeKeyAndVisible()
        }
        
    }
    
    
}

