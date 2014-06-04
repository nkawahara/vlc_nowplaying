# VLC nowplaying plugin for mikutter

## つかいかた

1. VLC の Lua HTTP Interface を有効にします
  1. Ctrl-p で設定を開く
  1. 左下のとこから全ての設定を表示する
  1. インターフェイス > メインインターフェイス で，拡張インターフェイスモジュールの "Web" にチェックを入れる
  1. インターフェイス > メインインターフェイス > Lua のとこで，Lua HTTP のとこに Password をいれる
  (くわしくは [公式ドキュメント](https://wiki.videolan.org/Documentation:Modules/http_intf/)を見よう)
1. この repo を ~/.mikutter/plugin/ 以下に clone します:
    `cd ~/.mikutter/plugin ; git clone https://github.com/polamjag/vlc_nowplaying_mikutter.git`
1. mikutter の設定画面で，VLC nowplaying > Basic auth password にさっき設定したやつを入力

## 何かあったら
[@polamjag](https://twitter.com/polamjag) まで

## ライセンス
Copyright (c) 2013 polamjag

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
