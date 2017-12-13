# rina's blog

## Demo
![](https://l.ruby-china.org/photo/2017/6617885b-e153-41fa-8269-10622074b34d.png!large)
![](https://l.ruby-china.org/photo/2017/b568b5b2-0090-4228-be0a-3684e4e3d465.png!large)
![](https://l.ruby-china.org/photo/2017/c2b7cc17-f397-47cd-b1ee-438736bfa85a.png!large)
![](https://l.ruby-china.org/photo/2017/b2279479-1b8e-4a5c-a0f8-0ce6560494f1.png!large)
![](https://l.ruby-china.org/photo/2017/ad5640de-77a9-4b54-9c39-42eb7c393783.png!large)
![](https://l.ruby-china.org/photo/2017/246418eb-6682-454a-87b0-c4b30eb15070.png!large)
![](https://l.ruby-china.org/photo/2017/5996e2f3-8b16-4545-8a9b-66ae7d28a7d4.png!large)
![](https://l.ruby-china.org/photo/2017/14ca8aae-8f45-425a-94e8-639114b7983d.png!large)



## 项目介绍

Rina_Blog 项目是一个 Rails 项目, 前端框架用的 bootstrap, 主要功能有: 后台管理, 订阅, 相册, Markdown 在线编辑预览, 个人简历在线编辑, 评论等功能.

## 核心技术框架

* Rails
* bootstrap
* turbolinks
* mina
* carrierwave
* kaminari

## 系统依赖

* Rails 4.2.1

## 开发环境准备

第一步, 安装项目依赖

```bash
$ bundle install
```


第二步, 启动服务

```bash
$ rails s
```

第三步, 浏览器访问: <http://127.0.0.1:3000>

结束.

## 如何发布?

第一步, 配置nginx

先根据项目里的 `/config/deploy.rb` `/config/unicorn/production.rb` `/config/nigix.conf` 文件, 修改其中的配置, 然后将 `/config/nigix.conf` 文件复制到你的服务器上 nginx 所在目录的 `/etc/nginx/conf.d` 目录下, 命名为 xxx.conf 的文件. 然后重启 nginx.


第二步, 在服务器上初始化

```bash
$ mina init
```

第三步, 发布

```bash
$ mina deploy
```

## 学习参考资料

Ruby on Rails 实践: <http://rails-practice.com/content/Chapter_1/1.1.html>

Ruby on Rails 指南: <http://guides.ruby-china.org/caching_with_rails.html>

## 贡献者

* Rina

## LICENSE

MIT
