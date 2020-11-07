import Flutter
import UIKit

public class SwiftMyFirstViewPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    registrar.register(MyFirstFlutterPlatformViewFactory(),
                       withId: "my_first_view")
  }
}

class MyFirstFlutterPlatformViewFactory: NSObject, FlutterPlatformViewFactory {
  func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
    return MyFirstView(frame: frame, arguments:args)
  }

  func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
    return FlutterStandardMessageCodec.sharedInstance()
  }
}

class MyFirstView: UIView, FlutterPlatformView {
  let label = UILabel()

  func view() -> UIView {
    return self
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("not implemented")
  }

  init(frame: CGRect, arguments: Any?) {
    super.init(frame: frame)
    backgroundColor = .yellow
    addSubview(label)

    if let arguments = arguments as? [String:Any?] {
      label.text = arguments["label"] as? String ?? "no label"
      label.sizeToFit()
    }
  }
}
