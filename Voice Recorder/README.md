# Voice Recorder - モダンSwiftUI構造

## プロジェクト構造

このプロジェクトは、モダンなSwiftUIアーキテクチャパターンに従って構造化されています。

```
Voice Recorder/
├── App/                          # アプリケーションエントリーポイント
│   ├── VoiceRecorderApp.swift    # SwiftUIアプリメイン
│   ├── AppDelegate.swift         # UIKit AppDelegate
│   └── SceneDelegate.swift       # UIKit SceneDelegate
├── Models/                       # データモデル
│   ├── Recording.swift           # 録音データモデル
│   └── AudioSession.swift        # 音声セッション管理
├── Services/                     # ビジネスロジック層
│   ├── AudioRecorderService.swift # 録音サービス
│   ├── AudioPlayerService.swift  # 再生サービス
│   └── FileManagerService.swift  # ファイル管理サービス
├── Views/                        # UI層
│   ├── Main/                     # メインビュー
│   │   ├── ContentView.swift     # メイン画面
│   │   └── RecordingsListView.swift # 録音リスト画面
│   ├── Components/               # 再利用可能なコンポーネント
│   │   ├── RecordingRow.swift    # 録音行コンポーネント
│   │   ├── AudioPlayerButton.swift # 音声再生ボタン
│   │   ├── RecordingTimer.swift  # 録音タイマー
│   │   └── ProgressBar.swift     # プログレスバー
│   └── Modifiers/                # カスタムViewModifier
├── Extensions/                   # 拡張機能
│   ├── Date+Extensions.swift     # Date拡張
│   └── View+Extensions.swift     # View拡張
├── Utilities/                    # ユーティリティ
│   ├── Constants.swift           # 定数定義
│   └── Helpers.swift             # ヘルパー関数
└── Resources/                    # リソースファイル
    ├── Assets.xcassets/          # 画像・アイコン
    ├── Info.plist               # アプリ設定
    ├── Base.lproj/              # ローカライゼーション
    └── Preview Content/         # プレビュー用リソース
```

## アーキテクチャの利点

### 1. **関心の分離**
- **Models**: データ構造とビジネスルール
- **Services**: ビジネスロジックと外部API
- **Views**: UI表示のみ
- **Extensions**: 既存クラスの機能拡張

### 2. **再利用性**
- **Components**: 小さな再利用可能なUIコンポーネント
- **Services**: 複数の画面で使用可能なサービス
- **Extensions**: プロジェクト全体で使用可能な拡張機能

### 3. **テスタビリティ**
- サービス層の分離により、単体テストが容易
- 依存性注入により、モックオブジェクトの使用が可能

### 4. **保守性**
- 明確な責任分離
- ファイルサイズの最適化
- 命名規則の統一

### 5. **スケーラビリティ**
- 新機能の追加が容易
- 既存コードへの影響を最小限に抑制

## 主要な変更点

### 従来の構造から改善された点：

1. **単一ファイルの分割**: 大きなファイルを機能別に分割
2. **サービス層の導入**: ビジネスロジックの分離
3. **コンポーネント化**: 再利用可能なUIコンポーネントの作成
4. **定数の集中管理**: デザインシステムの統一
5. **拡張機能の活用**: 既存クラスの機能拡張

## 使用方法

### 新しいコンポーネントの追加
```swift
// Views/Components/NewComponent.swift
struct NewComponent: View {
    var body: some View {
        // UI実装
    }
}
```

### 新しいサービスの追加
```swift
// Services/NewService.swift
class NewService: ObservableObject {
    // ビジネスロジック実装
}
```

### 定数の追加
```swift
// Utilities/Constants.swift
struct Constants {
    struct NewSection {
        static let value = "example"
    }
}
```

この構造により、アプリケーションの成長に合わせて効率的に開発を続けることができます。 