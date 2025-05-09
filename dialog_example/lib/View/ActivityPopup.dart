import 'package:flutter/material.dart';

/// 📦 ActivityPopup - 活動/公告類型彈窗元件
///
/// 此元件用於顯示簡單的彈窗提示，如中獎公告、活動說明、規則提醒等。
/// 提供標題 + 自定內容 + 確認/取消按鈕，樣式統一、可快速套用。
///
/// ✅ 使用特性：
/// - 可設定標題（title）
/// - 傳入任意 child 作為內容區塊（文字、圖片、列表皆可）
/// - 預設包含「確定」與「取消」按鈕，亦可隱藏取消按鈕（hasCancel）
/// - 彈窗背景為白底 + 圓角 + 陰影，適合用於 Dialog 顯示
/// - 使用 `Navigator.of(context).maybePop()` 自動關閉彈窗
///
/// 🧱 元件結構：
/// ┌───────────────────────────────┐
/// │          （標題）               │
/// │  ┌───────────────────────┐    │
/// │  │     內容 child 區塊    │    │
/// │  └───────────────────────┘    │
/// │   [取消]        [確定]         │
/// └────────────────────────────────┘
///
/// 🧪 使用範例：
/// ```dart
/// ActivityPopup(
///   title: '活動公告',
///   hasCancel: false,
///   child: Text('恭喜您中了大獎！'),
///   confirmCallback: () {
///     // 執行後續操作
///   },
/// )
/// ```
///
/// 📍 通常搭配 showDialog 或自訂 showLdDialog 使用。

class ActivityPopup extends StatelessWidget {
  final String? title;
  final Widget child;
  final bool hasCancel;
  final VoidCallback? cancelCallback;
  final VoidCallback? confirmCallback;

  const ActivityPopup({super.key, this.title, required this.child, this.hasCancel = true, this.cancelCallback, this.confirmCallback});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child:Container(
            decoration: _setupBoxDecoration(),
            child: Column(
              children: [
                _title(),
                child,
                _buttons(context),
                const SizedBox(height: 24.0),
              ],
            )
        ),
      ),
    );
  }

  //設定 title
  Widget _title() {
    if (title == null) return const Padding(padding: EdgeInsets.only(top: 18.0));
    return Padding(
      padding: const EdgeInsets.only(top: 18.0, bottom: 16.0),
      child: Text(
        title ?? '',
        style: const TextStyle(
          decoration: TextDecoration.none,
          color: Color(0xff3c3c3c),
          fontSize: 20,
          fontFamily: 'PingFangSC',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buttons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 20, right: 20),
      child: Row(children: [
        hasCancel ? _cancelButton(context) : Container(),
        hasCancel ? const SizedBox(width: 9.0) : Container(),
        _confirmButton(context)
      ]),
    );
  }

  //確認按鈕
  Expanded _confirmButton(BuildContext context) {
    return Expanded(
      child:ElevatedButton(
        onPressed: () {
          confirmCallback?.call();
          Navigator.of(context).maybePop();
        },
        child: const Text('确定'),
      ),
    );
  }

  //取消按鈕
  Widget _cancelButton(BuildContext context) {
    return Expanded(
      child:ElevatedButton(
        onPressed: () {
          cancelCallback?.call();
          Navigator.of(context).maybePop();
        },
        child: const Text('取消'),
      ),
    );
  }

  //設定背景與陰影
  BoxDecoration _setupBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(13),
      boxShadow: const [
        BoxShadow(color: Color(0x19000000), offset: Offset(0, 3), blurRadius: 15, spreadRadius: 0)
      ],
    );
  }
}