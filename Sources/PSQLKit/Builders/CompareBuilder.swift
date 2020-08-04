import Foundation

@_functionBuilder
struct CompareBuilder {
    typealias Expression = PSQLCompareExpression
    typealias Component = PSQLExpression
    
    static func buildBlock(_ components: Component...) -> Component {
        PSQLList(components, separator: " AND ")
    }
    
    static func buildExpression(_ expression: Expression) -> Component {
        expression
    }
}
