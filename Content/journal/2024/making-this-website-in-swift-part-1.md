---
title: Making this website in Swift - part 1
date: 2024-01-08 05:00
description: Making this website in Swift - part 1
tags: swift, web
---

Over the weekend, I set myself a big challenge: I wanted to switch my website from using [Hugo](https://gohugo.io), which is a static site generator, to a different one called [Publish](https://github.com/johnsundell/publish). This new one is made in Swift by John Sundell. Since I'm really into Swift this year, I thought it would be cool to use it for my website too. I thought about making a guide to show others how to do it too, but lots of people have already done that. Instead, I'll share links to those guides so you can check them out!

##### How to get started
- [https://www.danijelavrzan.com/posts/2022/06/create-portfolio-website-using-publish/](https://www.danijelavrzan.com/posts/2022/06/create-portfolio-website-using-publish/)
- [https://www.createwithswift.com/static-site-generation-with-swift-using-publish/](https://www.createwithswift.com/static-site-generation-with-swift-using-publish/)
- [https://andyregensky.dev/articles/publish-getting-started/](https://andyregensky.dev/articles/publish-getting-started/)
- [https://stefanblos.com/posts/getting-started-with-publish/](https://stefanblos.com/posts/getting-started-with-publish/)

##### Creating a custom theme

Publish comes with a basic design called Foundation that's great for starting out and trying things. But I have my very own design called Yellow, which I used with Hugo before. To make it work with Publish, I took the style and layout from Yellow and began with the index page. I had another tab open in my web browser showing how the old Hugo version of my site was set up. This way, I could look at the html code and build the new version in Publish by following along.

The first thing I focused on was creating a list of all the posts for the homepage.

Hugo:
```
<div class="container">
    <section>
        <h2>Latest entries</h2>
        <div class="posts">
            {{ range $pages.Pages }}
            <div class="post">
                <a href="{{ .RelPermalink }}">
                    <div class="post-row">
                        <time>{{ .Date.Format "02/01" }}</time>
                        <h3>{{ .Title }}</h3>
                    </div>
                </a>
            </div>
            {{ end }}
        </div>
    </section>
</div>

```


Publish:
```swift
SiteContainer {
    SiteSection {
        H2("Latest entries")

        let allEntries = context.allItems(sortedBy: \.date, order: .descending)
        let lastFiveEntries = Array(allEntries[0...5])
        ItemList(
            items: lastFiveEntries,
            site: context.site,
            sectionID: Site.SectionID.init(rawValue: "journal")!
        )
    }
}
```

Recreating the website wasn't too tough. The [Foundation theme](https://github.com/JohnSundell/Publish/blob/master/Sources/Publish/API/Theme%2BFoundation.swift) in Publish is like a helpful starting point. It shows you how things work and makes it easier to create your own unique theme.



##### My struggles so far


When I was working on my website, I noticed there aren't many guides or examples for making custom themes with Publish. Right now, if you look on GitHub, there are about [187 repositories](https://github.com/search?q=github.com%2Fjohnsundell%2Fpublish+language%3ASwift+package.swift&type=code) that use the Publish package.

Comparing it to Hugo, Hugo is more developed and adaptable. For instance:

- With Hugo, I could include HTML right in my markdown files, but that's not possible with Publish... which is a bit of a bummer.
- I had to create a plugin myself to generate RSS feeds for each tag, while Hugo already had that feature built-in.


##### Still to tackle

- Adding Previous and Next buttons at the bottom of each post.
- Adding code highlighting to make it look really sharp.
- Giving the projects page a fresh new design.


##### The cherry on top

I made this website open source. This adds to having more examples available. Feel free to look around.

→ [https://github.com/petercammeraat/petercammeraat.net](https://github.com/petercammeraat/petercammeraat.net)




<small><small>#100DaysToOffload 3/100</small></small>
