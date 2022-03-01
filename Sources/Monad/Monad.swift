public struct Monad<Wrapped> {
    public enum Failure: Error {
        case foundNil
    }
    public let wrapped: Wrapped
    @available(iOS 13.0.0, *)
    public func map<NewWrapped>(_ transform: (Wrapped) async throws -> NewWrapped) async rethrows -> Monad<NewWrapped> {
        let newWrapped = try await transform(wrapped)
        return Monad<NewWrapped>(wrapped: newWrapped)
    }
    @available(iOS 13.0.0, *)
    public func compactMap<NewWrapped>(_ transform: (Wrapped) async throws -> NewWrapped?) async throws -> Monad<NewWrapped> {
        if let newWrapped = try await transform(wrapped) {
            return Monad<NewWrapped>(wrapped: newWrapped)
        } else {
            throw Failure.foundNil
        }
    }
    @available(iOS 13.0.0, *)
    public func flatMap<NewWrapped>(_ transform: (Wrapped) async throws -> Monad<NewWrapped>) async rethrows -> Monad<NewWrapped> {
        return try await transform(wrapped)
    }
    public func map<NewWrapped>(_ transform: (Wrapped) throws -> NewWrapped) rethrows -> Monad<NewWrapped> {
        let newWrapped = try transform(wrapped)
        return Monad<NewWrapped>(wrapped: newWrapped)
    }
    public func compactMap<NewWrapped>(_ transform: (Wrapped) throws -> NewWrapped?) throws -> Monad<NewWrapped> {
        if let newWrapped = try transform(wrapped) {
            return Monad<NewWrapped>(wrapped: newWrapped)
        } else {
            throw Failure.foundNil
        }
    }
    public func flatMap<NewWrapped>(_ transform: (Wrapped) throws -> Monad<NewWrapped>) rethrows -> Monad<NewWrapped> {
        return try transform(wrapped)
    }
}

