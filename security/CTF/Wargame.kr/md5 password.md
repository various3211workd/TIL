# md5 password

```
md5('value', true);
```

パスワードを入力するフォームが表示される。  
ソースコードが表示できるので見てみる。

```php
 <?php
 if (isset($_GET['view-source'])) {
  show_source(__FILE__);
  exit();
 }

 if(isset($_POST['ps'])){
  sleep(1);
  mysql_connect("localhost","md5_password","md5_password_pz");
  mysql_select_db("md5_password");
  mysql_query("set names utf8");
  /*
  
  create table admin_password(
   password char(64) unique
  );
  
  */

  include "../lib.php"; // include for auth_code function.
  $key=auth_code("md5 password");
  $ps = mysql_real_escape_string($_POST['ps']);
  $row=@mysql_fetch_array(mysql_query("select * from admin_password where password='".md5($ps,true)."'"));
  if(isset($row[0])){
   echo "hello admin!"."<br />";
   echo "Password : ".$key;
  }else{
   echo "wrong..";
  }
 }
?>
<style>
 input[type=text] {width:200px;}
</style>
<br />
<br />
<form method="post" action="./index.php">
password : <input type="text" name="ps" /><input type="submit" value="login" />
</form>
<div><a href='?view-source'>get source</a></div>

```

POSTで送ったパスワードの値をmd5で変換し、クエリを発行している。

md5という関数に関しての知識がないため検索。  

```php
md5(str, raw_output)

// str:         文字列
// raw_output:  TRUE binary, FALSE 16進数
```

今回はTRUEになっているので、binaryの形式でクエリの発行をしていることがわかる。

ここでこのプログラムではSQL Injectionの対策をしていないことに気が付く。

md5の形式でのSQL Injectionについて検索をしてみると

```
129581926211651571912466741651878684928
```

という値が出てくる。

これをフォームに入力し送信するとフラグが入手できる。