import TTSDK
import UIKit

@objc(TTNativeModule)
class TTNativeModule: NSObject {

@objc(showViewController) // @objc 어트리뷰트에 명시적으로 함수 이름을 선언하는 경우
func showViewController() {
    DispatchQueue.main.async {
      // 현재 앱의 최상위 UIViewController 가져오기
      if let rootVC = UIApplication.shared.keyWindow?.rootViewController {
        
        // 새로 띄울 뷰 컨트롤러 생성 (예시)
        let vc = ViewController.instance()
        vc.modalPresentationStyle = .fullScreen
        
        // iOS 화면에 모달로 표시
        rootVC.present(vc, animated: true, completion: nil)
      }
    }
  }

  // 필요 시 다른 함수들을 여기에 추가
}

