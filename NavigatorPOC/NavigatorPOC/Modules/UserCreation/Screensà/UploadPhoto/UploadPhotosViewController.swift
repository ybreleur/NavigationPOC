import UIKit

class UploadPhotosViewController: UIViewController, UIViewControllerSteppable {
    private let presenter = UserCreationFormPresenter()
    var stepper: Stepper?

    @IBAction func nextTouchUp(_ sender: Any) {
        stepper?.navigateTo(UserCreationStep.savedAdress)
    }

    @IBAction func showGalleryTouchUp(_ sender: Any) {
        stepper?.navigateTo(MainStep.selectionGallery)
    }
}
