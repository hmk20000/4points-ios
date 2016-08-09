//
//  ViewController.swift
//  4points
//
//  Created by 허재연 on 2016. 3. 9..
//  Copyright © 2016년 KCCC Code for the Kingdom. All rights reserved.
//

import UIKit
var pagecount = 1;//몇페이지에 있는지를 저장한다.
var pagename = "page"

class ViewController: UIViewController{
    let countOfLandingPage = 12
    
    var pageController:UIPageViewController?
    let board = UIStoryboard(name: "Main", bundle: nil)
    var pageContent = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // p12 roundcorner
        /*
         // p12bg.layer.cornerRadius = 5;
         p12bg.frame.origin.x = p12text.frame.origin.x
         p12bg.frame.origin.y = p12text.frame.origin.y
         p12bg.frame.size.height = p12text.frame.size.height
         p12bg.frame.size.width = p12text.frame.size.width
         */
        
        // get currunt page Num. this is for tapping & swiping sync
        var a :String = self.restorationIdentifier!.stringByRemovingPercentEncoding!
        a = a.stringByReplacingOccurrencesOfString("page", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        // transform to Int
        pagecount = Int(a)!
        // put into pagecount
        
        var swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
        var swipeLeft = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
        self.navigationItem.title = ""
//        
//        self.createContentPages()
//        self.pageController = UIPageViewController(transitionStyle: /*.PageCurl*/ .Scroll, navigationOrientation:.Horizontal, options:nil)
//        self.pageController?.delegate = self
//        self.pageController?.dataSource = self
//        
//        // 1번째 ContentViewController 인스턴스를 생성받아 최초 시작 ViewController로 지정
//        let startingViewController=self.viewControllerAtIndex(0)!
//        
//        let viewControllers: NSArray = [startingViewController]
//        self.pageController!.setViewControllers(viewControllers as! [UIViewController], direction: .Forward, animated: false, completion: nil)
//        // PageViewController를 현재의 뷰에 추가, 페이지가 전체 화면을 가득 채우도록 처리
//        self.addChildViewController(self.pageController!)
//        self.view.addSubview(self.pageController!.view)
//        
//        var pageViewRect = self.view.bounds
//        self.pageController!.view.frame = pageViewRect
//        self.pageController!.didMoveToParentViewController(self)
        
        
    }
    
    func createContentPages(){
        var pageStrings = [String]()
        for i in 1...11 {
            let contentString = "<html><head></head><body><br><h1>Chapter \(i)</h1><p>This is the page \(i) of content displayed using UIPageViewController in iOS 9.</p></body></html>"
            pageStrings.append(contentString)
        }
        pageContent = pageStrings
    }
    
    
    
    
    //제스쳐 응답함수
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        print(pagecount)
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                print("Swiped right")
                if pagecount == 1 {
                    pagecount = 12; // 1페이지에서 넘겼다면, 맨 마지막 페이지로 이동시킨다.
                } else {
                    pagecount = pagecount - 1;
                }
                // case UISwipeGestureRecognizerDirection.Down:
            // print("Swiped down")
            case UISwipeGestureRecognizerDirection.Left:
                print("Swiped left")
                if pagecount == 12 {
                    pagecount = 1; //다 넘기면 처음으로 (순환구조)
                } else {
                    pagecount = pagecount + 1;
                }
                // case UISwipeGestureRecognizerDirection.Up:
            // print("Swiped up")
            default:
                break
            }
            let nextViewController = storyboard.instantiateViewControllerWithIdentifier( pagename + String(pagecount) ) //page + ## 을 집어내고
            self.presentViewController(nextViewController, animated: true, completion: nil) //거기로 이동하기 슝슝
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    var modelController: ModelController {
//        // Return the model controller object, creating it if necessary.
//        // In more complex implementations, the model controller may be passed to the view controller.
//        if _modelController == nil {
//            _modelController = ModelController()
//        }
//        return _modelController!
//    }
//    
//    var _modelController: ModelController? = nil

//    
//    /*
//     인덱스가 0인지(첫페이지 전으로 이동할 수 없음) 혹은 pageContent 배열의 항목 개수보다 큰 숫자인지 체크함으로써 가능함 페이지 범위를 벗어났는지 확인한다.
//     index 값이 유효하면 ContentViewController 클래스의 인스턴스가 새롭게 만들어지며 dataObject 속성은 해당되는 pageContent 배열의 항목으로 설정된다.
//     */
//    func viewControllerAtIndex(index:Int) -> ContentViewController?{
//        if  (self.pageContent.count == 0) || (index>=self.pageContent.count){
//            return nil
//        }
//        
//        let storyBoard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
//        let dataViewController = storyBoard.instantiateViewControllerWithIdentifier("contentView") as! ContentViewController
//        
//        dataViewController.dataObject = pageContent[index]
//        return dataViewController
//    }
//    
//    /*
//     viewController 객체를 전달받고 컨트롤러의 인덱스 값을 반환한다.  뷰컨트롤러의 dataObject 속성을 찾아내고 pageContent 배열에서 일치하는 요소의 인덱스를 찾는다.
//     */
//    func indexOfViewController(viewController:ContentViewController)-> Int{
//        if let dataObject: AnyObject = viewController.dataObject{
//            return self.pageContent.indexOfObject(dataObject)
//        }else{
//            return NSNotFound
//        }
//    }
//    
//    /******************* UIPageViewControllerDataSource에서 필요한 2개의 함수 *********************/
//    // ViewController가 페이지 뷰 컨트롤러 객체의 데이터 소스 역할을 하기 때문에 2개의 함수가 추가되어야 함
//    
//    // 현재 표시되는 뷰 컨트롤러 전에 표시된 뷰 컨트롤러 반환
//    func pageViewController(pageViewController:UIPageViewController, viewControllerBeforeViewController viewController:UIViewController) -> UIViewController? {
//        let itemController = viewController as! PageSuperItemController
//        
//        if itemController.index > 0 {
//            return getItemController(itemController.index-1)
//        }
//        
//        return nil
    
//        var index = self.indexOfViewController(viewController as! ContentViewController)
//        if (index==0) || (index==NSNotFound){
//            return nil
//        }
//        
//        index--
//        return self.viewControllerAtIndex(index)
        
    }
//    
//    // 현재 뷰 컨트롤러 다음에 표시될 뷰 컨트롤러를 반환
//    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController:UIViewController) -> UIViewController?{
//        
//        let itemController = viewController as! PageSuperItemController
//        if itemController.index + 1 < countOfLandingPage + 1 {
//            return getItemController(itemController.index+1)
//        }
//        
//        return nil
//        }
//        
//        return self.viewControllerAtIndex(index)
//    
//    
//    var index = self.indexOfViewController(viewController as! ContentViewController)
//    if index == NSNotFound{
//    return nil
//    }
//    
//    index++
//    if index == self.pageContent.count {
//    return nil
//    }
//    
//    return self.viewControllerAtIndex(index)
    
    
    
//    }
    /******************* UIPageViewControllerDataSource에서 필요한 2개의 함수 *********************/
    
    
    






//func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//    if editingStyle == UITableViewCellEditingStyle.Delete {
//        todos.removeAtIndex(indexPath.row)
//        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
//    }
//}