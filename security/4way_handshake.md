# 4way Handshake

## keyword  
* PMK(Pairwaise Master Key)  
WPA2-Personalでは事前共有キー  
WPA2-EnterpriseであればIEEE802.1xで交換されるキー

* Anonce(ランダムな文字列)  
* Snonce(ランダムな文字列)  
* 無線APのMACアドレス  
* 無線CLのMACアドレス  
* PTK  
* GTK  
* KEK(Key Encryption Key)  
* KCK(Key Confirmation Key)  
* TK(Temporary Key)  

1. CL(client)とAP(access point)で間でLinkを確立し、PMKを用意する。  

2. APがAnonceを生成し、クライアントに送信する  

3. CLがSnonceを生成し、PMK,Anonce,Snonce,AP、CLのMACアドレスからPTKを生成する  
> PTKはKEK(Key Encryption Key)、KCK(Key Confirmation Key)、TK(Temporary Key)の3つから成り、TKはユニキャスト通信暗号・復号用に使用する  

4. CLがSnonceをAPに送信し、APでも上記と同じ手順でPTKを生成する  

5. GTKをAPが生成し、KEKで暗号化したのちにCLに送信する  

6. CLはKCKを使用してGTKを復号化し、インストールする

7. CLからAPに4way handshakeの完了を示すメッセージを送信する

## 参考
[URL]https://milestone-of-se.nesuke.com/nw-advanced/nw-security/krack/

