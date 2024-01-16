---
title: Swift DSL for HTML
date: 2024-01-16 05:00
description: Looking for a good Swift Domain Specific Language (DSL) for HTML
tags: swift, web
---

Wait what is Swift DSL? In this context, Swift DSL simply refers to using Swift as a programming language to create a Domain Specific Language (DSL). A DSL is a language specialised for a particular domain or problem, making it more expressive and readable for tasks within that domain. I am looking for a DSL to write HTML in Swift.

I discovered several options and experimented with them to determine the one I prefer for building my static site generator in Swift.


##### [Vaux](https://github.com/dokun1/Vaux)

```swift
func simplePage() -> HTML {
  html {
    head {
      title(pageTitle)
    }
    body {
      div {
        pageBody
      }
    }
  }
}
```

Vaux seems to be one of the early frameworks for writing HTML in Swift. However, it hasn't received updates in years. 


##### [Plot](https://github.com/JohnSundell/Plot)

```swift
let html = HTML(
    .head(
        .title("My website"),
        .stylesheet("styles.css")
    ),
    .body(
        .div(
            .h1("My website"),
            .p("Writing HTML in Swift is pretty great!")
        )
    )
)
```

Authored by John Sundell, currently used (at time of writing) for this website. It lacks essential HTML elements, contains minor bugs, and is not actively updated.


##### [swift-web-page](https://github.com/Alja7dali/swift-web-page)

```swift
let page = document {
  html {
    head(title("YOLO!"))
    body {
      h1("Welcome!")
        .color(.tomato())
      p("You've found our site!")
    }
  }
}
```

You have the ability to include CSS through view modifiers, which is a positive step forward. Unfortunately, the downside is that it's no longer being actively maintained.


##### [HyperSwift](https://github.com/johngarrett/HyperSwift)

```swift
VStack(justify: .center, align: .center) {
    HStack(justify: .spaceEvenly, align: .center) {
        Image(url: "/images/error_bomb.png")
            .width(100)
            .height(100)

        Header(.header3) { "HTTP 500" }
            .font(weight: "bold", size: 40, family: "SF Mono")
    }

    Paragraph(fiveOfiveMessage)
}
.backgroundColor(GColors.lightRed)
.textAlign(.center)
.margin(5, .percent)
.display(.flex)
.shadow(x: 20, y: 30, color: GColors.cardShadow)
.border(width: 1, color: .black)
```

HyperSwift closely resembles SwiftUI in both appearance and user experience. Regrettably, this project is no longer under active maintenance, and there is also a lack of community support behind it.


##### [HTMLKit](https://github.com/vapor-community/HTMLKit)

```swift
struct IndexView: View {
    var body: Content {
        ViewContainer {
            Header {
                Text {
                    "Some title"
                }
                .font(.subheadline)
                .backgroundColor(.red)
            }
        }
    }
}
```

HTMLKit stands out as a promising choice. It exhibits a SwiftUI-like appearance, complete with features such as `VStack` and `HStack`, reminiscent of SwiftUI components. Notably, it is actively developed and benefits from robust community support, particularly from the Vapor community.

Two more examples of how HTMLKit can be used.

Login card:

```swift
Card {
    Form(method: .post) {
        VStack {
            FieldLabel(for: "username") {
                "Username"
            }
            TextField(name: "username")
                .borderShape(.smallrounded)
        }
        VStack {
            FieldLabel(for: "password") {
                "Password"
            }
            SecureField(name: "password")
                .borderShape(.smallrounded)
        }
        .margin(insets: .bottom, length: .small)
        HStack {
            Button(role: .submit) {
                "Sign in"
            }
            .buttonStyle(.primary)
            .borderShape(.smallrounded)
            .buttonSize(.full)
        }
        .margin(insets: .bottom, length: .small)
    }
    .tag("login-form")
    .onSubmit { form in
        form.validate("login-form", LoginModel.Input.validators)
    }
}
.borderShape(.smallrounded)
.frame(width: .twelve)
```

Grid with cards:

```swift
Grid(ratio: .custom("masonary")) {
    for item in pagination.items {
        Card {
            item.message
        }
        .borderShape(.smallrounded)
    }
}
.contentSpace(.small)
```

##### Conclusion

I believe HTMLKit is a great option when you're considering creating your website or web application using Swift. It provides a straightforward and user-friendly approach with components reminiscent of SwiftUI, making it easier to write correct HTML. Choosing HTMLKit can simplify the process of building and structuring your web content, especially if you're already familiar with Swift.


<small><small>#100DaysToOffload 5/100</small></small>
