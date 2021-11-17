import UIKit

class UserCreationFlow: Flow {

    private var navigationController: UINavigationController?

    override func navigateTo(_ step: Step) {
        guard let step = step as? UserCreationStep else {
            navigateToParent(step)
            return
        }
        switch step {
        case .initialStep:
            configureInitialStep()
            showNameViewController()

        case .savedAdress:
            showUploadPhotos()

        case .savedNameFirstName:
            showAdress()

        case .savedUploadPhoto:
            showSummaryViewController()

        case .needHelp:
            showHelp()
        }
    }
}

extension UserCreationFlow {
    private func configureInitialStep() {
        if let initialViewController = UIStoryboard.getInitialUserCreationFlow()  {
            updateRootViewController(initialViewController)
            navigationController = initialViewController
        }
    }

    private func showNameViewController() {
        let nameViewController = navigationController?.visibleViewController as? NameViewController
        nameViewController?.stepper = coordinator
    }

    private func showAdress() {
        showAndConfigureViewController(UIStoryboard.getAdressViewController())
    }

    private func showUploadPhotos() {
        showAndConfigureViewController(UIStoryboard.getUploadPhotosViewController())
    }

    private func showHelp() {
        showAndConfigureViewController(UIStoryboard.getHelpViewController())
    }

    private func showSummaryViewController() {
        showAndConfigureViewController(UIStoryboard.getSummaryViewController())
    }

    private func showAndConfigureViewController(_ viewController: UIViewControllerSteppable?) {
        if var viewController = viewController {
            viewController.stepper = coordinator
            navigationController?.show(viewController, sender: nil)
        }
    }
}
