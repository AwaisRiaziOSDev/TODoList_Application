//
//  SignUpVC.swift
//  To-Do List
//
//  Created by Awais Malik on 25/01/2023.
//

import UIKit

class SignUpVC: UIViewController {
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!

    let networkManager = Network()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    // Register new user
    @IBAction func signUpAction(_ sender: UIButton){
        let email = txtEmail.text ?? ""
        let password = txtPassword.text ?? ""
        if self.authenticationFieldValidation(email: email, password: password){
            self.showProgressView(views: self.view)
            networkManager.signUpUser(email: email, password: password) { success, msg in
                self.hideProgressView()
                if success{
                    // move to task list screen after signup
                    RedirectHelper.shared.determineRoutes(storyBoard: .Home)
                }else{
                    self.showAlertMessage(message: msg)
                }
            }
        }
    }
    
    @IBAction func signInAction(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }

   
}
