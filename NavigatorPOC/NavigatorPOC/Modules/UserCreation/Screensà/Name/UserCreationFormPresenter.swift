class UserCreationFormPresenter {
    weak var delegate: UserCreationFormViewDelegate?
    private static var fakePersitance = ContextUserCreation()

    func saveNames(firstName: String?, name: String?) {
        guard let firstName = firstName, !firstName.isEmpty, let name = name, !name.isEmpty else {
            delegate?.showError()
            return
        }
        let namesUser = NamesUser(firstNAme: firstName, name: name)
        Self.fakePersitance.names = namesUser
        delegate?.saveSucceded()
    }

    func saveAdress(adress: String?) {
        guard let adress = adress, !adress.isEmpty else {
            delegate?.showError()
            return
        }
        let adressUser = AdressUser(adress: adress)
        Self.fakePersitance.adress = adressUser
        delegate?.saveSucceded()
    }
}

// DATAProvider
struct ContextUserCreation {
    var names: NamesUser?
    var adress: AdressUser?
}

struct NamesUser {
    let firstNAme: String
    let name: String
}

struct AdressUser {
    let adress: String
}
