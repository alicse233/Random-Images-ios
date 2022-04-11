//
//  ViewController.swift
//  Random Images
//
//  Created by sreelekh N on 11/04/22.
//

import UIKit

class ViewController: UIViewController {

    private let img: UIImageView = {
       
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .white
        
        return image
    }()
    
    
    private let btn: UIButton = {
       
        let bt = UIButton()
        bt.backgroundColor = .white
        bt.setTitle("Get random image", for: .normal)
        bt.setTitleColor(.black, for: .normal)
        return bt
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        view.addSubview(img)
        img.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        img.center = view.center
        
        view.addSubview(btn)
    
        getRandomImage()
        
        btn.addTarget(self, action: #selector(btnTap), for: .touchUpInside)
    }

    @objc func btnTap(){
        getRandomImage()
    }
    
    override func viewDidLayoutSubviews() {

        btn.frame = CGRect(x: 20, y: view.frame.height-50-view.safeAreaInsets.bottom, width:
                            view.frame.width-40, height: 50)

    }
    
    func getRandomImage() {
        let url = "https://source.unsplash.com/random/600x600"
        let uri = URL(string: url)!
        guard let data = try? Data(contentsOf: uri) else {
            return
        }
            
            img.image = UIImage(data: data)
        
    }
}

