import Foundation

typealias COALESCE = CoalesceExpression

struct CoalesceExpression<T: PSQLable>: PSQLExpression, FunctionExpression {
    let column: PSQLColumnExpression
    let `default`: PSQLExpression
    
    init<U: TypeComparable, V: TypeComparable & PSQLExpression>(_ column: Column<U>, _ default: V) where U.T == T, V.T == T {
        self.column = column.columnExpression
        self.default = `default`
    }
    
    func serialize(to serializer: inout PSQLSerializer) {
        serializer.write("COALESCE")
        serializer.write("(")
        column.serialize(to: &serializer)
        serializer.write(", ")
        `default`.serialize(to: &serializer)
        serializer.write(")")
    }
}

extension CoalesceExpression: TypeComparable {}

extension CoalesceExpression: PSQLSelectExpression {
    var psqlSelectExpression: PSQLExpression { self }
}
