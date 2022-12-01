//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation
import MySQLNIO
import Vapor

extension Data: MySQLDataConvertible {
    public init?(mysqlData: MySQLData) {
        switch mysqlData.format {
        case .binary:
            guard var buffer = mysqlData.buffer else {
                return nil
            }
            guard let data = buffer.readData(length: buffer.readableBytes) else {
                return nil
            }
            self = data
        case .text:
            guard let bytes = mysqlData.string?.utf8 else { return nil }
            self = .init(bytes)
        }
    }

    public var mysqlData: MySQLData? {
        .init(
            type: .blob,
            format: .binary,
            buffer: ByteBufferAllocator().buffer(bytes: self),
            isUnsigned: false
        )
    }
}
