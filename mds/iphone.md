### 常识问题

##### iPhone X的门帘适配问题
- 图片解说

| before iPhoneX | iPhoneX |
|:----------:|:-----------:|
| ![](/img/iphone.jpeg) | ![](/img/iPhoneX.jpeg) |
- 代码判断
```
extension UIDevice{
    public func isX() -> Bool{
        if UIScreen.main.bounds.height == 812{
            return true
        }else{
            return false
        }
    }
    public func Xvalue() -> CGFloat{
        if UIScreen.main.bounds.height == 812{
            return 88
        }else{
            return 64
        }
    }
}
```
