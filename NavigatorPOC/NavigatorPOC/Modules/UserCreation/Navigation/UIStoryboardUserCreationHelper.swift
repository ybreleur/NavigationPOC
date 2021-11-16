import UIKit

extension UIStoryboard {
    static func getInitialUserCreationFlow()-> UINavigationController? {
        let storyboard = UIStoryboard(name: "UserCreation", bundle: nil)
        return storyboard.instantiateInitialViewController() as? UINavigationController
    }

    static func getAdressViewController() -> AdressViewController? {
        let storyboard = UIStoryboard(name: "UserCreation", bundle: nil)
        return storyboard.instantiateViewController(identifier: "AdressViewController") as? AdressViewController
    }

    static func getHelpViewController() -> HelpViewController? {
        let storyboard = UIStoryboard(name: "UserCreation", bundle: nil)
        return storyboard.instantiateViewController(identifier: "HelpViewController") as? HelpViewController
    }

    static func getUploadPhotosViewController() -> UploadPhotosViewController? {
        let storyboard = UIStoryboard(name: "UserCreation", bundle: nil)
        return storyboard.instantiateViewController(identifier: "UploadPhotosViewController") as? UploadPhotosViewController
    }

    static func getSummaryViewController() -> SummaryViewController? {
        let storyboard = UIStoryboard(name: "UserCreation", bundle: nil)
        return storyboard.instantiateViewController(identifier: "SummaryViewController") as? SummaryViewController
    }


}
