//
//  NameController.swift
//  RandomizedPairsWeek6Test
//
//  Created by Joshua Danner on 6/22/18.
//  Copyright © 2018 JoshuaDanner. All rights reserved.
//

import Foundation

class NameController {
    
    // Singleton
    static let sharedController = NameController()
    
    // Source of truth
    var names: [Name] = []
    
    // CRUD
    func createName(name: String) {
        let name = Name(name: name)
        names.append(name)
        saveToPersistentStore()
    }
    func remove(name: Name) {
        if let nameIndex = names.index(of: name) {
            names.remove(at: nameIndex)
        }
        saveToPersistentStore()
    }
    
    func update(name: Name) {
        
        saveToPersistentStore()
    }
    
    
    
    // MARK: - Persistence
    
    private func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileName = "randomizedPairs.json"
        let documentsDirectoryURL = urls[0].appendingPathComponent(fileName)
        return documentsDirectoryURL
    }
    
    private func saveToPersistentStore() {
        let jsonEncoder = JSONEncoder()
        do {
            let data = try jsonEncoder.encode(names)
            try data.write(to: fileURL())
        } catch let error {
            print("There was an error saving to persistent storage: \(error.localizedDescription)")
        }
    }
    
    private func loadFromPersistenStore() {
        let jsonDecoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            let names = try jsonDecoder.decode([Name].self, from: data)
            self.names = names
        } catch let error {
            print("There was an error savin to persisten storage: \(error.localizedDescription)")
        }
    }
    init() {
        loadFromPersistenStore()
    }
    
}
