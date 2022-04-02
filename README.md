# build-dsm232-docker

This is a repository for utilizing dlink's gcluster (dsm232) as Linux.
It can build GPL source as well as generate images to run arbitrary shell scripts.

これは、dlinkのgcluster(dsm232)をLinuxとして活用するためのリポジトリです。
GPLソースのビルドはもちろん、任意のシェルスクリプトを動かすためのイメージを生成することもできます。

# How to Build the DSM232 Official Source Code [DSM232ソースのビルド]

Download this repository and run `docker-compose up --build build-gpl-image`. A build directory will be created and the built image will be stored there. You can create `dsm232.bin`, `dsm232.img` and `dsm232_fact.img`.

このリポジトリをダウンロードして、`docker-compose up --build build-gpl-image`を実行してください。buildディレクトリが作成され、そこにビルドしたイメージが保存されます。`dsm232.bin`、`dsm232.img`、`dsm232_fact.img`を作成できます。

**Warning: This source code has a different RSA signature from the official one. It cannot be executed without changing the U-Boot's environment parameters. (Please do not burn this image if you do not have a UART connection for the device.)**

**注意:このソースは、RSA署名が違うため、G-cluster上に焼いたところでそのまま実行はできません(bootmを使用して独自でブートする必要がある)。UARTの接続ができていない方は、このイメージを焼かないでください。**

When running on dsm232, rename `dsm232.img` to `factory.img` and place it in `cameo_factory/factory.img` from the USB memory root. After this, when you boot dsm232 with USB plugged in, this image will be burned on the NAND of dsm232.

dsm232上で実行する際は、`dsm232.img`を`factory.img`にリネームして、USBメモリのルートから`cameo_factory/factory.img`に置いてください。この後、USBを刺した状態でdsm232を起動すると、このイメージがdsm232のNAND上に焼かれます。

# Create image for shell script execution [シェルスクリプト起動のためのイメージ作成(cameohax)]

First, download this repository and put the files or directories you want to execute in `gshock/inject-files`. The contents of `gshock/inject-files/app.sh` will be executed first.

まず、このリポジトリを落としてきて、`gshock/inject-files`の中に実行したいファイルやディレクトリを入れてください。`gshock/inject-files/app.sh`の内容が最初に実行されます。

When the files are ready, run `docker-compose up --build make-cameohax-image` to create the app directory, where the built image will be stored. You can create `app.img` and `full.img`.

ファイルの用意ができたら、`docker-compose up --build make-cameohax-image`を実行するとappディレクトリが作成され、そこにビルドしたイメージが保存されます。`app.img`、`full.img`を作成できます。

When running on dsm232, rename `full.img` to `factory.img` and place it in `cameo_factory/factory.img` from the USB memory root. After this, when you start dsm232 with the USB plugged in, it will be copied to the persistent storage in dsm232 and `app.sh` will be executed.

dsm232上で実行する際は、`full.img`を`factory.img`にリネームして、USBメモリのルートから`cameo_factory/factory.img`に置いてください。この後、USBを刺した状態でdsm232を起動すると、dsm232内の永続ストレージにコピーされ、`app.sh`が実行されます。

# WIP: How to Build the DSM232 Official Source Code (DSM260ソースのビルド WIP)

As with DSM232, you can build it with `docker-compose up --build build-dsm260-image`.

DSM232と同様に`docker-compose up --build build-dsm260-image`でビルドできます。

However, even if you execute this build, you will get `Kernel panic - not syncing: Out of memory and no killable processes...`. I am currently working on this issue.

ただし、このビルドを実行しても、`Kernel panic - not syncing: Out of memory and no killable processes...`こんな形でカーネルパニックが発生して終了してしまいます。この件については、現在検討中です。

# References (参考)

The original code was based on this project. It's the same compiler as the "PQI Air Card," and it helped a lot!

元のコードはこのプロジェクトを参考にしました。「PQI Air Card」と同じコンパイラでとても役立ちました！

https://github.com/Sakaki/PQICC

Please see inside the Dockerfile for other references.

その他の参考はDockerfile内をご覧ください。
