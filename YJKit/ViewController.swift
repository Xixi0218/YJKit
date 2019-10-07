//
//  ViewController.swift
//  TestMemberLookup
//
//  Created by YeKeyon on 2019/10/4.
//  Copyright © 2019 YeKeyon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let label = UILabel().propertyTape
        .numberOfLines(0)
        .textColor(.red)
        .text("Hello, World!!")
        .build()
        label.sizeToFit()
        self.view.addSubview(label)
        
        URLSession.shared.dataTask(with: URL(string: "http://www.wchoosemall.com/doc/api/common/auth/takeGoodsCoupon/findTakeGoodsCoupons.json?token=e5b419c19cfe46e0a7189da631631780&data=%7b%22queryFlag%22%3a1%2c%22page%22%3a1%7d")!) { (data, response, error) in
            if let data = data {
                do {
                    let dic = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
                    if let dic = dic as? NSDictionary {
                        print(dic.jyTape.data.list[0].picUrl.build())
                        print(dic.jyTape.debugInfo.data.aaa.build())
                    }
                } catch {
                    print(error.localizedDescription)
                }
                
            }
        }.resume()
    }


}

