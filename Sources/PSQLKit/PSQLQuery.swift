import Foundation
import SQLKit
import PostgresKit

public protocol PSQLQuery: SQLExpression, QuerySQLExpression { }

extension PSQLQuery {
    public func raw(database: SQLDatabase = Self.testDB) -> (sql: String, binds: [Encodable]) {
        var serializer = SQLSerializer(database: database)
        self.serialize(to: &serializer)
        return (serializer.sql, serializer.binds)
    }
    
    public static var testDB: SQLDatabase { TestSQLDatabase() }
    
    public func execute(on database: Database) -> PSQLQueryFetcher {
        let psqlDatabase = database as! PostgresDatabase
        let sqlDatabase = psqlDatabase.sql()
        
        return PSQLQueryFetcher(query: self, database: sqlDatabase)
    }
}

extension QueryDirective: PSQLQuery {
    public var querySqlExpression: SQLExpression { self }
}
