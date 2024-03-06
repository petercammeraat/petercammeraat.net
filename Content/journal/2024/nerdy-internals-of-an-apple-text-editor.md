---
title: Nerdy internals of an Apple text editor
date: 2024-03-06 05:00
description: Nerdy internals of an Apple text editor
tags: linked, appkit
---

> To understand how text editing works in native Apple text editors, we first need to discuss the centerpiece of the whole system — the TextView class. Technically, NSTextView and UITextView have their differences, but the API is similar enough that we can treat them as a single TextView class. I will highlight the differences where necessary.

> TextView is a massive component that only grows in complexity with each release of respective operating systems. The TextEdit app consists almost entirely of a single TextView. When a single class can be used to build an entire app — you know it’s a beast.

→ [https://papereditor.app/internals](https://papereditor.app/internals)

A lovely deep dive in `TextView` and related API's. 

Very well written, accompanied with good images/videos to explain something, absolutely worth the read. 

Especially if you want to know more about `NSTextView`, `NSTextStorage`, `NSTextContainer`, `NSLayoutManager`, `NSScrollView`, `NSAttributedString`, and much more.


<small><small>#100DaysToOffload 15/100</small></small>
