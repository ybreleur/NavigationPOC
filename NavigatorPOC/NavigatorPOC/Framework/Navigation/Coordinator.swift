import UIKit

class Coordinator {
    private var currentFlow: Flow
    private weak var window: UIWindow?

    init(with flow: Flow, window: UIWindow?, initWith step: Step) {
        currentFlow = flow
        self.window = window
        initializeNavigation(initWith: step)
    }

    private func initializeNavigation(initWith step: Step) {
        currentFlow.configure(coordinator: self)
        currentFlow.navigateTo(step)
    }
}

extension Coordinator {
    func updateRootViewController(_ viewController: UIViewController) {
        self.window?.rootViewController = viewController
    }

    func present(alert: UIAlertController) {
        window?.rootViewController?.present(alert, animated: true)
    }

    func updateCurrentFlow(_ flow: Flow) {
        currentFlow = flow
    }
}

extension Coordinator: Stepper {
    func navigateTo(_ step: Step) {
        currentFlow.navigateTo(step)
    }
}
