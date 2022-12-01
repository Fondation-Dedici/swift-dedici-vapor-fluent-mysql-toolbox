//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Fluent
import FluentMySQLDriver

public protocol MySqlMigration: Migration {
    func prepare(on database: MySQLDatabase) -> EventLoopFuture<Void>
    func revert(on database: MySQLDatabase) -> EventLoopFuture<Void>
}

extension MySqlMigration {
    public func prepare(on database: Database) -> EventLoopFuture<Void> {
        guard let db = database as? MySQLDatabase else {
            fatalError("Could not prepare migration for non-MySQL DB: \(database)")
        }
        return prepare(on: db)
    }

    public func revert(on database: Database) -> EventLoopFuture<Void> {
        guard let db = database as? MySQLDatabase else {
            fatalError("Could not revert migration for non-MySQL DB: \(database)")
        }
        return revert(on: db)
    }
}
