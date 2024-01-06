//
//  EntryDate.swift
//  petercammeraat.net
//  BSD 3-Clause License
//  Copyright 2024 Peter Cammeraat
//

import Foundation
import Plot
import Publish

struct EntryDate<Site: Website>: Component {
    var item: Item<Site>
    var site: Site

    var body: Component {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YY HH:MM"

        return Div {
            Time(datetime: item.date.ISO8601Format()) {
                Paragraph(dateFormatter.string(from: item.date))
            }
        }
    }
}
