import { SpinKit, SpinType } from '@pura/spinkit'
import { router } from '@kit.ArkUI'

@Entry
@Component
struct Splash {
  build() {
    Column() {
      Image('https://www.wanandroid.com/resources/image/pc/logo.png').width(130).height(130)

      SpinKit({ spinType: SpinType.spinC, spinColor: Color.Green, spinSize: 30 }).margin({ top: 20 })

    }.alignItems(HorizontalAlign.Center).width("100%").height("100%").padding({ top: "15%" })
  }

  aboutToAppear(): void {
    setTimeout(() => {
      router.pushUrl(
        { url: "pages/Index" }
      ).then(() => {
        router.clear()
      })
    }, 2000)
  }
}