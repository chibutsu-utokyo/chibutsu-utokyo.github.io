#!/usr/bin/env python3
import sys
import os

#
# このスクリプトは、 `docs` 以下の全てのMarkdownファイルの
# 句読点を統一するためのスクリプトです。
#
# 使い方:
#   $ python sanitize.py
#


def main(target_dir):
    for root, dirs, files in os.walk(target_dir):
        for filename in files:
            if filename.endswith(".md"):
                filepath = os.path.join(root, filename)
                with open(filepath, "r", encoding="utf-8") as f:
                    text = f.read()

                # 句読点を統一
                text = text.replace("，", "、").replace("．", "。")

                with open(filepath, "w", encoding="utf-8") as f:
                    f.write(text)


if __name__ == "__main__":
    main("docs")
