//
//  CassiniViewController.swift
//  Cassini
//
//  Created by AHMED GAMAL  on 11/23/19.
//  Copyright © 2019 AHMED GAMAL . All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier{
            if let url = DemoURLs.NASA[identifier]{
                
                if let imageVc = segue.destination.content as? ImageViewController{
                imageVc.ImageUrl = url
                imageVc.title = (sender as? UIButton)?.currentTitle
            }
          }
       }
    }

}
extension UIViewController {
    var content : UIViewController{
        if let navcon = self as? UINavigationController{
            return navcon.visibleViewController ?? self
        }
        else{
            return self
        }
    }
    
}
