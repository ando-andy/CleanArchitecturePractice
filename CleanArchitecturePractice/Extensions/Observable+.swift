import RxSwift

extension SharedSequenceConvertibleType where E == Bool {
    public func not() -> SharedSequence<SharingStrategy, Bool> {
        return self.map(!)
    }
}
