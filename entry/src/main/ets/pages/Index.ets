import { SpinKit, SpinType } from '@pura/spinkit'
import HttpUtils from "../utils/HttpUtils"
import { router } from '@kit.ArkUI'
import { TabComponent } from '@cornflower/tabslayout'
import { HomePage } from './Home'

@Entry
@Component
struct Index {
  @State currentIndex: number = 0;
  private controller: TabsController = new TabsController();

  @Builder
  AddBuilder() {
    TabComponent({
      currentIndex: 2,
      selectIndex: this.currentIndex,
      normalIcon: $r("app.media.publish"),
      selectIcon: $r("app.media.publish_selected"),
      showBadge: false,
      message: ''
    }).width("100%").height(56)
  }

  @Builder
  TextBuilder(currentIndex: number, title: string) {
    TabComponent({
      name: title,
      currentIndex: currentIndex,
      selectIndex: this.currentIndex,
      normalColor: "#333333",
      selectColor: $r("app.color.theme_color"),
      showBadge: false,
      message: ''
    }).width("100%").height(56)
  }

  build() {
      Tabs({
        barPosition: BarPosition.End, controller: this.controller
      }) {
        TabContent() {
          HomePage()
        }.tabBar(this.TextBuilder(0, '首页'))

        TabContent() {
          Column() {
            Text("体系").fontSize(32)
          }.width('100%')
        }.tabBar(this.TextBuilder(1, '体系'))

        TabContent() {
        }.tabBar(this.AddBuilder())

        TabContent() {
          Column() {
            Text("广场").fontSize(32)
          }.width('100%')
        }.tabBar(this.TextBuilder(3, '广场'))

        TabContent() {
          Column() {
            Text("我的").fontSize(32)
          }.width('100%')
        }.tabBar(this.TextBuilder(4, '我的'))
      }.onChange((index) => {
        this.currentIndex = index;
      })
  }

  onPageShow(): void {
    setTimeout(() => {
    }, 3000)
  }
}

