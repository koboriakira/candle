# kindlelamp

## kindlelampについて

Kindleの蔵書一覧を扱うライブラリです。  
Macのローカル端末が持つ `~/Library/Application Support/Kindle/Cache/KindleSyncMetadataCache.xml` を取得する、シンプルな機能です。

## つかってみる

ライブラリをインストールします。

```
pip install kindlelamp
```

下のようなソースで実行可能です。

```
from kindlelamp import kindlelamp
import json

# kindlelamp.read()でファイルを読み込みます
kindle_collction = kindlelamp.read()

# タイトル一覧だけ欲しい場合は、次のようにして取得可能です
titles = kindle_collction.titles()
print(titles)

# json形式で出力することも可能です
# jsonのサンプルは、sample.jsonを確認してください
with open('sample.json', "w") as f:
    json.dump(kindle_collction, f, default=lambda o: o.__dict__, ensure_ascii=False,
              indent=4, sort_keys=True, separators=(',', ': '))
```

## 応用

### ファイルを指定したい(想定しているパスにファイルがない場合)

次のようにファイルパスを指定可能です。

```
kindle_collction = kindlelamp.read(filepath='***')
```

### 検索したい

現在、期間を指定して検索することが可能です。

#### 購入日を指定して検索する

```
# purchase_sinceが開始日付、untilが終了日付。ともに指定された日付を含みます。
kindle_collction = kindlelamp.read().search(purchase_since='2020-01-01', purchase_until='2020-01-31')
```

#### タイトルで検索する

```
# titleでタイトルを部分一致で検索します
kindle_collction = kindlelamp.read().search(title='鬼滅')
```

## できないこと

* サンプル版を取り除く
  * 解析対象のXMLにそのような区別がなかったため、サンプル版と購入した書籍を分けることができません
