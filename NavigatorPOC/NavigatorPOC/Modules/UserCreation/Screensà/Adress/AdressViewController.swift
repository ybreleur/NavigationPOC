import UIKit

class AdressViewController: UIViewController, UIViewControllerSteppable {
    private let presenter = UserCreationFormPresenter()
    @IBOutlet private weak var adress: UITextField!
    var stepper: Stepper?

    @IBAction func nextTouchUp(_ sender: Any) {
        presenter.saveAdress(adress: adress.text)
        stepper?.navigateTo(UserCreationStep.savedAdress)
    }
}
