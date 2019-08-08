//
//  NoteExtension.swift
//  Ya.Notes
//
//  Created by Daniel Kunis on 08/08/2019.
//  Copyright © 2019 Daniel Kunis. All rights reserved.
//

import UIKit

extension Note {
    
    var json: [String: Any] {
        var json: [String: Any] = [
            "uid": uid,
            "title": title,
            "content": content
        ]
        
        if let selfDestructionDate = selfDestructionDate {
            json["selfDestructionDate"] = selfDestructionDate.timeIntervalSince1970
        }
        if color != .white {
            json["color"] = color.hexString
        }
        if importance != .normal {
            json["importance"] = importance.rawValue
        }
        
        return json
    }
    
    static func parse(json: [String: Any]) -> Note? {
        guard let uid = json["uid"] as? String,
              let title = json["title"] as? String,
              let content = json["content"] as? String
        else { return nil }
        
        var color: UIColor = .white
        if let hexString = json["color"] as? String,
            let noteColor = UIColor(hexString: hexString) {
            color = noteColor
        }
    
        var date: Date? = nil
        if let timeInterval = json["selfDestructionDate"] as? TimeInterval {
            date = Date(timeIntervalSince1970: timeInterval)
        }
    
        var importance: Importance = .normal
        if let rawValue = json["importance"] as? String,
            let noteImportance = Importance(rawValue: rawValue) {
            importance = noteImportance
        }
        
        return Note(uid: uid,
                    title: title,
                    content: content,
                    color: color,
                    importance: importance,
                    selfDestructionDate: date)
    }
}
