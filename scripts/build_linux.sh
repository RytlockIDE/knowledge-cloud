#!/bin/bash
# 知识云 Linux 一键打包脚本
# 产物：
#   installers/知识云-linux-v1.0.0.deb       （Debian/Ubuntu：sudo apt install ./xxx.deb）
#   installers/知识云-linux-v1.0.0.AppImage  （通用：chmod +x 后双击运行，无需安装）
# 环境要求：Linux + clang/cmake/ninja + Flutter Desktop 支持（flutter config --enable-linux-desktop）
set -e

APP_NAME="知识云"
APP_ID="knowledge_cloud"
VERSION="1.0.1"
PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_ROOT"

# 1. 构建 release bundle
echo "==> 构建 Linux bundle ..."
flutter build linux --release

BUNDLE="$PROJECT_ROOT/build/linux/x64/release/bundle"
if [ ! -d "$BUNDLE" ]; then
  echo "构建失败：未找到 $BUNDLE"
  exit 1
fi

OUT_DIR="$PROJECT_ROOT/installers"
mkdir -p "$OUT_DIR"

# 2. 生成 .deb
echo "==> 生成 DEB ..."
DEB_ROOT="$(mktemp -d)"
mkdir -p "$DEB_ROOT/opt/$APP_ID"
mkdir -p "$DEB_ROOT/usr/share/applications"
mkdir -p "$DEB_ROOT/usr/share/icons/hicolor/512x512/apps"
mkdir -p "$DEB_ROOT/DEBIAN"

cp -R "$BUNDLE/." "$DEB_ROOT/opt/$APP_ID/"

# 应用图标（复用现有 png）
cp "$PROJECT_ROOT/assets/icons/app_icon.png" \
  "$DEB_ROOT/usr/share/icons/hicolor/512x512/apps/$APP_ID.png"

# 桌面入口
cat > "$DEB_ROOT/usr/share/applications/$APP_ID.desktop" <<EOF
[Desktop Entry]
Name=$APP_NAME
Comment=面向学生的本地知识云专家系统
Exec=/opt/$APP_ID/$APP_ID
Icon=$APP_ID
Terminal=false
Type=Application
Categories=Education;
EOF

# deb 控制信息
INSTALLED_SIZE="$(du -sk "$DEB_ROOT/opt" | cut -f1)"
cat > "$DEB_ROOT/DEBIAN/control" <<EOF
Package: $APP_ID
Version: $VERSION
Section: education
Priority: optional
Architecture: amd64
Installed-Size: $INSTALLED_SIZE
Depends: libsecret-1-0 (>= 0.18.4), libgtk-3-0 (>= 3.22.0)
Maintainer: KnowledgeCloud
Description: 知识云 - 面向学生的本地知识云专家系统
 混合算力（Ollama 本地 + 云端 API）、可迭代知识云图、
 年级蒸馏、智能练习与学习激励系统。
EOF

DEB_PATH="$OUT_DIR/知识云-linux-v$VERSION.deb"
dpkg-deb --build "$DEB_ROOT" "$DEB_PATH"
rm -rf "$DEB_ROOT"

# 3. 生成 AppImage
echo "==> 生成 AppImage ..."
APPDIR="$(mktemp -d)/$APP_ID.AppDir"
mkdir -p "$APPDIR/usr/bin"
cp -R "$BUNDLE/." "$APPDIR/usr/bin/"
cp "$PROJECT_ROOT/assets/icons/app_icon.png" "$APPDIR/$APP_ID.png"

cat > "$APPDIR/$APP_ID.desktop" <<EOF
[Desktop Entry]
Name=$APP_NAME
Exec=$APP_ID
Icon=$APP_ID
Type=Application
Categories=Education;
EOF

# AppImage 运行时入口
cat > "$APPDIR/AppRun" <<EOF
#!/bin/bash
HERE="\$(dirname "\$(readlink -f "\${0}")")"
exec "\$HERE/usr/bin/$APP_ID" "\$@"
EOF
chmod +x "$APPDIR/AppRun"

# 获取 appimagetool（若系统未提供）
APPIMAGETOOL="$(command -v appimagetool || true)"
if [ -z "$APPIMAGETOOL" ]; then
  APPIMAGETOOL="/tmp/appimagetool-$(uname -m).AppImage"
  if [ ! -f "$APPIMAGETOOL" ]; then
    curl -L -o "$APPIMAGETOOL" \
      "https://github.com/AppImage/appimagetool/releases/download/continuous/appimagetool-$(uname -m).AppImage"
    chmod +x "$APPIMAGETOOL"
  fi
fi

APPIMAGE_PATH="$OUT_DIR/知识云-linux-v$VERSION.AppImage"
ARCH=x86_64 "$APPIMAGETOOL" "$APPDIR" "$APPIMAGE_PATH" --no-appstream
rm -rf "$(dirname "$APPDIR")"

echo "==> 完成："
echo "  DEB:      $DEB_PATH （安装：sudo apt install \"$DEB_PATH\"）"
echo "  AppImage: $APPIMAGE_PATH （运行：chmod +x 后双击）"
