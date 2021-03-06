//
// Created by Viktor Belenyesi on 01/05/15.
// Copyright (c) 2015 Viktor Belenyesi. All rights reserved.
//

/* Operators */

postfix operator * {}

public postfix func *<T>(arg: Hub<T>) -> T {
    return arg.value()
}

infix operator <- { associativity left precedence 160 }

public func <-<T>(left: Source<T>, right: NSError) -> Source<T> {
    left.error(right)
    return left
}

public func <-<T>(left: Source<T>, right: T) -> Source<T> {
    left.update(right)
    return left
}

public func <-<T>(left: Source<T?>, right: T?) -> Source<T?> {
    left.update(right)
    return left
}

/* API functions */

public func definedAs<T>(calc: () -> T) -> Dynamic<T> {
    return Dynamic(calc: calc)
}

public func reactive<T>(initValue: T) -> Source<T> {
    return Source(initValue: initValue)
}

public func reactive<T>() -> Source<T> {
    return Source()
}

public func onChangeDo<T>(source: Hub<T>, callback: (T) -> ()) -> ChangeObserver<T> {
    return onChangeDo(source, skipInitial: false, callback: callback)
}

public func onChangeDo<T>(source: Hub<T>, skipInitial: Bool, callback: (T) -> ()) -> ChangeObserver<T> {
    return ChangeObserver(source: source, callback: ({_ in 
        callback(source.value())
    }), skipInitial: skipInitial)
}

public func onErrorDo<T>(source: Hub<T>, callback: (NSError) -> ()) -> ErrorObserver<T> {
    return ErrorObserver(source: source, callback: {e in callback(e!)})
}

public func timer(interval: NSTimeInterval, tick: () -> ()) -> Timer {
    return Timer.timer(interval, tick: tick)
}
