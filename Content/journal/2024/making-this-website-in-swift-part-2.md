---
title: Making this website in Swift - part 2
date: 2024-01-11 07:30
description: Making this website in Swift - part 2
tags: swift, web
---

If you are interested in making your own theme for Publish, then here are some examples:

- [https://github.com/swiftwasm/blog.swiftwasm.org](https://github.com/swiftwasm/blog.swiftwasm.org)
- [https://github.com/nonstrict-hq/nonstrict.eu-website](https://github.com/nonstrict-hq/nonstrict.eu-website)
- [https://github.com/kradalby/aspargesgaarden-swift](https://github.com/kradalby/aspargesgaarden-swift)
- [https://github.com/fbernutz/die-himmelstraeumerin-blog](https://github.com/fbernutz/die-himmelstraeumerin-blog)
- [https://github.com/vapor/blog](https://github.com/vapor/blog)


##### Small bugs and incomplete

While using Publish and Plot I encountered a lot of small bugs. Like not ending a url with a slash. Resulting in unnecessary redirects. Not having the `me` case for link relationships and much more.

For now it is workable and almost good enough for my needs. Until I write my own DSL (Domain Specific Language) to write HTML and other web markup languages in Swift. Plus writing my own static site generator in Swift will be a nice challenge. I like writing my website in Swift. Not having to leave the tools I use everyday is also a plus and it proves that Swift can be used for a lot more than iOS app development. 


##### New additions

- nice code syntax styling
- css minifier
- a [custom head](https://github.com/petercammeraat/petercammeraat.net/blob/develop/Sources/MyWebsite/Components/SiteHead.swift), so it doesn't add all the twitter metadata and fixed some weird stuff with homepage title
- allowed robots to scan and index the site
- added some site verification for Google and Bing Webmaster tools
- updated the readme, so it clear how to run this project localy
- added email address to my [public key](/public-key/) page
- created a next and previous navigator that lives below each article, so you can keep reading...

```swift
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

```


##### What is next?

I want to revamp the projects page and the style of the project pages. After that I will do some research in making my own static site generator and if there already is a DSL good enough to write web markup languages in Swift.


<small><small>#100DaysToOffload 4/100</small></small>
