//
//  YellowHTMLFactory.swift
//  petercammeraat.net
//  BSD 3-Clause License
//  Copyright 2024 Peter Cammeraat
//

import Plot
import Publish

struct YellowHTMLFactory<Site: Website>: HTMLFactory {
    func makeIndexHTML(for index: Index, context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: index, on: context.site),
            .body {
                SiteNavigation(context: context, selectedSelectionID: nil)
                Main {
                    SiteContainer {
                        SiteSection {
                            Div {
                                Paragraph(context.site.description)
                            }
                            .class("my")
                        }

                        SiteSection {
                            Div {
                                Link(url: "/projects/quiet/", label: {
                                    Div {
                                        Div {
                                            Image(url: "/assets/quiet/quiet256.png", description: "Quiet app icon")
                                        }
                                        .class("icon")

                                        Div {
                                            H3("Quiet")
                                            Paragraph("Quiet is a content blocker for Safari on iPhone, iPad, and Mac. It's time to reclaim your Safari browsing experience. It's time the internet was just a little more Quiet.")
                                                .class("description")
                                        }
                                    }
                                    .class("project")
                                })
                            }
                            .class("projects")
                        }
                    }

                    SiteContainer {
                        SiteSection {
                            H2("Latest entries")

                            ItemList(
                                items: context.allItems(
                                    sortedBy: \.date,
                                    order: .descending
                                ),
                                site: context.site
                            )
                        }
                    }
                }
                SiteFooter()
            }
        )
    }

    func makeSectionHTML(for section: Section<Site>, context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: section, on: context.site),
            .body {
                SiteNavigation(context: context, selectedSelectionID: section.id)
                SiteSection {
                    H1(section.title)
                    ItemList(items: section.items, site: context.site)
                }
                SiteFooter()
            }
        )
    }

    func makeItemHTML(for item: Item<Site>, context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: item, on: context.site),
            .body(
                .class("item-page"),
                .components {
                    SiteNavigation(context: context, selectedSelectionID: item.sectionID)
                    SiteSection {
                        Article {
                            Div(item.content.body).class("content")
                            Span("Tagged with: ")
                            ItemTagList(item: item, site: context.site)
                        }
                    }
                    SiteFooter()
                }
            )
        )
    }

    func makePageHTML(for page: Page, context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: page, on: context.site),
            .body {
                SiteNavigation(context: context, selectedSelectionID: nil)
                SiteSection(page.body)
                SiteFooter()
            }
        )
    }

    func makeTagListHTML(for page: TagListPage, context: PublishingContext<Site>) throws -> HTML? {
        HTML(
            .lang(context.site.language),
            .head(for: page, on: context.site),
            .body {
                SiteNavigation(context: context, selectedSelectionID: nil)
                SiteSection {
                    H1("Browse all tags")
                    List(page.tags.sorted()) { tag in
                        ListItem {
                            Link(tag.string,
                                 url: context.site.path(for: tag).absoluteString
                            )
                        }
                        .class("tag")
                    }
                    .class("all-tags")
                }
                SiteFooter()
            }
        )
    }

    func makeTagDetailsHTML(for page: TagDetailsPage, context: PublishingContext<Site>) throws -> HTML? {
        HTML(
            .lang(context.site.language),
            .head(for: page, on: context.site),
            .body {
                SiteNavigation(context: context, selectedSelectionID: nil)
                SiteSection {
                    H1 {
                        Text("Tagged with ")
                        Span(page.tag.string).class("tag")
                    }

                    Link("Browse all tags",
                         url: context.site.tagListPath.absoluteString
                    )
                    .class("browse-all")

                    ItemList(
                        items: context.items(
                            taggedWith: page.tag,
                            sortedBy: \.date,
                            order: .descending
                        ),
                        site: context.site
                    )
                }
                SiteFooter()
            }
        )
    }
}

private struct ItemTagList<Site: Website>: Component {
    var item: Item<Site>
    var site: Site

    var body: Component {
        List(item.tags) { tag in
            Link(tag.string, url: site.path(for: tag).absoluteString)
        }
        .class("tag-list")
    }
}
