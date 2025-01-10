
@Builder
export function PageOnBuilder() {
  HomePage()
}

@Component
export struct HomePage {
  @State message: string = 'this is home';

  build() {
    NavDestination() {
      RelativeContainer() {
        Text(this.message)
          .id('HomePageHelloWorld')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .alignRules({
            center: { anchor: '__container__', align: VerticalAlign.Center },
            middle: { anchor: '__container__', align: HorizontalAlign.Center }
          })


        Column() {
          Button("设置").onClick((e) => {
          })

          Button("获取").onClick(async (e) => {

          })
        }
      }
      .height('100%')
      .width('100%')
    }
  }
}
