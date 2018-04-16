### 版本控制理解
- SVN（集中式代码管理）

```
1、SVN的核心是服务器。
2、所有开发者在开始新的一天的工作之前必须从服务器获取代码，然后开发，最后解决冲突、提交。
3、所有的版本信息都放在服务器上。
4、如果脱离了服务器，开发者基本上可以说是无法工作了。
```
### Git（分布式管理）
```
1、分布式的版本控制系统，每一份代码都可独立使用。
```
#### 常用指令
##### 本地(tag)

- 添加tag值

```
git tag -a v1.0 -m"message"
```
- tag值详细信息

```
git show v1.0
```
- 查看所有tag

```
git tag
```
- 删除本地某个标签

```
git tag -d v1.0
```
- 修改某个标签（先修改，后删除）

```
git tag -f new_name old_name
git tag -d old_name
```

##### tag（远程）
- 提交本地所有tag

```
git push origin --tags
```
- 提交某个tag

```
git push origin v1.0
```
- 查看远程tag

```
git ls-remote --tags
```
- 切换版本

```
git checkout v1.0
```
- 删除远程标签

```
git push origin :refs/tags/version v1.0
```
