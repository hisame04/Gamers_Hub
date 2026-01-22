//▼このコードはGeminiが生成したものを使用
//プロフィール設定の追加・削除用のコントローラ
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="nested-form"
export default class extends Controller {
  static targets = ["target", "template"]
  
  add(e){
    e.preventDefault()
    const content = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime())
    this.targetTarget.insertAdjacentHTML('beforeend', content)
  }

  remove(e){
    e.preventDefault()
    const wrapper = e.target.closest(".nested-form-wrapper")
    //まだ保存されていない場合
    if(wrapper.dataset.newRecord === "true"){
      wrapper.remove()
    }
    //すでに保存されている場合
    else{
      wrapper.querySelector("input[name*='_destroy']").value = 1
      wrapper.style.display = "none"
    }
  }

  connect() {
  }
}
//▲ここまでGeminiが生成したものを使用
