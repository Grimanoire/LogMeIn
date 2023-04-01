//
//  LoginViewController.swift
//  LogMeIn
//
//  Created by Go Christian Goszal on 01/04/23.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var email: UITextView!
    @IBOutlet weak var password: UITextView!
    var user: [userList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButton(_ sender: Any) {
        let loginData: login = login.init(email: email.text, password: password.text)
        APICaller.shared.postLogin(loginData)
                for n in user{
                    if n.email == email.text {
                        idx = n.id-1
                        print(idx)
                        performSegue(withIdentifier: "toHome", sender: nil)
                    }
        }
    }
    
    func getData(){
        APICaller.shared.getUser{ [weak self] result in
            switch result {
            case .success(let user):
                self?.user=user
            case .failure(let error):
                print(error)
            }
        }
    }
}
