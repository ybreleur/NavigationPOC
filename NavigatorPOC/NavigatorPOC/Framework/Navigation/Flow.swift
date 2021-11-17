import UIKit
class Flow: Stepper {
    weak var coordinator: Coordinator?
    private var parent: Flow?

    internal required init(coordinator: Coordinator? = nil, parent: Flow? = nil) {
        self.coordinator = coordinator
        self.parent = parent
    }

    static func CreateFlow() -> Self {
        return Self.init()
    }

    static func CreateSubFlow(coordinator: Coordinator, parent: Flow) -> Self {
        let flow = Self.init(coordinator: coordinator, parent: parent)
        coordinator.updateCurrentFlow(flow)
        return flow
    }

    func configure(coordinator: Coordinator, parent: Flow? = nil) {
        self.coordinator = coordinator
        self.parent = parent
    }

    func navigateToParent(_ step: Step) {
        guard let parent = parent else {
            print("No parent flow to navigate")
            return
        }
        parent.navigateTo(step)
    }

    func navigateTo(_ step: Step) {
        print("navigateTo must be overriden")
    }

    func updateRootViewController(_ viewController: UIViewController) {
        guard let coordinator = coordinator else {
            print("No coordinator")
            return
        }
        coordinator.updateRootViewController(viewController)
    }
}
