import Foundation

@_functionBuilder
struct GroupByBuilder {
    static func buildBlock<Content>(_ content: Content) -> Content where Content: GroupBySQLExpressible {
        content
    }
    
    static func buildBlock<T0, T1>(
        _ t0: T0,
        _ t1: T1
    ) -> GroupByTouple<(T0, T1)> where
        T0: GroupBySQLExpressible,
        T1: GroupBySQLExpressible
    {
        .init((t0, t1))
    }
    
    static func buildBlock<T0, T1, T2>(
        _ t0: T0,
        _ t1: T1,
        _ t2: T2
    ) -> GroupByTouple<(T0, T1, T2)> where
        T0: GroupBySQLExpressible,
        T1: GroupBySQLExpressible,
        T2: GroupBySQLExpressible
    {
        .init((t0, t1, t2))
    }
    
    static func buildBlock<T0, T1, T2, T3>(
        _ t0: T0,
        _ t1: T1,
        _ t2: T2,
        _ t3: T3
    ) -> GroupByTouple<(T0, T1, T2, T3)> where
        T0: GroupBySQLExpressible,
        T1: GroupBySQLExpressible,
        T2: GroupBySQLExpressible,
        T3: GroupBySQLExpressible
    {
        .init((t0, t1, t2, t3))
    }
    
    static func buildBlock<T0, T1, T2, T3, T4>(
        _ t0: T0,
        _ t1: T1,
        _ t2: T2,
        _ t3: T3,
        _ t4: T4
    ) -> GroupByTouple<(T0, T1, T2, T3, T4)> where
        T0: GroupBySQLExpressible,
        T1: GroupBySQLExpressible,
        T2: GroupBySQLExpressible,
        T3: GroupBySQLExpressible,
        T4: GroupBySQLExpressible
    {
        .init((t0, t1, t2, t3, t4))
    }
}
