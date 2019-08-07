//
//  Note.swift
//  Ya.Notes
//
//  Created by Daniel Kunis on 08/08/2019.
//  Copyright © 2019 Daniel Kunis. All rights reserved.
//

import UIKit

struct Note {
    
    enum NoteImportance {
        
        case important
        case ordinary
        case unimportant
    }
    
    let uid: String
    let title: String
    let content: String
    let color: UIColor
    let importance: NoteImportance
    let selfDestructionDate: Date?
    
    init(uid: String = UUID().uuidString,
         title: String,
         content: String,
         color: UIColor = .white,
         importance: NoteImportance,
         selfDestructionDate: Date? = nil) {
        
        self.uid = uid
        self.title = title
        self.content = content
        self.color = color
        self.importance = importance
        self.selfDestructionDate = selfDestructionDate
    }
    
}
