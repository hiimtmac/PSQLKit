import Foundation
import SQLKit

extension ClosedRange: CompareSQLExpressible where Bound: SQLExpression {
    struct Compare: SQLExpression {
        let range: ClosedRange<Bound>
        
        func serialize(to serializer: inout SQLSerializer) {
            serializer.write("(")
            range.lowerBound.serialize(to: &serializer)
            serializer.writeSpace()
            serializer.write("AND")
            serializer.writeSpace()
            range.upperBound.serialize(to: &serializer)
            serializer.write(")")
        }
    }
    
    var compareSqlExpression: Compare { .init(range: self) }
}
