### 图解HTTP
#### chapter4（HTTP状态码）

|        | 类别 | 原因短语 |
|:------:|:----:|:-------:|
| 1XX | Informational(信息性状态码) | 接收的请求正在处理 |
| 2XX | Success（成功状态码）| 请求正常处理完毕 |
| 3XX | Redirection（重定向状态码）| 需要进行附加操作以完成请求 |
| 4XX | Client Error（客户端错误状态码）| 服务器无法处理请求 |
| 5XX | Server Error（服务端错误状态码）| 服务器处理请求出错 |
**`注：`**
```
状态码的职责是当客户端向服务器端发送请求时，描述返回的请求结果；状态码的数量达到了60多种，实际经常使用的大概只有14种。
```
##### 2XX成功（2XX的响应结果表明请求被正常处理了）
- 200 OK
```
客户端发来的请求在服务器端被正常处理了
```
- 204 No Content
```
代表服务器接收的请求已成功处理，但在返回的响应报文中不含实体的主体部分
```
- 206 Pratial Content
```
1、表示客户端进行了范围请求，而服务器成功执行了这部分的GET请求。
2、响应报文中包含由Content-Ranage指定范围的实体内容。
```

##### 3XX重定向（表明浏览器需要执行某些特殊的处理以正确处理请求）
- 301 Moved Permanently
```
永久重定向。表示请求的资源已被分配了新的URI，以后应使用资源现在所指的URI。
```
- 302 Found
```
临时重定向。表示请求的资源已分配了新的URI，希望用户（本次）能使用行的URI访问。
```
- 303 See Other
```
表示由于请求对应的资源存在着另一个URI，应使用GET方法定向获取请求资源。
```
- 304 Not Modified
```
1、表示客户端发送附带条件的请求时，服务器端允许请求访问资源，但因发生请求未满足条件的情况后，直接返回304 Not Moditied
2、服务端资源未改变，可直接使用客户端未过期的缓存。
```
- 307 Temporary Redirect
```
临时重定向。与302 Found有着相同的含义。
```

##### 4XX客户端错误（表明客户端是发生错误的原因所在）
- 400 Bad Request
```
表明请求报文中存在语法错误。
```
- 401 Unauthorized
```
1、表示发送的请求需要通过有HTTP认证的认证信息。
2、若之前已进行过1次请求，则表示用户认证失败。
```
- 403 Fordidden
```
1、表明对请求资源的访问被服务器拒绝。
2、未获取文件系统的访问授权等
```
- 404 Not Found
```
表明服务器上无法找到请求的资源。
```

##### 500服务器错误（表明服务器本身发生错误）
- 500 Internal Server Error
```
表明服务器端在执行请求时发生了错误。
```
- 503 Service Unavailable
```
表明服务器暂时处于超负荷或正在进行停机维护，现在无法处理请求。
```
