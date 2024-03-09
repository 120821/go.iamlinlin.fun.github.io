---
layout: post
title: "go apiv1.Use(jwt.JWT()) 的简单认识（待完善todo）"
date: "2023-08-01"
categories: 
---
<p><a href="https://eddycjy.gitbook.io/golang/di-3-ke-gin/jwt">https://eddycjy.gitbook.io/golang/di-3-ke-gin/jwt</a></p>

<p>使用 Gin 框架中的 JWT 中间件，用于对 API 进行身份验证和授权。</p>

<p>在 Gin 框架中，<code>Use()</code> 方法用于向路由组或路由器添加一个或多个中间件。中间件是一种函数或方法，可以在处理请求之前或之后执行某些操作，例如身份验证、日志记录、缓存等。</p>

<p>JWT（JSON Web Token）是一种用于身份验证和授权的开放标准，通常用于 Web 应用程序和 API。JWT 中间件使用 JWT 格式的令牌来验证请求的身份，并向请求添加一些有关用户身份的信息，例如用户 ID、角色等。</p>

<p>因此，<code>apiv1.Use(jwt.JWT())</code> 代码片段的作用是将 JWT 中间件添加到 <code>apiv1</code> 路由组中，以对该路由组中的所有 API 进行身份验证和授权。</p>

<p>1 下载：</p>

<p>go get -u github.com/dgrijalva/jwt-go</p>

<p>2. 写入：(在<code>pkg</code>下的<code>util</code>目录新建<code>jwt.go)(参考文章里的示例）</code></p>

<p>package util</p>

<p>import (<br />
&nbsp;&nbsp;&nbsp; &quot;time&quot;</p>

<p>&nbsp;&nbsp;&nbsp; jwt &quot;github.com/dgrijalva/jwt-go&quot;</p>

<p>&nbsp;&nbsp;&nbsp; &quot;github.com/EDDYCJY/go-gin-example/pkg/setting&quot;<br />
)</p>

<p>var jwtSecret = []byte(setting.JwtSecret)</p>

<p>type Claims struct {<br />
&nbsp;&nbsp;&nbsp; Username string `json:&quot;username&quot;`<br />
&nbsp;&nbsp;&nbsp; Password string `json:&quot;password&quot;`<br />
&nbsp;&nbsp;&nbsp; jwt.StandardClaims<br />
}</p>

<p>func GenerateToken(username, password string) (string, error) {<br />
&nbsp;&nbsp;&nbsp; nowTime := time.Now()<br />
&nbsp;&nbsp;&nbsp; expireTime := nowTime.Add(3 * time.Hour)</p>

<p>&nbsp;&nbsp;&nbsp; claims := Claims{<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; username,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; password,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; jwt.StandardClaims {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ExpiresAt : expireTime.Unix(),<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Issuer : &quot;gin-blog&quot;,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br />
&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp; tokenClaims := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)<br />
&nbsp;&nbsp;&nbsp; token, err := tokenClaims.SignedString(jwtSecret)</p>

<p>&nbsp;&nbsp;&nbsp; return token, err<br />
}</p>

<p>func ParseToken(token string) (*Claims, error) {<br />
&nbsp;&nbsp;&nbsp; tokenClaims, err := jwt.ParseWithClaims(token, &amp;Claims{}, func(token *jwt.Token) (interface{}, error) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return jwtSecret, nil<br />
&nbsp;&nbsp;&nbsp; })</p>

<p>&nbsp;&nbsp;&nbsp; if tokenClaims != nil {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if claims, ok := tokenClaims.Claims.(*Claims); ok &amp;&amp; tokenClaims.Valid {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return claims, nil<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp; return nil, err<br />
}</p>

<p>3.在<code>middleware</code>下新建<code>jwt</code>目录，新建<code>jwt.go</code>文件：</p>

<p>package jwt</p>

<p>import (<br />
&nbsp;&nbsp;&nbsp; &quot;time&quot;<br />
&nbsp;&nbsp;&nbsp; &quot;net/http&quot;</p>

<p>&nbsp;&nbsp;&nbsp; &quot;github.com/gin-gonic/gin&quot;</p>

<p>&nbsp;&nbsp;&nbsp; &quot;github.com/EDDYCJY/go-gin-example/pkg/util&quot;<br />
&nbsp;&nbsp;&nbsp; &quot;github.com/EDDYCJY/go-gin-example/pkg/e&quot;<br />
)</p>

<p>func JWT() gin.HandlerFunc {<br />
&nbsp;&nbsp;&nbsp; return func(c *gin.Context) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var code int<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var data interface{}</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; code = e.SUCCESS<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; token := c.Query(&quot;token&quot;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if token == &quot;&quot; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; code = e.INVALID_PARAMS<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; claims, err := util.ParseToken(token)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if err != nil {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; code = e.ERROR_AUTH_CHECK_TOKEN_FAIL<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if time.Now().Unix() &gt; claims.ExpiresAt {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; code = e.ERROR_AUTH_CHECK_TOKEN_TIMEOUT<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if code != e.SUCCESS {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c.JSON(http.StatusUnauthorized, gin.H{<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;code&quot; : code,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;msg&quot; : e.GetMsg(code),<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;data&quot; : data,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; })</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c.Abort()<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c.Next()<br />
&nbsp;&nbsp;&nbsp; }<br />
}</p>

<p>4.获得token：在<code>models</code>下新建<code>auth.go</code></p>

<p>package models</p>

<p>type Auth struct {<br />
&nbsp;&nbsp;&nbsp; ID int `gorm:&quot;primary_key&quot; json:&quot;id&quot;`<br />
&nbsp;&nbsp;&nbsp; Username string `json:&quot;username&quot;`<br />
&nbsp;&nbsp;&nbsp; Password string `json:&quot;password&quot;`<br />
}</p>

<p>func CheckAuth(username, password string) bool {<br />
&nbsp;&nbsp;&nbsp; var auth Auth<br />
&nbsp;&nbsp;&nbsp; db.Select(&quot;id&quot;).Where(Auth{Username : username, Password : password}).First(&amp;auth)<br />
&nbsp;&nbsp;&nbsp; if auth.ID &gt; 0 {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return true<br />
&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp; return false<br />
}</p>

<p>5.在<code>routers</code>下的<code>api</code>目录新建<code>auth.go</code></p>

<p>package api</p>

<p>import (<br />
&nbsp;&nbsp;&nbsp; &quot;log&quot;<br />
&nbsp;&nbsp;&nbsp; &quot;net/http&quot;</p>

<p>&nbsp;&nbsp;&nbsp; &quot;github.com/gin-gonic/gin&quot;<br />
&nbsp;&nbsp;&nbsp; &quot;github.com/astaxie/beego/validation&quot;</p>

<p>&nbsp;&nbsp;&nbsp; &quot;github.com/EDDYCJY/go-gin-example/pkg/e&quot;<br />
&nbsp;&nbsp;&nbsp; &quot;github.com/EDDYCJY/go-gin-example/pkg/util&quot;<br />
&nbsp;&nbsp;&nbsp; &quot;github.com/EDDYCJY/go-gin-example/models&quot;<br />
)</p>

<p>type auth struct {<br />
&nbsp;&nbsp;&nbsp; Username string `valid:&quot;Required; MaxSize(50)&quot;`<br />
&nbsp;&nbsp;&nbsp; Password string `valid:&quot;Required; MaxSize(50)&quot;`<br />
}</p>

<p>func GetAuth(c *gin.Context) {<br />
&nbsp;&nbsp;&nbsp; username := c.Query(&quot;username&quot;)<br />
&nbsp;&nbsp;&nbsp; password := c.Query(&quot;password&quot;)</p>

<p>&nbsp;&nbsp;&nbsp; valid := validation.Validation{}<br />
&nbsp;&nbsp;&nbsp; a := auth{Username: username, Password: password}<br />
&nbsp;&nbsp;&nbsp; ok, _ := valid.Valid(&amp;a)</p>

<p>&nbsp;&nbsp;&nbsp; data := make(map[string]interface{})<br />
&nbsp;&nbsp;&nbsp; code := e.INVALID_PARAMS<br />
&nbsp;&nbsp;&nbsp; if ok {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; isExist := models.CheckAuth(username, password)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if isExist {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; token, err := util.GenerateToken(username, password)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if err != nil {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; code = e.ERROR_AUTH_TOKEN<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data[&quot;token&quot;] = token</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; code = e.SUCCESS<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; code = e.ERROR_AUTH<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp; } else {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for _, err := range valid.Errors {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; log.Println(err.Key, err.Message)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp; c.JSON(http.StatusOK, gin.H{<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;code&quot; : code,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;msg&quot; : e.GetMsg(code),<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;data&quot; : data,<br />
&nbsp;&nbsp;&nbsp; })<br />
}</p>

<p>好像非常多，有时间再继续。。。</p>

