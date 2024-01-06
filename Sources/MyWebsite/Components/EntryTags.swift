//
//  EntryTags.swift
//  petercammeraat.net
//  BSD 3-Clause License
//  Copyright 2024 Peter Cammeraat
//

import Plot
import Publish

struct EntryTags<Site: Website>: Component {
    var item: Item<Site>
    var site: Site

    var body: Component {
        Div {
            for tag in item.tags {
                Link(tag.string, url: site.path(for: tag).absoluteString)
            }
        }
        .class("tags")
    }
}
