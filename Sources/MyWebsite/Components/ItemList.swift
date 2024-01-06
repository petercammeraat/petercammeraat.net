//
//  ItemList.swift
//  petercammeraat.net
//  BSD 3-Clause License
//  Copyright 2024 Peter Cammeraat
//

import Foundation
import Plot
import Publish

struct ItemList<Site: Website>: Component {
    var items: [Item<Site>]
    var site: Site

    var body: Component {
        let short = DateFormatter()
        short.dateFormat = "dd/MM"

        return Div {
            for item in items where item.sectionID == Site.SectionID.init(rawValue: "journal") {
                Div {
                    Link(url: item.path.absoluteString, label: {
                        Div {
                            Time(datetime: item.date.ISO8601Format()) {
                                Paragraph(short.string(from: item.date))
                            }

                            H3(item.title)
                        }
                        .class("post-row")
                    })
                }
                .class("post")
            }
        }
        .class("posts")
    }
}
