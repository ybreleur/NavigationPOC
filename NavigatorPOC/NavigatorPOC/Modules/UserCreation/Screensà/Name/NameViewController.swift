import UIKit

class NameViewController: UIViewController, UIViewControllerSteppable {
    var stepper: Stepper?
    @IBOutlet private weak var firstName: UITextField!
    @IBOutlet private weak var name: UITextField!
    private let presenter = UserCreationFormPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self
    }

    @IBAction func nextTouchUpInside(_ sender: Any) {
        presenter.saveNames(firstName: firstName.text, name: name.text)
    }
}

extension NameViewController: UserCreationFormViewDelegate {
    func showError() {
        stepper?.navigateTo(MainStep.getError(title: "Warning", message: "All the fields are mandatory."))
    }

    func saveSucceded() {
        stepper?.navigateTo(UserCreationStep.savedNameFirstName)
    }
}
