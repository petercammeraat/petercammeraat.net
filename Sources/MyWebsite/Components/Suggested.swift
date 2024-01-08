//
//  Suggested.swift
//  petercammeraat.net
//  BSD 3-Clause License
//  Copyright 2024 Peter Cammeraat
//

import Plot
import Publish

struct Suggested<Site: Website>: Component {
    var context: PublishingContext<Site>
    var item: Item<Site>
    
    var body: Component {
        let items = context.allItems(sortedBy: \.date)
        let index = items.firstIndex(of: item) ?? 0
        let last = items.endIndex - 1
        
        return Navigation {
            if index != 0 {
                let previousItem = items[index - 1]
                
                Link(url: previousItem.path.absoluteString) {
                    Span("Previous")
                    Paragraph(previousItem.title)
                }
                .linkRelationship(.prev)
            }
            
            if index < last {
                let nextItem = items[index + 1]
                
                Link(url: nextItem.path.absoluteString) {
                    Span("Next")
                    Paragraph(nextItem.title)
                }
                .linkRelationship(.next)
            }
        }
        .class("suggested")
    }
}
