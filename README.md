# kindlelamp

## kindlelampについて

Kindleの蔵書一覧を扱うライブラリです。  
Macのローカル端末が持つ `~/Library/Application Support/Kindle/Cache/KindleSyncMetadataCache.xml` を取得する、シンプルな機能です。

## つかってみる

```
from candle import candle
import json

# candle.read()でファイルを読み込みます
kindle_collction = candle.read()

# タイトル一覧だけ欲しい場合は、次のようにして取得可能です
print(kindle_collction.titles())

# json形式で出力することも可能です
# jsonのサンプルは、sample.jsonを確認してください
with open('sample.json', "w") as f:
    json.dump(result, f, default=lambda o: o.__dict__, ensure_ascii=False,
              indent=4, sort_keys=True, separators=(',', ': '))
```

## 応用

### ファイルを指定したい(想定しているパスにファイルがない場合)

次のようにファイルパスを指定可能です。

```
kindle_collction = candle.read(filepath='***')
```

### 検索したい

現在、期間を指定して検索することが可能です。

#### 購入日を指定して検索する

```
# purchase_sinceが開始日付、untilが終了日付。ともに指定された日付を含みます。
kindle_collction = candle.read().search(purchase_since='2020-01-01', purchase_until='2020-01-31')
```

#### タイトルで検索する

```
# titleでタイトルを部分一致で検索します
kindle_collction = candle.read().search(title='鬼滅')
```

## できないこと

* サンプル版を取り除く
  * 解析対象のXMLにそのような区別がなかったため、サンプル版と購入した書籍を分けることができません
