---
title: Writing HTML with HTMLKit in Swift
date: 2024-01-18 17:00
description: Writing HTML with HTMLKit in Swift
tags: swift, web
---

Continuing my exploration of HTMLKit, I find its potential quite promising. In this post, I delve deeper into leveraging its capabilities to seamlessly integrate HTML into Swift. Along the way, I've written a small web application that fetches stock information, presenting it through both a chart and a data table. I'll be sharing specific examples of the Swift code I've authored to achieve these functionalities.

This project is open source and can be found here: [https://github.com/petercammeraat/stocks](https://github.com/petercammeraat/stocks)


### Search form

The search form includes labels, input fields, date pickers, and a submit button, making it easy for you to enter your search details and submit them smoothly.

```swift
struct SearchForm: View {
    private let ticker = "ticker"
    private let from = "from"
    private let to = "to"

    private let today = Date().convertToOnlyDate
    private let sevenDaysAgo = Calendar.current.date(
        byAdding: .day, 
        value: -7, 
        to: Date()
    )!.convertToOnlyDate

    var body: Content {
        Form {
            Label {
                "Ticker:"
            }
            Input()
                .type(.text)
                .name(ticker)
                .id(ticker)

            Label {
                "From date:"
            }
            Input()
                .type(.date)
                .name(from)
                .id(from)
                .value(sevenDaysAgo)

            Label {
                "To date:"
            }
            Input()
                .type(.date)
                .name(to)
                .id(to)
                .value(today)

            Button {
                "Search"
            }
            .type(.submit)
        }
        .method(.post)
        .action("/search")
    }
}

```

### Handling the query

This code works behind the scenes, managing the search request on the server, retrieving stock information, and displaying it in the SearchView for you.

```swift
func getSearch(_ request: Request) async throws -> Vapor.View {
    let data = try request.content.decode(SearchPayload.self)

    let getStockData = Task {
        return try await Stock.get(search: data)
    }
    let stockData = try await getStockData.value
    return try await request.htmlkit.render(SearchView(stock: stockData))
}
```



### Search results

After searching, you'll land on a page where you can search for another stock. Plus, you'll see the results in a chart and a table for easy understanding.

```swift
struct SearchView: View {
    let stock: Stock
    let reversedResults: [Stock.Result]
    let highestClosingPrice: Double

    var body: Content {
        BaseView {
            Main {
                SearchForm()

                Div {
                    H1 { stock.ticker }
                    StockChart(stock: stock, highestClosingPrice: highestClosingPrice)
                    StockTable(reversedResults: reversedResults)
                }
                .id("results")
            }
        }
    }

    init(stock: Stock) {
        self.stock = stock
        reversedResults = stock.results.reversed()
        highestClosingPrice = stock.results.map { $0.closingPrice }.max() ?? 0
    }
}
```

### What it looks like

![Stock Web App](../../../assets/images/journal/writing-html-with-htmlkit-in-swift/stock-web-app-1.png "Stock Web App")
<br/>
![Stock Web App](../../../assets/images/journal/writing-html-with-htmlkit-in-swift/stock-web-app-2.png "Stock Web App")
<br/>
![Stock Web App](../../../assets/images/journal/writing-html-with-htmlkit-in-swift/stock-web-app-3.png "Stock Web App")
<br/>


### Thoughts

I find HTMLKit quite capable, especially with its convenient approach to writing HTML in Swift. In my next exploration, I plan to dive into the SwiftUI-like components that HTMLKit provides, discovering more about their functionality.

<small><small>#100DaysToOffload 6/100</small></small>
