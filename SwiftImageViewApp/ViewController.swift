//
//  ViewController.swift
//  SwiftImageViewApp
//
//  Created by Natsumo Ikeda on 2016/10/25.
//  Copyright 2017 FUJITSU CLOUD TECHNOLOGIES LIMITED All Rights Reserved.
//

import UIKit
import NCMB

class ViewController: UIViewController {
    // imageView
    @IBOutlet weak var imageView: UIImageView!
    // label
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // labelの初期化
        label.text = ""
        
    }
    
    // 「Download」ボタン押下時の処理
    @IBAction func download(_ sender: UIBarButtonItem) {
        // 取得する画像ファイル名を設定
        let imageFile = NCMBFile.file(withName: "mBaaS_image.png", data: nil) as! NCMBFile
        // 画像ファイルを取得
        imageFile.getDataInBackground({ (data, error) in
            if error != nil {
                // 取得失敗時の処理
                let err = error! as NSError
                print("画像ファイルの取得に失敗しました：\(err.code)")
                self.label.text = "NG エラーコード：\(err.code)"
            } else {
                // 取得成功時の処理
                print("画像ファイルの取得に成功しました")
                self.label.text = "OK"
                // 画像を表示する処理
                self.imageView.image = UIImage(data: data!)
                
            }

        }) { (num) in
                self.label.text = "\(num)%"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

