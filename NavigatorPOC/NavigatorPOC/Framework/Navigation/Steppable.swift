import UIKit

protocol Steppable {
    var stepper: Stepper?  { get set }
}

protocol UIViewControllerSteppable: Steppable, UIViewController {

}
