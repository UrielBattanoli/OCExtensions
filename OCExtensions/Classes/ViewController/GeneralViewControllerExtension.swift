//
//  GeneralViewControllerExtension.swift
//  Pods
//
//  Created by Henrique Morbin on 03/08/16.
//
//

import UIKit

public extension UIViewController {
    
    public static var topMostViewController: UIViewController? {
        var topMost = UIApplication.shared.keyWindow?.rootViewController
        while let presented = topMost?.presentedViewController {
            topMost = presented
        }
        
        return topMost
    }
    
    public var isVisible: Bool {
        return self.isViewLoaded && self.view.window != nil
    }
    
    public func showAlert(_ message: String, title: String? = nil, okHandler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: okHandler))
        present(alert, animated: true, completion: nil)
    }
    
    public func addChildViewController(_ viewController: UIViewController, inContainerView container: UIView) {
        addChildViewController(viewController)
        viewController.view.fillInSuperview(container)
    }
 
    public func popViewControllers(numberOfPops pops: Int, animated: Bool = true) {
        if let navigationController = self as? UINavigationController ?? navigationController {
            var index = navigationController.viewControllers.count - 1 - pops
            if index < 0 {
                index = 0
            }
            let viewController = navigationController.viewControllers[index]
            navigationController.popToViewController(viewController, animated: animated)
        }
    }
    
    public func presentViewController(_ viewController: UIViewController) {
        present(viewController, animated: true, completion: nil)
    }
    
    public func pushViewController(_ viewController: UIViewController) {
        if let navigationController = self as? UINavigationController ?? navigationController {
            navigationController.pushViewController(viewController, animated: true)
        }
    }
    
}
