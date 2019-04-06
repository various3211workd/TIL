# neon
Rustとnodejsを使用してデスクトップアプリケーションを作成するためのモジュール

## インストール手順

```powershell
PS>git clone https://github.com/electron/electron-quick-start
PS>cd electron-quick-start
PS>npm install && npm start

PS>vi package.json "devDependencies": {
    ...
    "electron-build-env": "^0.2",
    "neon-cli": "^0.1.17"
}

PS>npm install
PS>cd node_modules
PS>neon new make-an-array
```

```powershell
PS>vi lib.rs
#[macro_use]
extern crate neon;

use neon::vm::{Call, JsResult};
use neon::js::{Object, JsArray, JsInteger, JsNumber, JsObject};
use neon::mem::Handle;

fn make_an_array(call: Call) -> JsResult<JsArray> {
    let scope = call.scope; // the current scope for rooting handles
    let array: Handle<JsArray> = JsArray::new(scope, 3);
    try!(array.set(0, JsInteger::new(scope, 9000)));
    try!(array.set(1, JsObject::new(scope)));
    try!(array.set(2, JsNumber::new(scope, 3.14159)));
    Ok(array)
}

register_module!(m, {
    m.export("make_an_array", make_an_array)
});
```

```powershell
PS>vi index.js
var addon = require('../native');

exports.make_an_array = addon.make_an_array;

PS>vi package.json
"scripts": {
    "build": "electron-build-env neon build make-an-array",
    ...
}
```

```powershell
PS>vi index.html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Hello World!</title>
  </head>
  <body>
    <h1>Hello World!</h1>
    <!-- All of the Node.js APIs are available in this renderer process. -->
    We are using Node.js <script>document.write(process.versions.node)</script>,
    Chromium <script>document.write(process.versions.chrome)</script>,
    and Electron <script>document.write(process.versions.electron)</script>.
  </body>

  <script>
   // You can also require other files to run in this process
    console.log(require('make-an-array').make_an_array());
    require('./renderer.js');
  </script>
</html>
```

```powershell
PS>npm run build
PS>npm start
```