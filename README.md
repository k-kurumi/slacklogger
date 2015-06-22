# slack logbot

slackのログをfluentdへ投げるbot


## Usage

```
# mappingの指定
curl -XPUT 'localhost:9200/_template/slack_template2' -d '@slack.json'


bundle install --path=vendor/bundle

export SLACK_TOKEN=(Slack Real Time Messaging APIのBotsトークン)
bundle exec ruby bin/logbot.rb
```


### 分かち書きの結果を確認

```
$ curl -s 'localhost:9200/slack-2015.06.16/_analyze?analyzer=kuromoji' -d 'もう無さそうだし' | jq .
{
  "tokens": [
    {
      "token": "もう",
      "start_offset": 0,
      "end_offset": 2,
      "type": "word",
      "position": 1
    },
    {
      "token": "無い",
      "start_offset": 2,
      "end_offset": 3,
      "type": "word",
      "position": 2
    },
    {
      "token": "そう",
      "start_offset": 4,
      "end_offset": 6,
      "type": "word",
      "position": 4
    }
  ]
}
```


### TODO

- [ ] config.ymlから設定の読み込み
- [ ] テストを作る
