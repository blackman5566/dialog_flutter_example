import 'package:flutter/material.dart';

/// 📌 用途說明：
/// 本元件統一處理 Flutter 中常見的點擊水波紋效果（ripple effect），
/// 並支援多種形狀（圓角、圓形、膠囊形等），避免重複撰寫 Material + InkWell 組合。
///
/// ✅ 特點：
/// - 自動裁切 InkWell ripple，不會超出範圍
/// - 支援常用形狀建構子：round、circle、stadium
/// - 適合用於 dialog 按鈕、關閉鍵、Icon 點擊等 UI 情境
///
/// 🧱 使用範例：
/// ```dart
/// MaterialInkWell.round(
///   borderRadius: BorderRadius.circular(8),
///   onTap: () => print('點擊'),
///   child: Text('按鈕'),
/// );
/// ```
///
/// 👨‍💻 建議：如需擴充 ripple 顏色或 padding，可另行加入參數。
///
const BorderRadius defaultBorderRadius = BorderRadius.all(Radius.circular(10.0));

class MaterialInkWell extends StatelessWidget {
  final GestureTapCallback onTap;
  final Widget child;
  final ShapeBorder _customBorder;

  const MaterialInkWell({
    Key? key,
    required this.onTap,
    required this.child,
  })  : this._customBorder = const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        super(key: key);

  MaterialInkWell.round({
    Key? key,
    required this.onTap,
    required this.child,
    required BorderRadius? borderRadius,
  })  : this._customBorder = RoundedRectangleBorder(borderRadius: borderRadius ?? BorderRadius.zero),
        super(key: key);

  const MaterialInkWell.circle({
    Key? key,
    required this.onTap,
    required this.child,
  })  : this._customBorder = const CircleBorder(),
        super(key: key);

  const MaterialInkWell.stadium({
    Key? key,
    required this.onTap,
    required this.child,
  })  : this._customBorder = const StadiumBorder(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      type: MaterialType.transparency,
      shape: _customBorder,
      child: InkWell(
        customBorder: _customBorder,
        onTap: onTap,
        child: child,
      ),
    );
  }
}
