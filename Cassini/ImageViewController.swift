//
//  ImageViewController.swift
//  Cassini
//
//  Created by AHMED GAMAL  on 11/19/19.
//  Copyright © 2019 AHMED GAMAL . All rights reserved.
//

import UIKit

class ImageViewController: UIViewController , UIScrollViewDelegate{

    var ImageUrl : URL?{
        didSet{
           image = nil
            if view.window != nil { //we are on screen
                fetchImage()
            }
        }
    }
    
    var image : UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
            Spinner?.stopAnimating()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if image == nil {
            fetchImage()
        }
    }
   
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.minimumZoomScale = 1/25
            scrollView.maximumZoomScale = 1.0
            scrollView.delegate = self
            scrollView.addSubview(imageView)
        }
    }
    
    @IBOutlet weak var Spinner: UIActivityIndicatorView!
    var  imageView =  UIImageView()
    
    
        private func fetchImage(){
        if let url = ImageUrl{
            Spinner?.startAnimating()
            DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                let urlContents = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    if let imagedata = urlContents , url == self?.ImageUrl{//to ensure if anyone changed imageurl while fetching url that we have the requested one
                        self?.image = UIImage(data: imagedata)
                    }
                }
                
            }
           
        }
    }
    
    override func viewDidLoad() {
//        super.viewDidLoad()
//        if ImageUrl == nil{
//            ImageUrl = DemoURLs.stanford
//        }
    }
    
    
    
    
}
