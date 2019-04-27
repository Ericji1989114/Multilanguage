//
//  Extension.swift
//  Multilanguage
//
//  Created by Eric JI on 2019/04/26.
//  Copyright © 2019 Eric JI. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    var localize: String {
        
        return NSLocalizedString(self, comment: "")
        
    }
    
}


let languageCodes = ["en", "ja", "zh-Hans"]
let languageCode = "languageCode"

func currentIndex() -> Int {
    
    return UserDefaults.standard.integer(forKey: languageCode)
}

func setCurrent(index: Int) {
    
    UserDefaults.standard.set(index, forKey: languageCode)
    LanguageManager.setLanguage(languageCodes[index])
    reloadApp()
    
}

func reloadApp() {
    
    guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else {
        return
    }
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    appdelegate.window?.rootViewController = storyboard.instantiateInitialViewController()
    
}
