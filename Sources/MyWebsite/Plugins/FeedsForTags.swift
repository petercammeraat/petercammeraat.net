//
//  FeedForTags.swift
//  petercammeraat.net
//  BSD 3-Clause License
//  Copyright 2024 Peter Cammeraat
//

import Files
import Foundation
import Plot
import Publish

struct Cache: Codable {
    let config: RSSFeedConfiguration
    let feed: String
    let itemCount: Int
}

public extension Plugin {
    static func generateRSSFeedsForTags() -> Self {
        Plugin(name: "Generate RSS Feeds for Tags") { context in
            for tag in context.allTags {
                let config = RSSFeedConfiguration(targetPath: "tags/\(tag.normalizedString())/index.xml")
                let outputFile = try context.createOutputFile(at: config.targetPath)
                let cacheFile = try context.cacheFile(named: "feed")
                let oldCache = try? cacheFile.read().decoded() as Cache

                let items: [Item<Site>] = context.items(taggedWith: tag)

                let date = Date()

                if date == context.lastGenerationDate, let cache = oldCache {
                    if cache.config == config, cache.itemCount == items.count {
                        let newlyModifiedItem = items.first { $0.lastModified > date }

                        guard newlyModifiedItem != nil else {
                            return try outputFile.write(cache.feed)
                        }
                    }
                }

                let feed = RSS(
                    .title(context.site.name),
                    .description(context.site.description),
                    .link(context.site.url),
                    .language(context.site.language),
                    .lastBuildDate(date, timeZone: context.dateFormatter.timeZone),
                    .pubDate(date, timeZone: context.dateFormatter.timeZone),
                    .ttl(Int(225)),
                    .atomLink(context.site.url(for: config.targetPath)),
                    .group(items.prefix(100).map { item in
                            .item(
                                .guid(
                                    .text(item.rssProperties.guid ?? context.site.url(for: item).absoluteString),
                                    .isPermaLink(item.rssProperties.guid == nil && item.rssProperties.link == nil)
                                ),
                                .title(item.title),
                                .description(item.description),
                                .link(item.rssProperties.link ?? context.site.url(for: item)),
                                .pubDate(item.date, timeZone: context.dateFormatter.timeZone),
                                .content(item.body.convertToNode())
                            )
                    })
                ).render()

                let newCache = Cache(config: config, feed: feed, itemCount: items.count)
                try cacheFile.write(newCache.encoded())
                try outputFile.write(feed)
            }
        }
    }
}
