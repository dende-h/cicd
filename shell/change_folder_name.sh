#!/bin/bash

# 環境変数TARGET_HOSTの値を取得
TARGET_HOST_VALUE=${TARGET_HOST}

# ServerSpecのhost名のフォルダ名を変更
mv ./ServerSpec/spec/hostname ./ServerSpec/spec/$TARGET_HOST_VALUE
