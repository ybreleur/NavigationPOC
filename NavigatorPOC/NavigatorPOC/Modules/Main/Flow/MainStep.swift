enum MainStep: Step {
    case initialStep
    case getError(title: String, message: String)
    case selectionGallery
}
