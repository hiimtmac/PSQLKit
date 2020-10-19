import Foundation
import SQLKit

typealias JOIN = JoinDirective

struct JoinDirective<Table, Content>: SQLExpression where Table: FromSQLExpressible, Content: JoinSQLExpressible {
    let table: Table
    let method: SQLJoinMethod
    let content: Content
    
    init(_ table: Table, method: SQLJoinMethod = .inner, @JoinBuilder builder: () -> Content) {
        self.table = table
        self.method = method
        self.content = builder()
    }
    
    func serialize(to serializer: inout SQLSerializer) {
        method.serialize(to: &serializer)
        serializer.writeSpace()
        serializer.write("JOIN")
        serializer.writeSpace()
        table.fromSqlExpression.serialize(to: &serializer)
        serializer.writeSpace()
        serializer.write("ON")
        serializer.writeSpace()
        content.joinSqlExpression.serialize(to: &serializer)
    }
}
