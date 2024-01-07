---
title: Case against the cloud
date: 2023-03-23 05:00
description: Case against the cloud
tags: ramblings
---

Migrating to the cloud or starting with a cloud-based solution has become increasingly popular in recent years, with many businesses 
opting for this approach. However, I believe that for most projects, it may be an overkill and not the most economical 
option in the long run.

One of the key concerns with migrating to the cloud is the potential for lock-in. Once you start using a cloud-based solution, 
it can be difficult and costly to move out of that solution if you decide to switch to a different provider or solution. This 
can be particularly problematic if the solution you are locked into does not provide the features or functionality that you need, 
or if the costs associated with the solution become prohibitive.

Ahrefs wrote a piece comparing costs [^1] between running in a datacenter versus running on AWS:

> Ahrefs has a rented colocation data center in Singapore with a rather homogenous infrastructure. So we decided to consolidate all the costs spent for this data center, divide them by the number of servers, and compare them to the cost of a similar installation in the Amazon Web Services (AWS) cloud (we use this as the leading IaaS example). 

> Ahrefs has saved ~USD 400 million by ensuring its infrastructure is NOT 100% in the IaaS cloud during the last 2½ years. This figure is growing bigger, as currently we are starting another massive colocation data center with new hardware.


37signals known for Basecamp and Hey, started moving away[^2] from the cloud:

> You inevitably accrue some dimension of technical debt and complexity on this path. Your deployment strategy isn’t the only thing that has to change: you’ll have to invent new tooling to manage those stacks and create useful CI/CD to cater to the needs of both operations and programming. Most likely you will have to rethink your monitoring strategy as well.

> Bottom line: you need a lot of processes to do this right. In a lot of places, it became apparent we were spending more than we got out of it in return — not just economically, but also operationally.


They are also very open[^3] about the cost:

> In total, we spent $3,201,564 on all these cloud services in 2022. That comes out to $266,797 per month. Whew!

> In 2023, we hope to dramatically cut that bill by moving a lot of services and dependencies out of the cloud and onto our own hardware. 



[^1]: [https://tech.ahrefs.com/how-ahrefs-saved-us-400m-in-3-years-by-not-going-to-the-cloud-8939dd930af8](https://tech.ahrefs.com/how-ahrefs-saved-us-400m-in-3-years-by-not-going-to-the-cloud-8939dd930af8)
[^2]: [https://dev.37signals.com/bringing-our-apps-back-home/](https://dev.37signals.com/bringing-our-apps-back-home/)
[^3]: [https://dev.37signals.com/our-cloud-spend-in-2022/](https://dev.37signals.com/our-cloud-spend-in-2022/)
