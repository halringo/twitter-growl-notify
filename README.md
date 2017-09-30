Twitter Growl notify
===

ツイートを Growl で通知する。

準備
---
1. rbenv で Ruby 2.3.5 をインストールする。

    ```sh
    $ rbenv install 2.3.5
    ```

1. リポジトリをクローンする。

    ```sh
    $ git clone git@github.com:halringo/twitter-growl-notify.git
    $ cd twitter-growl-notify
    ```

1.  Bundler をインストールする。

    ```sh
    $ gem install bundler
    ```

1. `bundle install` を実行する。

    ```sh
    $ bundle install --path vendor/bundle
    ```

1. Twitter の [Application Management](https://apps.twitter.com/) でアプリケーションを登録する。
1. 登録したアプリケーションの Consumer Key や Access Token を [secret.yml](https://github.com/halringo/twitter-growl-notify/blob/master/secret.yml) に書く。


実行
---
```sh
$ bundle exec ruby streaming.rb
```


RuboCop
---
```sh
$ bundle exec rubocop
```
