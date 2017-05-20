//
//  FeedVCViewController.swift
//  social-network
//
//  Created by r3d on 20/05/2017.
//  Copyright © 2017 Alexandru Corut. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Firebase

class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    
    @IBAction func signOutTapped(_ sender: Any) {
           let keychainResult = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print(keychainResult)
        try! FIRAuth.auth()?.signOut()
        performSegue(withIdentifier: "goToSignIn", sender: nil)
    }
    
    
}
 
