//
//  SchemaMigrationPlan.swift
//  highpitch
//
//  Created by 이재혁 on 11/16/23.
//

import SwiftUI
import SwiftData

enum MigrationPlan: SchemaMigrationPlan {
    static var schemas: [any VersionedSchema.Type] {
        [Schema1.self, Schema2.self]
    }
    
    static var stages: [MigrationStage] {
        [migrateV1toV2]
    }

    static let migrateV1toV2 = MigrationStage.lightweight(
        fromVersion: Schema1.self,
        toVersion: Schema2.self
    )
}
