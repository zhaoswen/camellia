import 'package:camellia/variables/theme.dart';
import 'package:get/get.dart';

class GlobalConfig extends GetxController {
  // region 通用配置

  // 当前主题文件
  var theme = Theme().obs;

  // 暗色模式 darkMode
  var darkMode = false.obs;

  // 跟随系统明暗变化
  var followSystemDarkMode = true.obs;

  // 语言（如果为auto，则应用系统的语言偏好）
  var language = "zh".obs;

  // 开机自启动
  var autoStart = false.obs;

  // 检查保存状态（如果关闭，系统将不再监视保存状态，可能引起操作丢失）
  var checkSaved = true.obs;

  // 全局字体增量（会在默认字体大小上增加这个值）
  var fontDelta = 0.obs;

  // endregion

  // region 日志配置

  // 最大设计器历史记录数
  var maxDesignHistory = 25.obs;

  // 最大状态管理器历史记录数
  var maxStatusHistory = 20.obs;

  // 最大日志条数
  var maxLog = 1000.obs;

  // 日志自动滚动到底部
  var logConsoleAutoScroll = true.obs;

  // 日志控制台样式
  var logConsoleTheme = "".obs;

  // 持久化历史记录到磁盘
  var persistHistory = true.obs;

  // 持久化日志到磁盘
  var persistLog = true.obs;

  // 日志记录级别
  var logLevel = 0.obs;

  // 最大日志分块条数（每100条分一个文件，仅在 persistLog 为 true 时有效）
  var maxLogChunk = 100.obs;

  // 最大日志分块大小，单位Mb（每10M分一个文件，仅在 persistLog 为 true 时有效）
  var maxLogChunkSize = 10.obs;

  // endregion

  // region 更新配置
  // 中央仓库地址
  Rx<String> centralRepository = "hub.stardust.tineaine.cn".obs;

  // 更新策略
  var updatePolicy = UpdateVersionPolicy.latest.obs;

  // 自动更新策略
  var autoUpdatePolicy = AutoUpdatePolicy.remind.obs;

  // endregion

  // region 隐私配置

  // 是否允许上报错误日志（仍然可以手动点击上报）
  var allowReportError = false.obs;

  // endregion

  // region 扩展配置

  // 是否允许加载插件
  // 插件可以提供非常多的额外功能，但恶意的开发者可以通过插件来注入恶意代码，因此需要开发者手动控制是否允许加载插件。
  // 我觉得这个软件后续完善后，应该可以广泛的支持大多数常见场景，其他的难以触及的再使用插件
  var allowLoadPlugin = false.obs;

  // endregion
}

// 版本更新策略
enum UpdateVersionPolicy {
  // 保持最新稳定版本
  stable,

  // 保持最新主线版本
  latest,

  // 最新的预览版本
  preview,

  // 最新开发测试版本
  develop,
}

// 自动更新策略
enum AutoUpdatePolicy {
  // 仅提醒
  remind,
  // 自动下载
  autoDownload,
  // 自动安装
  autoInstall,
  // 禁用自动更新
  disable,
}
