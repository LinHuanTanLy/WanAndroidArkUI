import HttpUtils from "../utils/HttpUtils"

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%').onClick(e => {
      HttpUtils<string>({
        url: "/harmony/index/json"
      }).then(val => {
        console.log("lht-----val is ", val.data['links'])
      })
    })
  }
}