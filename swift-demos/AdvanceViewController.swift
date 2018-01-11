//
//  AdvanceViewController.swift
//  swift-demos
//
//  Created by 付宗建 on 2018/1/10.
//  Copyright © 2018年 youran. All rights reserved.
//

import UIKit

class AdvanceViewController: SuperViewController,UITextFieldDelegate {
    var viewArray: [UIView] = []
    var height: CGFloat = 60
    var width: CGFloat = 0
    let scrollView = UIScrollView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setCustomTitle(title: "基本控件")
        addSubView()
        addLabel()
        addButton()
        addStepper()
        addSwitch()
        addImageView()
        addTextField()
        addSegmentControl()
        addLoading()
        addPageControl()
        addAlert()
        addProgress()
        addSearchBar()
        addTextView()
        addCollection()
    }
    func addTextView() {
        let textView = UITextView()
        textView.frame = CGRect.init(x: 5, y: 5, width: width-10, height: height-10)
        textView.font = UIFont.systemFont(ofSize: 12)
        textView.text = "求知若渴，虚怀若谷。"
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.gray.cgColor
        viewArray[11].addSubview(textView)

    }
    func addSearchBar() {
        let search = UIButton(type: .system)
        search.frame = CGRect.init(x: 5, y: 5, width: width-10, height: height-10)
        search.setTitle("UISearchBar", for: .normal)
        search.tag = 10000
        search.addTarget(self, action: #selector(searchClick(_:)), for: .touchUpInside)
        viewArray[12].addSubview(search)
    }
    func addCollection() {
        let search = UIButton(type: .system)
        search.frame = CGRect.init(x: 5, y: 5, width: width-10, height: height-10)
        search.setTitle("UICollectionView", for: .normal)
        search.tag = 10001
        search.addTarget(self, action: #selector(searchClick(_:)), for: .touchUpInside)
        viewArray[13].addSubview(search)
    }
    func addProgress() {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.frame = CGRect.init(x: 5, y: 5, width: width-10, height: height-10)
        let view = viewArray[10]
        progressView.center = CGPoint.init(x: view.bounds.size.width*0.5, y: view.bounds.size.height*0.5)
        progressView.progress = 0.3
        // 加载过的颜色
        progressView.progressTintColor = UIColor.red
        // 未加载过的颜色
        progressView.trackTintColor = UIColor.gray
        view.addSubview(progressView)
    }
    func addAlert() {
        let alertBtn = UIButton(type: .system)
        alertBtn.frame = CGRect.init(x: 10, y: 10, width: width-20, height: height-20)
        alertBtn.setTitle("UIAlertController", for: .normal)
        alertBtn.addTarget(self, action: #selector(addAlertClick(_:)), for: .touchUpInside)
        viewArray[9].addSubview(alertBtn)
    }
    @objc
    func addAlertClick(_ sender: UIButton) {
        let alert = UIAlertController(title: "提示信息",message: "确定返回吗？",preferredStyle: .alert)
        let cancleAction = UIAlertAction(title: "取消",style: .cancel){ (action)->Void in
            print("cancle click")
            // 防止内存泄漏
            alert.removeFromParentViewController()
        }
        let sureAction = UIAlertAction(title: "确定",style: .default){ (action)->Void in
            print("sure click")
            alert.removeFromParentViewController()
        }
        alert.addAction(cancleAction)
        alert.addAction(sureAction)
        self.present(alert, animated: true, completion: nil)
    }
    func addPageControl() {
        let pageControl = UIPageControl()
        pageControl.frame = CGRect.init(x: 5, y: 5, width: width-10, height: height-10)
        pageControl.numberOfPages = 4;
        pageControl.currentPage = 1;
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.red
        pageControl.addTarget(self, action: #selector(pagecontrolChange(_:)), for: .touchUpInside)
        viewArray[8].addSubview(pageControl)
    }
    func addLoading() {
        let load = UIActivityIndicatorView()
        load.frame = CGRect.init(x: 5, y: 5, width: width-10, height: height-10)
        let view = viewArray[7]
        load.center = CGPoint.init(x: view.bounds.size.width*0.5, y: view.bounds.size.height*0.5)
        load.activityIndicatorViewStyle = .gray
        load.startAnimating()
        DispatchAfter(after: 1000) {
            load.stopAnimating()
        }
        view.addSubview(load)
    }
    func addSegmentControl() {
        let items: [String] = ["A","B","C"]
        let segment = UISegmentedControl(items: items)
        segment.frame = CGRect.init(x: 5, y: 10, width: width-10, height: height-20)
        segment.selectedSegmentIndex = 1
        segment.tintColor = UIColor.orange
        segment.addTarget(self, action: #selector(segmentControl(_:)), for: .valueChanged)
        viewArray[6].addSubview(segment)
    }
    func addTextField() {
        let textField = UITextField()
        textField.frame = CGRect.init(x: 5, y: 5, width: width-10, height: height-10)
        textField.borderStyle = .roundedRect
        textField.placeholder = "Hello Swift!"
        textField.font = UIFont.systemFont(ofSize: 15)
        // 键盘类型
        textField.keyboardType = .default
        // 返回键
        textField.returnKeyType = .search
        textField.delegate = self
        viewArray[5].addSubview(textField)
    }
    // 当return按钮被点击时调用
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    // 键盘收起时调用
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(textField.text!)
        return true
    }
    func addImageView() {
        let imageView = UIImageView()
        imageView.frame = CGRect.init(x: 5, y: 5, width: width-10, height: height-10)
        imageView.image = UIImage.init(named: "test.png")
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        /*
         .scaleToFill 缩放图片填满整个图片视图
         .scaleAspectFit 缩放内容以适应原图尺寸，没有铺满的地方保持透明
         .scaleAspectFill 铺满这个屏幕
         */
        imageView.contentMode = .scaleAspectFill
        viewArray[4].addSubview(imageView)
    }
    func addSwitch() {
        let switcher = UISwitch()
        switcher.frame = CGRect.init(x: 5, y: 5, width: width-10, height: height-10)
        let view = viewArray[2]
        switcher.center = CGPoint.init(x: view.bounds.size.width*0.5, y: view.bounds.size.height*0.5)
        // 设置开启状态显示的颜色
        switcher.onTintColor = UIColor.red
        // 设置关闭状态显示的颜色
        switcher.tintColor = UIColor.green
        // 设置滑块的颜色
        switcher.thumbTintColor = UIColor.yellow
        viewArray[3].addSubview(switcher)
        switcher.addTarget(self, action: #selector(switchValueChange(_:)), for: .valueChanged)
    }
    func addStepper() {
        let stepper = UIStepper()
        stepper.frame = CGRect(x:5, y:5,width: width-10,height: height-10)
        
        let view = viewArray[2]
        stepper.center = CGPoint.init(x: view.bounds.size.width*0.5, y: view.bounds.size.height*0.5)
        viewArray[2].addSubview(stepper)
        // 设置了高和宽，但实际上并没有发生变化
//        stepper.transform = CGAffineTransform(scaleX: 1.3,y: 1.3)
        stepper.maximumValue = 10
        stepper.minimumValue = 1
        stepper.value = 2
        // 设置步长
        stepper.stepValue = 1
        // 设置长按改变值
        stepper.isContinuous = true
        // 设置是否循环
        stepper.wraps = true
        stepper.addTarget(self, action: #selector(stepperValueChange(_:)), for: .valueChanged)
    }
    func addButton() {
        let button: UIButton = UIButton(type: .system)
        button.frame = CGRect.init(x:5,y:5,width:width-10,height:height-10)
        button.setTitle("UIButton", for: UIControlState.normal)
        button.backgroundColor=UIColor.red
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(buttonClick(_:)), for: UIControlEvents.touchUpInside)
        viewArray[1].addSubview(button)
    }
    func addLabel() {
        let label = UILabel(frame: CGRect(x:5,y:5,width:width-10,height:height-10))
        label.text = "UILabel"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = NSTextAlignment.center
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.blue
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        viewArray[0].addSubview(label)
    }
    @objc
    func buttonClick(_ button: UIButton) {
        print("button_click")
        if button.titleLabel?.text == "UIButton" {
            button.setTitle("buttonClick", for: UIControlState.normal)
        }else{
            button.setTitle("UIButton", for: UIControlState.normal)
        }
    }
    @objc
    func stepperValueChange(_ sender: UIStepper){
        print(sender.value)
    }
    @objc
    func switchValueChange(_ sender: UISwitch){
        print(sender.isOn)
    }
    @objc
    func segmentControl(_ sender: UISegmentedControl) {
        print("点击了第\(sender.selectedSegmentIndex+1)个")
    }
    @objc
    func pagecontrolChange(_ sender: UIPageControl)  {
        print("点击了第\(sender.currentPage+1)页")
    }
    @objc
    func searchClick(_ sender: UIButton) {
        if sender.tag == 10000 {
            self.navigationController?.pushViewController(SearchBarController(), animated: true)
        }else{
            self.navigationController?.pushViewController(CollectionController(), animated: true)
        }
        
    }
    
    func addSubView() {
        scrollView.frame = CGRect.init(origin: CGPoint.init(x: 0, y: 6), size: UIScreen.main.bounds.size)
        scrollView.backgroundColor = UIColor.gray
        self.view.addSubview(scrollView)
        
        let padding: CGFloat = 1
        let row: [CGFloat] = [0,1,2,3,4]
        let column: [CGFloat] = [0,1,2]
        width = (UIScreen.main.bounds.size.width-2)/3
        for i in row {
            for j in column{
                let view = UIView()
                view.frame = CGRect.init(x: (width+padding)*j, y: padding+(height+padding)*i, width: width, height: height)
                view.backgroundColor = UIColor.white
                scrollView.addSubview(view)
                viewArray.append(view)
                if i == row.last && j == column.last {
                    scrollView.contentSize = CGSize.init(width: scrollView.bounds.size.width, height: view.frame.origin.y+view.bounds.size.height)
                }
            }
        }
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
