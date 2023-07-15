//
//  TabBarController.swift
//  IOS10-HW14-Maria Glushtsova
//
//  Created by Admin on 15.07.23.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    let media = MediaTabBarViewController()
    let forYou = ForYouTabBarViewController()
    let albums = ViewController()
    let search = SearchTabBarViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setupTabBarController()
        setupTabBarViewController()
    }
    


    // MARK: - Navigation
    
    func setupTabBarController() {
        tabBar.tintColor = .systemGray
        tabBar.backgroundColor = UIColor(named: "TabBarColor")
    }
    
    func setupTabBarViewController() {

        let mediaIcon = UITabBarItem()
        mediaIcon.title = "Медиатека"
        mediaIcon.image = UIImage(systemName: "photo.fill.on.rectangle.fill")
        media.tabBarItem = mediaIcon
        let mediaNavigationController = UINavigationController(rootViewController: media)
        
        let forYouIcon = UITabBarItem()
        forYouIcon.image = UIImage(systemName: "heart.text.square.fill")
        forYouIcon.title = "Для Вас"
        forYou.tabBarItem = forYouIcon
        let forYouNavigationController = UINavigationController(rootViewController: forYou)
        
        let albumsIcon = UITabBarItem()
        albumsIcon.image = UIImage(systemName: "square.stack.fill")
        albumsIcon.title = "Альбомы"
        albums.tabBarItem = albumsIcon
        let albumsNavigationController = UINavigationController(rootViewController: albums)
        
        let searchIcon = UITabBarItem()
        searchIcon.image = UIImage(systemName: "magnifyingglass")
        searchIcon.title = "Поиск"
        search.tabBarItem = searchIcon
        let searchNavigationController = UINavigationController(rootViewController: search)
        
        let controllers = [mediaNavigationController, forYouNavigationController, albumsNavigationController, searchNavigationController]
        self.setViewControllers(controllers, animated: true)
        
    }
    
   func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Будет выбран контроллер - \(viewController.title ?? "")")
        tabBar.tintColor = .systemBlue
        return true
    }
}
