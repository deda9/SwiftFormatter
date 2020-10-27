# SwiftFormatter
Ruby scrip to format swift

run 
```Shell
ruby "dicrectory path which contain any swift file, coz it loops on each file and reformat it"
```

before formatting
```Swift
import UIKit
import DependancyResolver
import GoogleSignIn

class LoginViewController: ChildModalViewController, UITextFieldDelegate, GIDSignInUIDelegate {
    
    // MARK: View model
    
    override var modalLayout: ModalLayout {
   
        if UIDevice.current.userInterfaceIdiom == .pad {
            
            return .bottomAnchoredOrCentered(CGSize(width: 700.0, height: 700.0))
        }
        else {
            
            return .centeredOrFullScreen
        }
    }
    
    private var loginViewModel: LoginViewModelProtocol?
    
    // MARK: UI properties
    
    @IBOutlet
    private var backgroundImageView: UIImageView?
    
    @IBOutlet
    private var backButton: UIButton?
    
    @IBOutlet
    private var navigationBarLabel: UILabel?
    
    @IBOutlet
    private var orLabel: UILabel?
```

after formatting
```Swift
class LoginViewController: ChildModalViewController, UITextFieldDelegate, GIDSignInUIDelegate {

    // MARK: View model
    override var modalLayout: ModalLayout {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return .bottomAnchoredOrCentered(CGSize(width: 700.0, height: 700.0))
        }
        else {
            return .centeredOrFullScreen
        }
    }
    private var loginViewModel: LoginViewModelProtocol?

    // MARK: UI properties
    @IBOutlet private var backgroundImageView: UIImageView?
    @IBOutlet private var backButton: UIButton?
    @IBOutlet private var navigationBarLabel: UILabel?
    @IBOutlet private var orLabel: UILabel?
```
