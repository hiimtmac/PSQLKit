import Foundation
import SQLKit

public enum OrderByDirection: String, SQLExpression {
    case asc = "ASC"
    case desc = "DESC"
    
    public func serialize(to serializer: inout SQLSerializer) {
        serializer.write(rawValue)
    }
}

public struct OrderByDirective: SQLExpression {
    let content: [OrderBySQLExpression]
    
    public init(@OrderByBuilder builder: () -> [OrderBySQLExpression]) {
        self.content = builder()
    }
    
    public func serialize(to serializer: inout SQLSerializer) {
        if !content.isEmpty {
            serializer.write("ORDER BY")
            serializer.writeSpace()
            SQLList(content.map(\.orderBySqlExpression))
                .serialize(to: &serializer)
        }
    }
}

public struct OrderByModifier<Content>: OrderBySQLExpression where Content: OrderBySQLExpression {
    let content: Content
    let direction: OrderByDirection
    
    private struct _OrderBy: SQLExpression {
        let content: Content
        let direction: OrderByDirection
        
        func serialize(to serializer: inout SQLSerializer) {
            content.orderBySqlExpression.serialize(to: &serializer)
            serializer.writeSpace()
            direction.serialize(to: &serializer)
        }
    }
    
    public var orderBySqlExpression: SQLExpression {
        _OrderBy(content: content, direction: direction)
    }
}

extension OrderByDirective: QuerySQLExpression {
    public var querySqlExpression: SQLExpression { self }
}
