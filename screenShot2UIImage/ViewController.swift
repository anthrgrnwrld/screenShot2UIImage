//
//  ViewController.swift
//  screenShot2UIImage
//
//  Created by Masaki Horimoto on 2015/10/19.
//  Copyright © 2015年 Masaki Horimoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageScreenShot: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
    スクリーンキャプチャ用関数
    
    :returns: UIImage
    */
    func GetImage() -> UIImage {
        
        // キャプチャする範囲を取得.
        let rect = self.view.bounds
        
        // ビットマップ画像のcontextを作成.
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        let context: CGContextRef = UIGraphicsGetCurrentContext()!
        
        // 対象のview内の描画をcontextに複写する.
        self.view.layer.renderInContext(context)
        
        // 現在のcontextのビットマップをUIImageとして取得.
        let capturedImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // contextを閉じる.
        UIGraphicsEndImageContext()
        
        return capturedImage
    }

    @IBAction func pressScreenShotButton(sender: AnyObject) {
        
        let capturedImage = GetImage() as UIImage     // キャプチャ画像を取得.
        
        imageScreenShot.image = capturedImage
        
    }


}

