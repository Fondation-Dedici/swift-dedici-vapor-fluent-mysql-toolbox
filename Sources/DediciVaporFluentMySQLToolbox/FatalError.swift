//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation

internal var fatalErrorHandler: (@autoclosure () -> String, StaticString, UInt) -> Never
    = Swift.fatalError(_:file:line:)
internal func restoreFatalErrorHandler() { fatalErrorHandler = Swift.fatalError(_:file:line:) }

internal func fatalError(_ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line)
    -> Never
{
    fatalErrorHandler(message(), file, line)
}
