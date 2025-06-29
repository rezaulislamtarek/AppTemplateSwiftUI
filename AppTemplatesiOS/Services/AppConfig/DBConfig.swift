//
//  DBConfig.swift
//  AppTemplatesiOS
//
//  Created by Rezaul Islam on 6/29/25.
//
import RealmSwift

class DBConfig {
    static var shared: DBConfig = DBConfig()
    
    private init() {}
    
    func realmconfig(){
        // Set up Realm configuration
        let config = RealmSwift.Realm.Configuration(
            schemaVersion: 1,
            migrationBlock: { _, oldSchemaVersion in
                if oldSchemaVersion < 1 {
                    // Nothing to do, just increment the schema version
                }
            }
        )
        Realm.Configuration.defaultConfiguration = config
    }
}
