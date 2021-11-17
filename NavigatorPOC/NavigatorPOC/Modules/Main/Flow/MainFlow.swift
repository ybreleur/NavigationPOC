import UIKit

class MainFlow: Flow {

    override func navigateTo(_ step: Step) {
        guard let step = step as? MainStep else {
            navigateToParent(step)
            return
        }

        switch step {
        case .initialStep:
            showUserCreationFlow()
            break

        case let .getError(title, message):
            showError(title: title, message: message)

        case .selectionGallery:
            showGallery()
        }
    }
}

extension MainFlow {
    func showUserCreationFlow() {
        guard let coordinator = coordinator else { return }
        let flow = UserCreationFlow.CreateSubFlow(coordinator: coordinator, parent: self)
        flow.navigateTo(UserCreationStep.initialStep)
    }

    func showError(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        coordinator?.present(alert: alert)
    }

    func showGallery() {
        print("Call the Gallery and show it ^-^")

    }
}
