//▼このコードはGeminiが生成したものを使用
//ゲームを選択したらそれに対応するモードとロールだけ表示するコントローラ
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["gameSelect", "modeSelect", "roleSelect", "needNumInput"]
    static values = { modes: Array, roles: Array }

    connect() {
        // 初期表示時にも実行
        this.updateGlobalAvailability()
        this.updateOptions(false)
    }

    // ゲームが変更されたら発火
    updateOptions(checkDuplicate = true) {
        const selectedGameId = parseInt(this.gameSelectTarget.value) || 0

        // 1. 重複チェックなど（プロフィール編集用）
        // 投稿画面(単一行)でもエラーにならないよう内部で安全対策済み
        this.updateGlobalAvailability()

        if (!selectedGameId) {
            this.resetDependents()
            return
        }

        // プロフィール編集画面での重複アラート
        if (checkDuplicate) {
            if (this.checkDuplicate(selectedGameId)) {
                window.alert("そのゲームタイトルは既に追加されています")
                this.gameSelectTarget.value = ""
                this.resetDependents()
                this.updateGlobalAvailability()
                return
            }
        }

        // 2. モードの更新（共通: プルダウン）
        const relevantModes = this.modesValue.filter(mode => mode.game_title_id === selectedGameId)
        this.modeSelectTargets.forEach(selectElement => {
            this.populateSelect(selectElement, relevantModes)
        })

        // 3. ロールの更新（★ここがハイブリッド処理）
        if (this.hasRoleSelectTarget) {
            // ロールデータがある場合（プロフィール画面用）はフィルタリング
            const relevantRoles = this.rolesValue.length > 0 
                ? this.rolesValue.filter(role => role.game_title_id === selectedGameId) 
                : []

            this.roleSelectTargets.forEach(target => {
                // A. ターゲットが「プルダウン(SELECT)」の場合 -> プロフィール編集画面
                if (target.tagName === "SELECT") {
                    this.populateSelect(target, relevantRoles)
                } 
                // B. ターゲットが「DIV」などそれ以外の場合 -> 投稿作成画面(チェックボックス)
                else {
                    const targetGameId = parseInt(target.dataset.gameId)
                    if (targetGameId === selectedGameId) {
                        target.style.display = "block"
                    } else {
                        target.style.display = "none"
                        // 隠れる要素のチェックを外す
                        const checkbox = target.querySelector("input[type='checkbox']")
                        if (checkbox) checkbox.checked = false
                    }
                }
            })
        }

        // 4. 人数上限の更新（投稿作成画面用）
        this.updateMaxPlayers()
    }

    updateMaxPlayers(){
        if (!this.hasNeedNumInputTarget) return
        
        // modeSelectTargetが存在しない、または選択されていない場合のガード
        if (!this.hasModeSelectTarget || !this.modeSelectTarget.value) {
            this.needNumInputTarget.removeAttribute("max")
            return
        }

        const modeId = parseInt(this.modeSelectTarget.value)
        const selectedMode = this.modesValue.find(mode => mode.id === modeId)

        if (selectedMode && selectedMode.max_players) {
            const max = selectedMode.max_players-1
            this.needNumInputTarget.max = max
            
            if (parseInt(this.needNumInputTarget.value) > max) {
                this.needNumInputTarget.value = max
            }
        }
    }

    // --- 以下、プロフィール編集(複数行)用のロジック ---

    updateGlobalAvailability() {
        // 画面内の全ゲーム選択肢を取得
        const allSelects = Array.from(document.querySelectorAll("select[name*='[game_title_id]']"))
        
        // 要素が1つしかない(投稿画面)なら、非活性化処理は不要なので終了
        if (allSelects.length <= 1) return

        const selectedGameIds = allSelects
            .filter(select => {
                const wrapper = select.closest(".nested-form-wrapper")
                // wrapperがない(投稿画面)場合は「有効」とみなす
                return this.isRowActive(wrapper) && select.value
            })
            .map(select => parseInt(select.value))

        allSelects.forEach(select => {
            const wrapper = select.closest(".nested-form-wrapper")
            if (!this.isRowActive(wrapper)) return

            const myValue = parseInt(select.value)

            Array.from(select.options).forEach(option => {
                const optionValue = parseInt(option.value)
                if (!optionValue) return

                if (selectedGameIds.includes(optionValue) && optionValue !== myValue) {
                    option.disabled = true
                    if (!option.text.includes("(選択済み)")) {
                        option.text += " (選択済み)"
                    }
                } else {
                    option.disabled = false
                    option.text = option.text.replace(" (選択済み)", "")
                }
            })
        })
    }

    checkDuplicate(currentId) {
        const allSelects = Array.from(document.querySelectorAll("select[name*='[game_title_id]']"))
        // 他の行で同じIDが選ばれているかチェック
        return allSelects.some(select => {
            if (select === this.gameSelectTarget) return false // 自分自身は除外
            
            const wrapper = select.closest(".nested-form-wrapper")
            if (!this.isRowActive(wrapper)) return false // 削除済みの行は無視
            
            return parseInt(select.value) === currentId
        })
    }

    isRowActive(wrapper) {
        // wrapperがない＝単一フォーム（投稿画面）なら常にActive
        if (!wrapper) return true

        // 1. CSS非表示チェック
        if (wrapper.offsetParent === null) return false 
        
        // 2. 削除フラグチェック(_destroy)
        const destroyInput = wrapper.querySelector("input[name*='[_destroy]']")
        if (destroyInput && (destroyInput.value === "1" || destroyInput.value === "true")) {
            return false
        }
        return true
    }

    // --- 汎用リセット処理 ---

    resetDependents() {
        // モードのリセット（共通）
        this.modeSelectTargets.forEach(el => this.resetSelect(el))
        
        // ロールのリセット（ハイブリッド）
        this.roleSelectTargets.forEach(target => {
            if (target.tagName === "SELECT") {
                // プルダウンなら選択肢をリセット
                this.resetSelect(target)
            } else {
                // DIV(チェックボックス)なら非表示にしてチェックを外す
                target.style.display = "none"
                const checkbox = target.querySelector("input[type='checkbox']")
                if (checkbox) checkbox.checked = false
            }
        })
    }

    populateSelect(selectElement, options) {
        const currentValue = selectElement.dataset.selectedValue
        selectElement.innerHTML = '<option value="">選択してください</option>'
        options.forEach(option => {
            const opt = document.createElement("option")
            opt.value = option.id
            opt.innerText = option.name
            selectElement.appendChild(opt)
        })
        if (currentValue) {
            // 値が存在するか確認してからセット
            const exists = Array.from(selectElement.options).some(o => o.value == currentValue)
            if(exists) selectElement.value = currentValue
        }
    }

    resetSelect(selectElement) {
        selectElement.innerHTML = '<option value="">先にゲームを選択してください</option>'
    }
}
//▲ここまでGeminiが生成したものを使用