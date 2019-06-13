# Time-Based Blind SQL Injection

`' or if(1=1, sleep(3), false) or '`を入力した場合に3秒間遅れてレスポンスが返ってきた場合に有効。

Cookieやauthenticity_tokenは、ログイン画面のレスポンスから採取してセットすること。
