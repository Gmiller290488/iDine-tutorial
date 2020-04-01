import SwiftUI

class Favourite: ObservableObject {

    @Published var items = [MenuItem]()

    func add(item: MenuItem) {
        items.append(item)
    }

    func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }

    func isFavourite(item: MenuItem) -> Bool {
        guard (items.firstIndex(of: item) != nil) else {
            return false
        }
        return true
    }
}
