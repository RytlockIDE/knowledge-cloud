#!/bin/bash
# 知识云 macOS 一键打包脚本
# 产物：installers/知识云-macOS-v1.0.0.dmg（拖拽 Applications 文件夹即可安装）
# 环境要求：macOS + Xcode + Flutter Desktop 支持（flutter config --enable-macos-desktop）
set -e

APP_NAME="知识云"
VERSION="1.0.0"
PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_ROOT"

# 1. 构建 release .app
echo "==> 构建 macOS .app ..."
flutter build macos --release

APP_PATH="$PROJECT_ROOT/build/macos/Build/Products/Release/knowledge_cloud.app"
if [ ! -d "$APP_PATH" ]; then
  echo "构建失败：未找到 $APP_PATH"
  exit 1
fi

# 2. 准备 dmg 暂存目录
STAGING="$(mktemp -d)"
mkdir -p "$STAGING"
cp -R "$APP_PATH" "$STAGING/$APP_NAME.app"
ln -s /Applications "$STAGING/Applications"

# 3. 生成 dmg
OUT_DIR="$PROJECT_ROOT/installers"
mkdir -p "$OUT_DIR"
DMG_PATH="$OUT_DIR/知识云-macOS-v$VERSION.dmg"
rm -f "$DMG_PATH"

echo "==> 生成 DMG ..."
hdiutil create -volname "$APP_NAME" \
  -srcfolder "$STAGING" \
  -ov -format UDZO \
  "$DMG_PATH"

rm -rf "$STAGING"

echo "==> 完成：$DMG_PATH"
echo "安装方式：双击打开 dmg，将「知识云」拖入「应用程序」文件夹"
