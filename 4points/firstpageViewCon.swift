//
//  firstpageViewCon.swift
//  4points
//
//  Created by 허재연 on 2016. 8. 9..
//  Copyright © 2016년 C4TK. All rights reserved.
//

import UIKit

class firstpageViewCon: UIViewController{
    
    @IBOutlet weak var egg: UIButton!
    @IBOutlet var view01: UIView!
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        egg.addTarget(self, action: #selector(buttonAction), forControlEvents: .TouchUpInside)

        button.frame = view01.frame // 이스터에그에 사용되는 버튼크기 설정, 이거 때문에 크기가 이상한거 같음. 확인수정요망

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buttonAction(sender: UIButton!) {
        button.hidden = false
        button.setImage(UIImage(named: "C4TK"), forState: UIControlState.Normal)
        button.addTarget(self, action: #selector(eggout), forControlEvents: .TouchUpInside)
        self.view.addSubview(button)
    }
    func eggout(sender: UIButton!) {
        button.hidden = true
    }
}
