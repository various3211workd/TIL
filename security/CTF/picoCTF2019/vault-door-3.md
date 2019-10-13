# vault-door-3

## 問題

## 解答

ソースコードを見てみる

```java
import java.util.*;

class VaultDoor3 {
    public static void main(String args[]) {
        VaultDoor3 vaultDoor = new VaultDoor3();
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter vault password: ");
        String userInput = scanner.next();
        String input = userInput.substring("picoCTF{".length(),userInput.length()-1);            if (vaultDoor.checkPassword(input)) {
            System.out.println("Access granted.");
        } else {
            System.out.println("Access denied!");
        }
    }

    // Our security monitoring team has noticed some intrusions on some of the
    // less secure doors. Dr. Evil has asked me specifically to build a stronger
    // vault door to protect his Doomsday plans. I just *know* this door will
    // keep all of those nosy agents out of our business. Mwa ha!
    //
    // -Minion #2671
    public boolean checkPassword(String password) {
        if (password.length() != 32) {
            return false;
        }
        char[] buffer = new char[32];
        int i;
        for (i=0; i<8; i++) {
            buffer[i] = password.charAt(i);
        }
        for (; i<16; i++) {
            buffer[i] = password.charAt(23-i);
        }
        for (; i<32; i+=2) {
            buffer[i] = password.charAt(46-i);
        }
        for (i=31; i>=17; i-=2) {
            buffer[i] = password.charAt(i);
        }
        String s = new String(buffer);
        return s.equals("jU5t_a_sna_3lpm13g34c_u_4_m3rf48");
    }
}
```

`vault-door-3`よりは簡単そうやね

適当にコメントを書きつつ解く

```java
/*
  i = 0
  0 ~ 8文字目まで
  buffer = jU5t_a_s
*/
for (i=0; i<8; i++) {
    buffer[i] = password.charAt(i);
}
/*
  i = 8
  8 ~ 16
  23文字目から逆順に
  buffer = jU5t_a_s + 1mpl3_an4
*/
for (; i<16; i++) {
    buffer[i] = password.charAt(23-i);
}
/*
  i = 16
  16 ~ 32
  2ずつ増加(16, 18, 20...32)
  (30, 28, 26...)
  buffer = jU5t_a_s1mpl3_an4 + *r*m*4*u*c*3*3*
*/
for (; i<32; i+=2) {
    buffer[i] = password.charAt(46-i);
}
/*
  i = 31
  31 ~ 17
  buffer = jU5t_a_s_u_c43g3 + g*4*_*_*_*3*f*8
*/
for (i=31; i>=17; i-=2) {
    buffer[i] = password.charAt(i);
}
String s = new String(buffer);
return s.equals("jU5t_a_sna_3lpm13g34c_u_4_m3rf48");
```

```
buffer = jU5t_a_s1mpl3_an4gr4m_4_u_c33f38
```
