//
//  SchemaMigrationPlan.swift
//  highpitch
//
//  Created by 이재혁 on 11/16/23.
//

import SwiftUI
import SwiftData

enum MyMigrationPlan: SchemaMigrationPlan {
    static var schemas: [any VersionedSchema.Type] {
        [VersionedSchema1.self, VersionedSchema2.self]
    }
    
    static var stages: [MigrationStage] {
        [migrateV1toV2]
    }

    static let migrateV1toV2 = MigrationStage.lightweight(
        fromVersion: VersionedSchema1.self,
        toVersion: VersionedSchema2.self
    )
}
