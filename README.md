# YJKit

```swift
let label = UILabel().propertyTape
    .numberOfLines(0)
    .textColor(.red)
    .text("Hello, World!!")
    .build()
```

用了此框架之前代码如下

```swift
let label: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.textColor = .red
    label.text = "Hello, World!!"
    return label
}()
```

用了此框架,还有跟js一样直接调用json数据,因为有些数据有时候不需要转json这么麻烦的

```swift
do {
  let dic = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
  if let dic = dic as? NSDictionary {
      print(dic.jyTape.data.list[0].picUrl.build())
      print(dic.jyTape.debugInfo.data.aaa.build())
  }
} catch {
  print(error.localizedDescription)
}
```

