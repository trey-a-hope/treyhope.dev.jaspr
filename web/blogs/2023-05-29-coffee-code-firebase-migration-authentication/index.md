---
author: Trey Hope
category: coffee-code
date: 2023-05-29
description: Moving the Book Quote app to its own Firebase project, migrating Cloud Firestore data, adding authentication, and restructuring the database.
slug: coffee-code-firebase-migration-authentication
tags: firebase, authentication, migration, cloudFirestore, database
title: Coffee & Code - Book Quote App Firebase Migration & Authentication
---

![350346070_943062213569910_5470861441392636291_n.jpg](./350346070_943062213569910_5470861441392636291_n.jpg)
 
> Cold Brew from [Grand View Grind](https://www.instagram.com/grandviewgrind/) in Columbus, Ohio
> 

The Book Quote app needed to have its own Firebase project, as I was previously using it under another one.

![350499562_635867778600909_4745683325622913735_n.jpg](./350499562_635867778600909_4745683325622913735_n.jpg)

To do this, I had to also start moving the data in Cloud Firestore and Firebase Storage to the new Firebase project.

A very tedious task that I’ll eventually get to over time.

![350091128_110979008680445_3565271769640510804_n.jpg](./350091128_110979008680445_3565271769640510804_n.jpg)

But for now, the app also now supports authentication.

I plan to release it to the public so that others can upload their very own favorite book quotes as well.

![349520011_614790287044124_7498742193624106171_n.jpg](./349520011_614790287044124_7498742193624106171_n.jpg)

I needed to restructure the database to have a users collection, which each document in the collection will contain both

![349554235_7191909327502508_3427543107441881855_n.jpg](./349554235_7191909327502508_3427543107441881855_n.jpg)

1. User related meta data.
2. A books collection that stores their favorite books and their quotes.

<video width="100%" height="auto" controls key="book-quotes-video">
   <source src="./AQPTJNx71J8GFWfPFAn1KLXxmZ8u5Q1RNwqiHqDkR8TuDCKXau9gsphLbDvtKjG9qhBKFYaHKqnygbpdV2LVYISu.mp4" type="video/mp4">
   Your browser does not support the video tag.
</video>
