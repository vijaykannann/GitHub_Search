//
//  UserDetailViewController.swift
//  GitRepoSearch
//
//  Created by VJ's iMAC on 06/05/20.
//  Copyright © 2020 Deuglo. All rights reserved.
//

import UIKit
import SafariServices

class UserDetailViewController: BaseViewController {

    @IBOutlet weak var imgUserProfilePic: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblJoinDate: UILabel!
    @IBOutlet weak var lblFollowers: UILabel!
    @IBOutlet weak var lblFollowing: UILabel!
    @IBOutlet weak var lblBio: UILabel!

    @IBOutlet weak var txtSearch: UISearchBar!
    @IBOutlet weak var detailTableView: UITableView!
    
    var details: UserDetailMapper?
    var repoList = [RepoModel]()
    var MasterRepoList = [RepoModel]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.imgUserProfilePic.makeRounded()

        self.showUserDetails()
        
        getRepos()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //MARK:- #Func
    func showUserDetails(){
        self.lblUserName.text = "Name: \(String(describing: details?.name ?? ""))"
        self.lblEmail.text = "Email: \(String(describing: details?.email ?? ""))"
        self.lblLocation.text = "Location: \(String(describing: details?.location ?? ""))"
        self.lblJoinDate.text = "Join Date: \(details?.created_at?.components(separatedBy: "T").first ?? "")"
        self.lblFollowers.text = "Followers: \(String(describing: details?.followers ?? 0))"
        self.lblFollowing.text = "Following: \(String(describing: details?.following ?? 0))"
        self.lblBio.text = details?.bio

        if let path = details?.avatar_url, !path.isEmpty{
            let url = URL(string: path)
            imgUserProfilePic.kf.setImage(with: url)
        }
    }
    
    func filterFor(_ repoName: String){
        let filteredArray = self.MasterRepoList.filter{ ($0.name?.lowercased().contains(repoName.lowercased()))! }
        self.repoList = filteredArray
        self.detailTableView.reloadData()
    }
    
    //MARK:- #API Call
    func getRepos(){
        
        super.showProgress()
        
        let url = APIEndpoints.GET_ALL_USERS + "/\(String(describing: details?.login ?? ""))/repos"
        
        NetworkManager.shared.GET(url: url, onSuccess: { (response) in
            
            super.hideProgress()

            guard let responseObject = response as? [[String: Any]] else{
                return
            }
                        
            for item in responseObject{
                guard let modelObject = RepoModel(JSON: item) else{
                    return
                }
                
                self.MasterRepoList.append(modelObject)
            }
            
            self.repoList = self.MasterRepoList
            self.detailTableView.reloadData()
            
        }) { (error) in
            super.hideProgress()

            print("error = \(error?.localizedDescription ?? "")")
        }
        
    }
    
}


//MARK:- #SearchBar Delegate
extension UserDetailViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText == ""{
            self.repoList = self.MasterRepoList
            self.detailTableView.reloadData()
            return
        }
        
        self.filterFor(searchText)
    }
}



//MARK:- #TableView Delegate
extension UserDetailViewController: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.showEmptyMessage("No Repo Found", isEmpty: self.repoList.isEmpty)
        return self.repoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepoTableViewCell") as? RepoTableViewCell
        
        let details = self.repoList[indexPath.row]
        cell?.lblRepoName.text = details.name
        cell?.lblForks.text = "\(String(describing: details.forks ?? 0)) Forks"
        cell?.lblStars.text = "\(String(describing: details.stargazers_count ?? 0)) Stars"
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.view.endEditing(true)
        
        let details = self.repoList[indexPath.row]
        
        if let path = details.html_url, !path.isEmpty{
            let url = URL(string: path)!
            let controller = SFSafariViewController(url: url)
            self.present(controller, animated: true, completion: nil)
            
        }
        
    }
}
