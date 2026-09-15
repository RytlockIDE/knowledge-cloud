---
name: "flutter-hook-binary-mirror"
description: "Fixes Flutter/Dart build hooks that time out downloading precompiled binaries from GitHub: mirror-download, hash-verify, and pre-seed the real hook cache. Invoke when 'Running build hooks...' hangs or fails with GitHub timeouts, CouldNotDownloadException, zero-byte tgz, or PrecompiledFromGithubAssets errors."
---

# Flutter 预编译二进制下载修复（镜像 + 缓存预置）

## 触发场景

满足任一即按本流程处理：

- `dart test` / `flutter build` 卡在 **Running build hooks...**，或报 github.com / githubusercontent 连接超时/重置
- 错误含 `PrecompiledFromGithubAssets`、`CouldNotDownloadException`、`file(DOWNLOAD ...)` 失败
- 构建目录里出现 **0 字节的 .tgz** 或遗留 **.tmp** 文件
- CMake 插件（如 pdfrx）报 "failed to create symbolic link" 等级联错误

## 本机固定事实

- **必须使用无空格 SDK**：`C:\dev\flutter-sdk\bin`（路径中的空格会触发 objective_c hook 内部未加引号的调用 bug；junction 无效，因为路径会被规范化回真实路径）
- Pub Cache：`%LOCALAPPDATA%\Pub\Cache\hosted\pub.dev`
- 测试命令：`C:\dev\flutter-sdk\bin\dart.bat test`

## 标准流程

### 1. 确认资产名、发布标签与期望哈希（从包源码读，勿猜）

- sqlite3 包：`<cache>\sqlite3-<ver>\lib\src\hook\asset_hashes.dart`
  - `releaseTag`（如 `sqlite3-3.5.2`）
  - 每资产 SHA256（如 `sqlite3.x64.windows.dll` → 完整哈希）
  - 缓存目录名 = `download-<哈希前8位>`
- CMake 类插件（如 pdfrx）：`<cache>\pdfrx-<ver>\windows\CMakeLists.txt`
  - `PDFIUM_RELEASE`、`PDFIUM_ARCHIVE_NAME`、下载 URL 模板

### 2. 定位 hook 的真实输出目录（勿猜路径）

```powershell
Get-ChildItem ".dart_tool" -Recurse -Directory -Filter "download-*"
Get-ChildItem ".dart_tool" -Recurse -Filter "*.tmp"
```

`.tmp` 的父目录就是实际解析目录。已观察到的真实结构比直觉多一层 `build`：

```
.dart_tool\hooks_runner\shared\<pkg>\build\download-<hash8>\
```

### 3. 经镜像下载

```powershell
$url = "https://gh-proxy.com/<完整 GitHub release URL>"
Invoke-WebRequest -Uri $url -OutFile "<本地文件>" -TimeoutSec 180
```

### 4. 哈希校验（必须与包源码中的期望值一致）

```powershell
(Get-FileHash "<本地文件>" -Algorithm SHA256).Hash
```

### 5. 预置缓存

- 删除残留 `.tmp`
- 文件名必须是 hook 实际生成的名字：`targetOS.libraryFileName(basename, ...)` 在 Windows 上即使资产叫 `sqlite3.x64.windows.dll`，落盘也是 **`sqlite3.dll`**
- 必要时同时放置 `build\download-*` 与非 `build` 两个候选位置
- CMake 下载的 tgz（如 pdfium）要放到其构建目录并手动解包：`tar -xzf <file>.tgz -C <dir>`，再确认 bin/dll 与 include 头文件齐全

### 6. 重跑

Hook 会先做 SHA256 校验，匹配即直接复用，不再联网。

## 本机两个易误判点

1. **CreateSymbolicLink 返回 False / errno 2，但链接实际已创建成功**（过滤驱动所致）。用 `Test-Path <link>` 与目标文件是否可解析来判断，不要只信返回码或 CMake 打印的 error 文字。
2. **开发者模式状态**以注册表为准：
   `HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock` 的 `AllowDevelopmentWithoutDevLicense = 1`。
   若缺失：`start ms-settings:developers` 让用户开启。
