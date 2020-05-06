//
//  ViewController.swift
//  GitRepoSearch
//
//  Created by VJ's iMAC on 06/05/20.
//  Copyright © 2020 Deuglo. All rights reserved.
//

import UIKit
import Kingfisher
import PKHUD

class ViewController: BaseViewController {
    
    @IBOutlet weak var txtSearch: UISearchBar!
    @IBOutlet weak var usersTableView: UITableView!
    
    var masterUsers = [UserListMapper]()
    var users = [UserListMapper]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK:- #Func
    
    func redirectToDetailControllerWithDetails(_ details: UserDetailMapper){
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UserDetailViewController") as! UserDetailViewController
        vc.details = details
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func filterUsersFor(_ userName: String){
        
        let url = APIEndpoints.SEARCH_ALL_USERS + "/users?q=\(userName)+in:fullname&order=asc&page=0&per_page=1000"
        
        print("URL = \(url)")
        
        super.showProgress()
        
        NetworkManager.shared.GET(url: url, onSuccess: { (response) in
            
            super.hideProgress()
            
            guard let responseObject = response as? Dictionary<String, Any> else{
                return
            }
            
            guard let modelObject = UsersModelMapper(JSON: responseObject) else{
                return
            }
            
            if let users = modelObject.items{
                self.users = users
                
                print("Search Result count = \(self.users.count)")
                
            }
            
            
            self.usersTableView.reloadData()
            
        }) { (error) in
            super.hideProgress()
            
            print("error = \(error?.localizedDescription ?? "")")
        }
        
    }
    
    func getDetilsForUser(_ user: String){
        
        super.showProgress()
        
        let URL = APIEndpoints.GET_ALL_USERS + "/\(user)"
        print("Details URL = \(URL)")
        
        NetworkManager.shared.GET(url: URL, onSuccess: { (response) in
            
            super.hideProgress()
            
            guard let responseObject = response as? Dictionary<String, Any> else{
                return
            }
            
            guard let modelObject = UserDetailMapper(JSON: responseObject) else{
                return
            }
            
            if let message = responseObject["message"] as? String{
                super.showError(message)
                return
            }
            
            self.redirectToDetailControllerWithDetails(modelObject)
            
        }) { (error) in
            super.hideProgress()
            
            print("error = \(error?.localizedDescription ?? "")")
        }
        
    }
    
}

//MARK:- #SearchBar Delegate
extension ViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText == ""{
            self.users = self.masterUsers
            self.usersTableView.reloadData()
            return
        }
        
        self.filterUsersFor(searchText)
    }
    
    
}

//MARK:- #TableView Delegate
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.showEmptyMessage("", isEmpty: self.users.isEmpty)
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UsersTableViewCell") as? UsersTableViewCell
        
        let details = self.users[indexPath.row]
        cell?.lblUserName.text = details.login
        
        if let path = details.avatar_url, !path.isEmpty{
            let url = URL(string: path)
            cell?.imgUserProfilePic.kf.setImage(with: url)
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.view.endEditing(true)
        
        let details = self.users[indexPath.row]
        
        if let userName = details.login{
            self.getDetilsForUser(userName)
        }
        
    }
}
