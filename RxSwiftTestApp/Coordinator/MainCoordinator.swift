import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = ColorsViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }

    func dismiss() {
        navigationController.popViewController(animated: true)
    }

    func rxText() {
        let vc = TextViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
