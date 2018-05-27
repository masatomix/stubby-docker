# stubby

```
# git clone https://github.com/masatomix/stubby-docker.git
# cd stubby-docker/
# npm install
# grunt serve
```

```
# curl http://localhost:3000/ajax/hoge/
{"param1":{"v1Param1":"v1Value1"}}
```

起動コマンド
```
# docker run  \
 -it --name my-stubby  \
 -p 8882:8882 \
 my-stubby-npm
```


独自の設定を使うには
```
# docker run  \
 -it --name my-stubby  \
 -p 8882:8882 \
 -v /docker/hostvolumes/stubby-npm/mocks:/home/stubby/mocks \
 my-stubby-npm
```
