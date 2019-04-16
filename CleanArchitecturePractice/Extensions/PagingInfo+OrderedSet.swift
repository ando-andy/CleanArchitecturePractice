import Foundation

extension PagingInfo where T: Hashable {
    public var itemSet: OrderedSet<T> {
        return OrderedSet(sequence: items)
    }
}
