//
//  File.swift
//  4points
//
//  Created by 허재연 on 2016. 8. 9..
//  Copyright © 2016년 C4TK. All rights reserved.
//
//
//  TutorialPageViewController.swift
//  4points
//
//  Created by MediaSTINT on 2016. 8. 9..
//  Copyright © 2016년 C4TK. All rights reserved.
//

import UIKit

class TutorialPageViewController: UIPageViewController {
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.newPageViewController(1),
                self.newPageViewController(2),
                self.newPageViewController(3),
                self.newPageViewController(4),
                self.newPageViewController(5),
                self.newPageViewController(6),
                self.newPageViewController(7),
                self.newPageViewController(8),
                self.newPageViewController(9),
                self.newPageViewController(10),
                self.newPageViewController(11),
                self.newPageViewController(12)
                ]
    }()
    
    private func newPageViewController(num: Int) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewControllerWithIdentifier("page\(num)")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .Forward,
                               animated: true,
                               completion: nil)
        }
    }
    
}

// MARK: UIPageViewControllerDataSource

extension TutorialPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(pageViewController: UIPageViewController,
                            viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
            //return orderedViewControllers.last
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(pageViewController: UIPageViewController,
                            viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            //return nil
            return orderedViewControllers.first
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
}


