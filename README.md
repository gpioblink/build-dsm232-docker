# build-dsm232-docker

これは、dlinkのgcluster(dsm232)をLinuxとして活用するためのリポジトリです。
GPLソースのビルドはもちろん、任意のシェルスクリプトを動かすためのイメージを生成することもできます。

# DSM232ソースのビルド

このリポジトリを落としてきて、`docker-compose up --build build-dsm260-image`を実行するとbuildディレクトリが作成され、そこにビルドしたイメージが保存されます。`dsm232.bin`、`dsm232.img`、`dsm232_fact.img`を作成できます。

**このソースは、RSA署名が違うため、G-cluster上に焼いたところでそのまま実行はできません(bootmを使用して独自でブートする必要がある)。UARTの接続ができていない方は、このイメージを焼かないでください。**

dsm232上で実行する際は、`dsm232.img`を`factory.img`にリネームして、USBメモリのルートから`cameo_factory/factory.img`に置いてください。この後、USBを刺した状態でdsm232を起動すると、このイメージがdsm232のNAND上に焼かれます。

# シェルスクリプト起動のためのイメージ作成(cameohax)

まず、このリポジトリを落としてきて、`gshock/inject-files`の中に実行したいファイルやディレクトリを入れてください。`gshock/inject-files/app.sh`の内容が最初に実行されます。

ファイルの用意ができたら、`docker-compose up --build make-cameohax-image`を実行するとappディレクトリが作成され、そこにビルドしたイメージが保存されます。`app.img`、`full.img`を作成できます。

dsm232上で実行する際は、`full.img`を`factory.img`にリネームして、USBメモリのルートから`cameo_factory/factory.img`に置いてください。この後、USBを刺した状態でdsm232を起動すると、dsm232内の永続ストレージにコピーされ、`app.sh`が実行されます。

# DSM260ソースのビルド WIP

DSM232と同様に`docker-compose up --build build-dsm260-image`でビルドできます。

ただし、このビルドを実行しても、`Kernel panic - not syncing: Out of memory and no killable processes...`こんな形でカーネルパニックが発生して終了してしまいます。この件については、現在検討中です。

# 参考

元のコードはこれを参考にしました。「PQI Air Card」と同じコンパイラでとても役立ちました！

https://github.com/Sakaki/PQICC

その他の参考はDockerfile内をご覧ください。