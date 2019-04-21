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