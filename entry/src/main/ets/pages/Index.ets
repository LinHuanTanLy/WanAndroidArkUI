import { SpinKit, SpinType } from '@pura/spinkit'
import HttpUtils from "../utils/HttpUtils"
import { router } from '@kit.ArkUI'

@Entry
@Component
struct Index {
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack();

  build() {
    Navigation(this.pageInfos) {
      Column(){
        Button("TO HOME").onClick(()=>{
          this.pageInfos.pushPathByName("HomePage",null,true)
        })
      }
    }
    .height('100%')
    .width('100%')
    .mode(NavigationMode.Stack)
    .hideBackButton(true)
    .titleMode(NavigationTitleMode.Mini)
    .toolbarConfiguration([

    ])
  }

  onPageShow(): void {
    setTimeout(() => {
    }, 3000)
  }
}