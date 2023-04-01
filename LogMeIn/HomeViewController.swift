//
//  HomeViewController.swift
//  LogMeIn
//
//  Created by Go Christian Goszal on 01/04/23.
//

import UIKit
import SDWebImage

public var idx: Int?

class HomeViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    
    var user: [userList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        while user.isEmpty{
            getData()
        }
        getInfo()
    }
    
    func getInfo(){
        nameLabel.text = "\(user[idx!].first_name!) \(user[idx!].last_name!)"
        emailLabel.text = user[idx!].email
        guard let url = URL(string: user[idx!].avatar!) else {return}
        avatar.sd_setImage(with: url)
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
    
    @IBAction func logout(_ sender: Any) {
        performSegue(withIdentifier: "toLogin", sender: nil)
    }
}

