# 📦 彈窗工具：`showLdDialog` + `ActivityPopup`

本專案提供一組自訂的 Flutter 彈窗顯示元件，適合用於活動公告、教學提示、多頁規則顯示等場景。

---

## ✅ 功能特色

| 元件         | 說明 |
|--------------|------|
| `ActivityPopup` | 自訂彈窗容器，具備標題、內容、確定/取消按鈕、統一樣式 |
| `showLdDialog`  | 顯示可翻頁的 Dialog，支援多頁內容、自動高度、關閉按鈕、頁面指示器 |

---

## 🧪 使用方式

### 1️⃣ 建立內容頁面

你可以用 `ActivityPopup` 建立彈窗的每一頁內容：

```dart
final page1 = ActivityPopup(
  title: '活動規則',
  child: const Padding(
    padding: EdgeInsets.all(20),
    child: Text('恭喜您獲得大獎！'),
  ),
  confirmCallback: () {
    // 處理確認邏輯
  },
);

final page2 = ActivityPopup(
  title: '注意事項',
  child: const Padding(
    padding: EdgeInsets.all(20),
    child: Text('請於三日內完成兌獎。'),
  ),
);
```

### 2️⃣ 顯示 Dialog

使用 `showLdDialog` 並傳入頁面：

```dart
showLdDialog(
  context,
  pages: [page1, page2],
  dismissible: true,
  showCloseButton: true,
);
```

---

## 🎬 實際效果預覽

<img src="https://github.com/blackman5566/dialog_flutter_example/blob/main/demo2.gif?raw=true" width="300" />


---

## 🔧 延伸建議

- 可自訂 `ActivityPopup` 按鈕風格、顏色、callback
- 可擴充 `showLdDialog` 支援自動跳轉頁、延時關閉等行為

---

## 📄 License

本元件為此專案的一部分，可自由修改與使用。
