# 无线麦【Win版】（网易叭哥说适配版）

> ⚠️ **非官方版本。** 这是基于上游 [ZSTDJan/windows-remote-mic-app](https://github.com/ZSTDJan/windows-remote-mic-app)
> `v1.0.91` 的**个人适配构建**，未签名、未经上游作者审核，也未走完上游的完整真机验收流程。
> 请勿当作官方发布。

**👉 下载**：[Releases](https://github.com/letjar/windows-remote-mic-app/releases)

**相对上游 v1.0.91 的改动**

- 新增输入法：**网易叭哥说**（仅谷歌遥控器路径；自动读取其「语音润色」快捷键）
- 修复：自管理开关型输入法在「开关型下长按超过 10 秒」与「按住型下松手」两条路径上
  会留下「停不下来」的录音，之后无法再启动（需手动去输入法里关掉）

**验证状态**

- ✅ 真机复测（基于上游 1.0.87 的适配版本）：按住型按住说话 → 松手即停、
  **超过 10 秒不被打断**；开关型短按正常
- ⚠️ 已知限制（非缺陷）：开关型下**误操作长按**话筒键约 10 秒会被自动收尾。
  需要不受时长限制请改用**按住型**
- ⚠️ 本版（基于 1.0.91）尚未真机复测

- 源码：[`adapter/bageshuo` 分支](https://github.com/letjar/windows-remote-mic-app/tree/adapter/bageshuo)（GPL-3.0-only，分发二进制须同时提供此源码）
- 上游程序本身的 bug 请反馈给上游仓库；本适配引入的问题欢迎在本仓库提 Issue。

---

## 原版项目简介

无线麦把蓝牙语音遥控器的按键和麦克风变成 Windows 快捷操作与语音输入工具，可远距离控制应用、输入文字和触发 Quicker 动作。支持按键单击、双击、长按映射，适配小米蓝牙语音遥控器 2 Pro 和谷歌 TV Chromecast 遥控器，可配合搜狗、微信、豆包和 Chatterfly 使用。QQ 群：89641716。

| 谷歌遥控器按键映射 | 小米遥控器按键映射 |
| --- | --- |
| ![谷歌遥控器按键设置界面](docs/screenshots/google-buttons.jpg) | ![小米遥控器按键设置界面](docs/screenshots/xiaomi-buttons.jpg) |

![图示谷歌与小米遥控器实物对比](docs/images/remote-comparison.png)

设备参考：<br>1. 小米遥控器约 65-99 元 Type-C充电（录音功能有限制——仅支持按住型，单次录音限制 60 秒内）；<br>2. 图示谷歌遥控器约 15 元（录音功能无限制——支持按住型&开关型，录制超 60 秒）；<ins><strong>谷歌遥控器版本较多，图示款购自某多多平台「IN数码配件」，仅作型号参考，无利益关联；<br>购买谷歌遥控时注意看遥控版本差别（电池仓内）！以免买来不能用。。。</strong></ins>

## 下载与版本

**[下载正式版 1.0.91](https://github.com/ZSTDJan/windows-remote-mic-app/releases/download/v1.0.91/RemoteMicRC003-1.0.91-portable-unsigned.zip)** · [版本说明](https://github.com/ZSTDJan/windows-remote-mic-app/releases/tag/v1.0.91) · [SHA256SUMS.txt](https://github.com/ZSTDJan/windows-remote-mic-app/releases/download/v1.0.91/SHA256SUMS.txt)

当前正式版为 **1.0.91**，支持小米蓝牙语音遥控器 2 Pro 和图示谷歌 Chromecast 遥控器。新增鼠标左／右／X1／X2 长按及按键配置管理，Chatterfly 改为直接启停，修复切换设备或模式后自动快捷键未及时更新；包含豆包 0.9.2.7 适配、按键录入、普通按键权限和此前主线修复。具体功能与界面以下载的版本为准。

旧正式版和测试版保留在 [历史版本](https://github.com/ZSTDJan/windows-remote-mic-app/releases)。实体遥控器、宿主点击、44.1k 音频、文字上屏、久置／休眠恢复和异机仍按各自项目实测，原微信久置反馈电脑已按用户要求取消验收。

完整解压 ZIP 后运行其中的 `无线麦 win版 <版本号>.exe`，不要只取出 EXE。程序未签名，Windows 可能弹出安全提示；请从本仓库下载。

## 能做什么

- 给遥控器按键设置方向、确认、音量、快捷键、鼠标操作或 Quicker 动作；同一按键可分别设置单击、双击和长按。
- 用遥控器话筒键说话，在文字输入框中使用搜狗、微信、豆包或 Chatterfly 输入文字。
- 在“管理按键配置”中复制、应用、重命名和删除配置副本，或导出／导入文件备份；当前映射始终自动保存。
- 在通知区域保持运行；关闭设置窗口通常会隐藏，结束程序请从通知区域选择“完全退出”。

## 第一次使用

### 先让遥控器按键可用

1. 在 Windows 蓝牙设置中配对遥控器，再打开无线麦。
2. 在“设备”页点“选择设备”，选中刚配对的遥控器并点“使用此设备”；然后点“启动服务”。按页面提示处理未就绪的项目，直到显示已连接。
3. 按一次方向键确认能控制电脑。要改按键动作，到“按键”页选择按键，设置单击、双击或长按动作，点“完成”即保存。

![设备选择与连接状态教程](docs/screenshots/device-ready-status.jpg)

<sub>设备教程图来自旧版界面；新版按钮位置可能略有变化，操作顺序相同。</sub>

### 再设置语音输入

1. 在“语音”页安装音频组件。无线麦的输出端点选 `CABLE Input`，输入法的麦克风选 `CABLE Output`。
2. 选择搜狗、微信、豆包或 Chatterfly。搜狗、微信和豆包须核对无线麦“语音按键”与输入法对应模式一致，自动读取失败可手动录入；Chatterfly 直接控制录音，快捷键供键盘对照。小米使用按住型；谷歌还可选择开关型。
3. 先在记事本中用电脑键盘试这个快捷键，确认能打开语音输入。再把光标留在文字框里试遥控器：按住型是按住说话、松开结束；开关型是按一次开始、再按一次结束。

![输入法快捷键与虚拟麦克风配置教程](docs/screenshots/voice-configuration-example.jpg)

<sub>语音教程图以豆包输入法为例，重点是两边快捷键一致，并在输入法中选择 `CABLE Output`；新版界面位置可能略有变化。</sub>

**快捷键注意：**使用模拟快捷键的输入法应避开 Windows 和其他软件已占用的组合键；按住说话期间，这组键会保持按下，松开话筒键才释放。Chatterfly 的遥控录音使用直接控制。

首次配对、音频安装和故障排查的详细步骤见 [使用说明](apps/windows/rc003/README.md)。

## 界面介绍

| 1. 设备：选择遥控器、查看连接状态 | 2. 谷歌按键映射：设置单击、双击、长按 |
| --- | --- |
| ![无线麦设备界面](docs/screenshots/device-overview.jpg) | ![谷歌遥控器按键设置界面](docs/screenshots/google-buttons.jpg) |
| 3. 小米按键映射：设置单击、双击、长按 | 4. 语音：选择输入法和快捷键 |
| ![小米遥控器按键设置界面](docs/screenshots/xiaomi-buttons.jpg) | ![无线麦语音界面](docs/screenshots/voice-overview.jpg) |

## 交流与反馈

无线麦 QQ 群：**89641716**

<img src="docs/images/qq-group-89641716.png" alt="无线麦 QQ 群 89641716 二维码" width="320">

<details>
<summary>开发与技术资料</summary>

Windows 客户端的运行、构建和技术说明见 [开发者文档](apps/windows/rc003/README.md)。
元素导航的独立项目 OrthoFocus 见 [项目说明](apps/windows/orthofocus/README.md)。

从源码运行设置界面：

```powershell
Set-Location apps/windows/rc003
py -3.12 -m venv .venv
.\.venv\Scripts\python.exe -m pip install -r requirements-dev.txt
$env:PYTHONPATH = Join-Path (Get-Location) 'src'
.\.venv\Scripts\python.exe -m ovb_rc003 --settings
```

</details>

## 开源与安全

代码按 [GPL-3.0-only](LICENSE.md) 发布；第三方组件和素材按各自的许可与授权使用，见 [第三方说明](THIRD_PARTY_LICENSES/README.md) 和 [素材授权](ASSET_LICENSES.md)。普通问题与建议见 [参与说明](CONTRIBUTING.md)，安全漏洞请通过 [私密报告入口](SECURITY.md) 提交。
