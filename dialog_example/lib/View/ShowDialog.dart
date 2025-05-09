import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Utility/MaterialInkWell.dart';

/// 📦 showLdDialog - 多頁彈窗顯示函式（翻頁 + 指示器 + 關閉鍵）
///
/// ✅ 功能用途：
/// 用來顯示一個可翻頁的 Dialog，每一頁對應一個 Widget，適合用於：
/// - 活動彈窗說明（多頁提示）
/// - 首次開啟 App 的新手教學（Onboarding）
/// - 自訂 popup 區塊輪播（如圖片、文字、規則）
///
/// ✅ 元件特性：
/// - 可傳入任意頁面（pages）列表，透過 `ExpandablePageView` 自動調整高度
/// - 預設置中顯示（`Center`）
/// - 支援白色圓點動畫指示器（`SmoothPageIndicator`）
/// - 支援是否可點背景關閉（`dismissible`）
/// - 支援是否顯示右上角關閉按鈕（`showCloseButton`）
/// - 可搭配你自定義的 `ActivityPopup` 或任意 Widget 當作內容
///
/// ✅ 常見用法：
/// ```dart
/// showLdDialog(context, pages: [
///   ActivityPopup(title: '活動規則 1', child: Text('內容1')),
///   ActivityPopup(title: '活動規則 2', child: Text('內容2')),
/// ]);
/// ```
///
/// ✅ 參數說明：
/// - [pages]：每一頁要顯示的 Widget（建議使用相同寬度的彈窗元件）
/// - [dismissible]：點背景是否可關閉 Dialog（預設 false）
/// - [showCloseButton]：右上角是否顯示關閉按鈕（預設 true）
///
/// ✅ 額外說明：
/// - 使用 `ExpandablePageView` 可自動撐高每一頁高度
/// - `MaterialInkWell.stadium` 實作圓角按鈕關閉手勢
/// - `Navigator.of(ctx).maybePop()` 為安全關閉方式


Future showLdDialog(BuildContext context,
    {required List<Widget> pages, bool dismissible = false, bool showCloseButton = true}) {
  final PageController controller = PageController(initialPage: 0);
  return showDialog(
      context: context,
      barrierDismissible: dismissible,
      builder: (ctx) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Offstage(
                offstage: !dismissible ? false : !showCloseButton, // 如果barrierDismissible=false, 一定會顯示close button
                child: Align(
                    alignment: Alignment.centerRight,
                    child: MaterialInkWell.stadium(
                        onTap: () {
                          Navigator.of(ctx).maybePop();
                        },
                        child: const Icon(Icons.cancel, color: Colors.white, size: 24.0))),
              ),
              const SizedBox(height: 12.0),
              ExpandablePageView(
                controller: controller,
                children: pages,
              ),
              const SizedBox(height: 24.0),
              Offstage(
                  offstage: pages.length == 1,
                  child: SmoothPageIndicator(
                      controller: controller, // PageController
                      count: pages.length,
                      effect: ExpandingDotsEffect(
                          dotHeight: 8.0,
                          dotWidth: 8.0,
                          expansionFactor: 2,
                          activeDotColor: Colors.white,
                          dotColor: Colors.white.withOpacity(0.5)), // your preferred effect
                      onDotClicked: (index) {})
              )
            ],
          ),
        );
      });
}
