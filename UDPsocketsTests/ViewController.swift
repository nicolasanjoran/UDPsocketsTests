//
//  ViewController.swift
//  UDPsocketsTests
//
//  Created by Nicolas Anjoran on 02/07/16.
//  Copyright © 2016 Nicolas Anjoran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)) {
            let server: UDPServer = UDPServer(addr: "", port: 14322)
            let run = true
            while run{
                let (data,remoteip,remoteport)=server.recv(1024)
                print("receive")
                if let d=data{
                    if let str=String(bytes: d, encoding: NSUTF8StringEncoding){
                        print(str)
                    }
                }
                print(remoteport)
                print(remoteip)
                //server.close()
                //break
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

