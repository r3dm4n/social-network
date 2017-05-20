//
//  ViewController.swift
//  social-network
//
//  Created by r3d on 16/05/2017.
//  Copyright © 2017 Alexandru Corut. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import Firebase

class SignInVC: UIViewController {


    @IBOutlet weak var emailField: FancyField!
    @IBOutlet weak var passwordField: FancyField!


    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func facebookBtnTapped(_ sender: Any) {

        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("Unable to auth with Facebook")
            } else if result?.isCancelled == true {
                print("User canceled Facebook auth")
            } else {
                print ("Successfully authenticated with Facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)

            }
        }
    }

    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("Unable to auth with Firebase")
            } else {
                print("Succesfully authenticated with Firebase")
            }
        })
    }
    @IBAction func signInTapped(_ sender: Any) {
        if let email = emailField.text, let pwd = passwordField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print("Email auth with Firebase sucess")
                } else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error != nil {
                            print("Unable to auth with email")
                        } else {
                            print("Succesfully authenticated with email")
                        }
                    })
                }
            })
        }
    }
}

