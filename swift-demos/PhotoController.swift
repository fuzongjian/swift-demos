//
//  PhotoController.swift
//  swift-demos
//
//  Created by 付宗建 on 2018/1/12.
//  Copyright © 2018年 youran. All rights reserved.
//

import UIKit

class PhotoController: SuperViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    let imageView = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setCustomTitle(title: "相册")
        
        let height :CGFloat = 180
        imageView.frame = CGRect.init(x: (SCREEN_WIDTH-height)*0.5, y: 20 + 64, width: height, height: height)
        imageView.backgroundColor = UIColor.red
        self.view.addSubview(imageView)
        
        let albumBtn = UIButton(type: .system)
        albumBtn.frame = CGRect.init(x: 20, y: imageView.bottom+20, width: SCREEN_WIDTH-40, height: 40)
        albumBtn.setTitle("相册", for: .normal)
        albumBtn.tag = 1000
        albumBtn.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)
        self.view.addSubview(albumBtn)
        
        let cameraBtn = UIButton(type: .system)
        cameraBtn.frame = CGRect.init(x: 20, y: albumBtn.bottom+20, width: albumBtn.width, height: albumBtn.height)
        cameraBtn.setTitle("相机", for: .normal)
        cameraBtn.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)
        self.view.addSubview(cameraBtn)
        // Do any additional setup after loading the view.
    }
    @objc
    func buttonClick(_ sender: UIButton)  {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        if sender.tag == 1000 {
           picker.sourceType = .photoLibrary
        }else{
            picker.sourceType = .camera
        }
        self.present(picker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info["UIImagePickerControllerEditedImage"] as! UIImage
        imageView.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("取消")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
