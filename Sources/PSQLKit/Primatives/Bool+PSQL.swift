import Foundation
import PostgresKit
import SQLKit

extension Bool: PSQLExpression {
    public static var postgresColumnType: PostgresColumnType { .boolean }
    
    public func serialize(to serializer: inout SQLSerializer) {
        serializer.write("\(self)")
    }
}

extension Bool: TypeEquatable {
    public typealias CompareType = Self
}

extension Bool: SelectSQLExpression {
    public var selectSqlExpression: some SQLExpression {
        RawValue(self)
    }
}

extension Bool: CompareSQLExpression {
    public var compareSqlExpression: some SQLExpression { self }
}

extension Bool: JoinSQLExpression {
    public var joinSqlExpression: some SQLExpression { self }
}
