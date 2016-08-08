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

class ViewController: UIViewController {
    
    let board = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        //p12 roundcorner
        /*
         //        p12bg.layer.cornerRadius = 5;
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
    
    
}




func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == UITableViewCellEditingStyle.Delete {
        todos.removeAtIndex(indexPath.row)
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
    }
}