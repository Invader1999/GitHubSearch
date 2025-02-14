//
//  FollowerListVC.swift
//  GitHubSearch_iOS
//
//  Created by Hemanth Reddy Kareddy on 09/10/24.
//

import UIKit

class FollowerListVC: GFDataLoadingVC {
    
    enum Section{
        case main
    }
    
    var username:String!
    var followers:[Follower] = []
    var filteredFollowers:[Follower] = []
    var page:Int = 1
    var hasMoreFollowers:Bool = true
    var isSearching:Bool = false
    var isLoadingMoreFollowers:Bool = false
    
    var collectionView:UICollectionView!
    var dataSource:UICollectionViewDiffableDataSource<Section, Follower>!
    
    init(username:String){
        super.init(nibName: nil, bundle: nil)
        self.username = username
        title = username
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureSearchController()
        configureCollectionView()
        getFollowers(userName: username, page: page)
        configureDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
//    override func updateContentUnavailableConfiguration(using state: UIContentUnavailableConfigurationState) {
//        if followers.isEmpty && !isLoadingMoreFollowers{
//            var config = UIContentUnavailableConfiguration.empty()
//            config.image = .init(systemName: "person.slash")
//            config.text = "No Followers"
//            config.secondaryText = "This user has no followers. Go Follow them!"
//            contentUnavailableConfiguration = config
//        }else if isSearching && filteredFollowers.isEmpty{
//            contentUnavailableConfiguration = UIContentUnavailableConfiguration.search()
//        }else{
//            contentUnavailableConfiguration = nil
//        }
//    }
//    
    func configureViewController(){
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addButton
    }
    
    
    func configureCollectionView(){
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout:UIHelper.createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
    }
    
    
    func configureSearchController(){
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search for a username"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        
    }
    
    func getFollowers(userName:String, page:Int){
        showLoadingView()
        isLoadingMoreFollowers = true
        
        Task{
            do {
                let followers = try await NetworkManager.shared.getFollowers(for: username, page: page)
                updateUI(with: followers)
                dismissLoadingView()
                
            } catch{
                if let gfError = error as? GFError{
                    self.presentGFAlert(title: "Error Received", message: gfError.rawValue, buttonTitle: "Ok")
                }else{
                    presentDefaultError()
                }
                
                dismissLoadingView()
            }
            
            isLoadingMoreFollowers  = false
        }
    }
    
    
    func updateUI(with followers: [Follower]){
        if followers.count < 100 {self.hasMoreFollowers = false}
        self.followers.append(contentsOf: followers)
        
//        if self.followers.isEmpty{
//            let message = "This user doesn't have any followers. Go follow them 😃."
//            DispatchQueue.main.async {
//                self.showEmptyStateView(with: message, in: self.view)
//            }
//            return
//        }
        
        self.updateData(on: self.followers)
        setNeedsUpdateContentUnavailableConfiguration()
    }
    
    
    func configureDataSource(){
        dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as! FollowerCell
            cell.set(follower: follower)
            return cell
        })
    }
    
    
    func updateData(on followers:[Follower]){
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot,animatingDifferences: true)
        }
    }
    
    
    @objc func addButtonTapped(){
        showLoadingView()
        Task{
            do{
                let user = try await NetworkManager.shared.getUserInfo(for: username)
                self.addUserToFavourites(user: user)
                dismissLoadingView()
                
            }catch{
                if let gfError = error as? GFError{
                    self.presentGFAlert(title: "Something went wrong", message: gfError.rawValue, buttonTitle: "Ok")
                }else{
                    presentDefaultError()
                }
                dismissLoadingView()
            }
            
            
        }
    }
    
    
    func addUserToFavourites(user:User){
        let favourite = Follower(login: user.login, avatarUrl: user.avatarUrl)
        PersistenceManager.updateWith(favourite: favourite, actionType: .add) {[weak self] error in
            guard let self  = self else {return}
            guard let error = error else{
                self.presentGFAlert(title: "Success!", message: "This user has been added to favourites 🥳", buttonTitle: "Let's go")
                return
            }
            
            self.presentGFAlert(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
        }
    }
    
}


extension FollowerListVC:UICollectionViewDelegate{
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            guard hasMoreFollowers, !isLoadingMoreFollowers else {return}
            page += 1
            getFollowers(userName: username, page: page)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let activeArray = isSearching ? filteredFollowers : followers
        let follower = activeArray[indexPath.item]
        
        
        let destVC = UserInfoVC()
        destVC.userName = follower.login
        destVC.delegate = self
        let navController = UINavigationController(rootViewController: destVC)
        present(navController, animated: true)
    }
}


extension FollowerListVC:UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text, !filter.isEmpty else{
            filteredFollowers.removeAll()
            updateData(on: followers)
            isSearching = false
            return
        }
        
        isSearching = true
        filteredFollowers = followers.filter{ $0.login.lowercased().contains(filter.lowercased()) }
        updateData(on: filteredFollowers)
        setNeedsUpdateContentUnavailableConfiguration()
    }
}


extension FollowerListVC:UserInfoVCDelegate{
    func didRequestFollowers(for username: String) {
        self.username = username
        title = username
        page = 1
        followers.removeAll()
        filteredFollowers.removeAll()
        collectionView.scrollsToTop = true
        // collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
        getFollowers(userName: username, page: page)
    }
}
