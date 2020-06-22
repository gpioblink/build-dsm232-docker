# build-dsm232-docker

GPLソースをビルドして、`dsm232.bin`、`dsm232.img`、`dsm232_fact.img`を作成できるdocker環境です。

このリポジトリを落としてきて、`docker-compose up --build`を実行するとbuildディレクトリが作成され、そこにビルドしたイメージが保存されます。

# 参考

元のコードはこれを参考にしました。「PQI Air Card」と同じコンパイラでとても役立ちました！

https://github.com/Sakaki/PQICC

その他の参考はDockerfile内をご覧ください。