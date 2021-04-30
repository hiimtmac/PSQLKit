import Foundation

typealias HavingBuilder = Builder<HavingSQLExpression>

extension Builder where T == HavingSQLExpression {
    public static func buildExpression<T>(
        _ expression: T
    ) -> Component where T: HavingSQLExpression {
        [expression]
    }
}
