Supporto the Quarto
================

Zhian N. Kamvar
2022-09-22

-   [NOTES](#notes)
-   [Signatories](#signatories)
    -   [Project team](#project-team)
    -   [Contributors](#contributors)
    -   [Consulted](#consulted)
-   [The Problem](#the-problem)
-   [The proposal](#the-proposal)
    -   [Overview](#overview)
    -   [Detail](#detail)
-   [Project plan](#project-plan)
    -   [Start-up phase](#start-up-phase)
    -   [Technical delivery](#technical-delivery)
    -   [Other aspects](#other-aspects)
-   [Requirements](#requirements)
    -   [People](#people)
    -   [Processes](#processes)
    -   [Tools & Tech](#tools--tech)
    -   [Funding](#funding)
    -   [Summary](#summary)
-   [Success](#success)
    -   [Definition of done](#definition-of-done)
    -   [Measuring success](#measuring-success)
    -   [Future work](#future-work)
    -   [Key risks](#key-risks)


## NOTES

These are notes from talking with Yanina about [my twitter thread](https://twitter.com/ZKamvar/status/1573363038669111298?s=20&t=fhQlFMOf1AuH2baVbjvsCQ)

lessons that are not in R can use this infrastructure <- this is a good pitch

The fact that The Carpentries has high impact for larger communities. 

Proposals like this have a good chance. 

Try to highlight a tool for people who want to create training materials with the carpentries philosophy

lesson will have evidence-based teaching practices. 

we are providing tools to make it easier. No expertise on GitHub Actions, Quarto, Yaml needed.

Highlight that The Carpentries materials are used in other places. 

> The primary purpose of the R Consortium (collectively, the “Purpose”) is to: 
>
>(a) advance the worldwide promotion of and support for the R open source
>language and environment as the preferred language for statistical computing
>and graphics (the “Environment”);
>
>(b) establish, maintain, seek support for, and develop infrastructure projects
>and technical and infrastructure collaboration initiatives related to the
>Environment, and such other initiatives as may be appropriate to support,
>enable and promote the Environment; 
>
>(c) encourage and increase user adoption, involvement with, and contribution
>to, the Environment; 
>
>(d) facilitate communication and collaboration among users and developers of
>the Environment, the R Consortium and the R Foundation for Statistical
>Computing (the “R Foundation”); 
>
>(e) support and maintain policies set by the Board; and 
>
>(f) undertake such other activities as may from time to time be appropriate to
>further the purposes and achieve the goals set forth above.  
>
>In furtherance of these efforts, the R Consortium shall seek to solicit the
>participation of all interested parties on a fair, equitable and open basis.
>*[R Consortium Bylaws, Section 1.4](https://bylaws.r-consortium.org)*


## Signatories

<!-- 
This section provides the ISC with a view of the support received from the community for a proposal. Acceptance isn't predicated on popularity but community acceptance is important.  Willingness to accept outside input is also a good marker for project delivery. 

An optional section would be for R-Core signatories where changes to R are proposed.
-->

### Project team

<!-- 
Who are the people responsible for actually delivering the project if the proposal gets accepted and are already signed up and rearing to go?
-->
Zhian N. Kamvar - Lead Developer
Toby Hodges - Community Advocate
Kari L. Jordan - Supervisor


### Contributors

<!-- 
Who are the people who have actively helped with this proposal but won't necessarily be on the core project team later?
-->

### Consulted

<!-- 
Who has been given the opportunity to provide feedback on the proposal? This should include any R Consortium & ISC members who the proposal has been discussed with.
-->

Yanina Bellini Saibene

## The Problem

<!-- 
Outlining the issue / weak point / problem to be solved by this proposal. This should be a compelling section that sets the reader up for the next section - the proposed solution!

It is important to cover:

 - [ ] What the problem is
 - [ ] Who it affects
 - [ ] Have there been previous attempts to resolve the problem
 - [ ] Why it should be tackled
-->

### Problem Statement

Of all languages, R is the most versatile when it comes to literate programming and the ability to rapidly publish results thanks to the advent of R Markdown.
More importantly, unlike JSON-based formats like Jupyter notebooks, R Markdown enables **reproducible collaboration** under version control.
Literate programming also enables the creation of maintainable and reproducible teaching materials.
To host such materials, however, requires not only expertise in a domain area, it also requires knowledge of continuous deployment systems, reproducible workflows, and UI elements for the Web.
Designed with our Core Values in mind, The Carpentries lesson infrastructure provides templating, guidance, and tools that allows rapid development and publishing of high-quality lesson content.
The lesson contributor only needs to focus on the writing the content of the lesson in Markdown or R Markdown.
With this infrastructure, we champion community collaboration and access for all.

The infrstructure---called "The Carpentries" workbench---is a "batteries-included" setup for building lessons that allows anyone to take new or pre-existing Markdown or R Markdown lesson materials and create a lesson.
The Carpentries Workbench uses {knitr} to render R Markdown documents to Markdown followed by pandoc and {pkgdown} to render Markdown to HTML.
For lessons that teach R, authoring R Markdown with a seamless integration with {renv} ensures that lessons are reproducible by default.
Moreover, integration with GitHub Actions means that pull request previews can show lesson maintainers exactly where output in a lesson has changed from new contributions or package updates.

Lessons that do not teach R, however, must use plain Markdown where the output of demonstrative and excercise code is copy and pasted into lessons.
Copy and pasting outputs is inherently non-reproducible and makes non-R lessons difficult to maintain as the software ecosystem changes and evolves.
Ultimately, these extra steps are significant burdens in a volunteer framework.
These burdens not only result in lost contributions to existing lessons, but also lessons that were never developed.

There have been attempts in The Carpentries community to create work-arounds to this problem.
Some lesson authors who work with Python have created a separate folder of Jupyter notebooks and render them to markdown (such as [Intro to MRI Data in Python](https://github.com/carpentries-incubator/SDC-BIDS-IntroMRI/tree/3d9d687a7c49c6af761a9170ed7ea60f16fcc0d2)), which is then used as the input for the lesson.
This allows them to work in a framework that is comfortable for them, but it hampers collaboration because people who want to contribute may attempt to contribute to the markdown output, when they should be contributing to the notebooks.

Others, such as [the Learn To Discover group](https://github.com/LearnToDiscover/Basic_Python) have used {reticulate} in The Carpentries Workbench to provide interoperability between R and Python. This gives the advantage that contributors are able to contribute to the lesson, but the format is not familiar or clear.

In both cases, the lesson authors needed knowledge of continuous deployment, reproducible workflows, and of the underlying framework to accomplish their goals.

We want our lesson infrastructure to live up to our values of people first, access for all, community collaboration, and strength through diversity. 
We propose to eliminate the extra burdens required to contribute to non-R lessons and create opportunities to create cross-language lessons by integrating Quarto into The Carpentries Workbench.
Released in July 2022, Quarto is a framework based the same principles as R Markdown that allows anyone to write their analysis in their preferred programming language and easily publish their results in a reproducible manner.


## The proposal

<!--
This is where the proposal should be outlined. 
-->

### Overview

<!--
At a high-level address what your proposal is and how it will address the problem identified. Highlight any benefits to the R Community that follow from solving the problem. This should be your most compelling section.
-->
The Carpentries Workbench is a lesson publication system as a set of R packages that prioritises accessibility and sensible defaults to produce Carpentries and Carpentries style lessons.
Moreover, we provide a non-invasive reproducible workflow based on {renv} in the background for lessons that use R Markdown sources.
This ensures the lesson content is robust to sudden changes in the R package ecosystem.
To build our lessons, we use a two-step workflow that first renders R Markdown to markdown with {knitr} and then parses that markdown into HTML with pandoc and {pkgdown}.

While this approach works for both R Markdown and Markdown-based lessons, since 2016, there has been an inequity of literate programming in our lesson infrastructure. 
Only R lessons have the ability to dynamically generate output, tables, and figures for their lessons.
Lessons that demonstrate the shell, SQL, Make, Python, and other languages have output, tables, and figures manually copy and pasted by hand.
This manual process creates a bottleneck in lesson development that can lead to spurious errors and increases barriers to adoption.

With the advent of Quarto, which uses a similar two-step model for rendering documents, we propose to replace the underlying engines for rendering our websites from a {knitr}/pandoc-based approach to one that takes advantage of Quarto's polyglot features. 

We have lowered the barrier for others to access our evidence-based approach to lesson design and deployment.
Because the Carpentries Materials are always open-source, may organisations have used and remixed our infrastructure for their own purposes.
By incorporating Quarto, we will be able increase the quality of non-R lessons and help strengthen the bridge between languages to enable lessons in other languages and eventually polyglot lessons.
This will in turn help train future generations of researchers to work reproducibly.


### Detail

<!--
Go into more detail about the specifics of the project and it delivers against the problem.

Depending on project type the detail section should include:

 - [ ] Minimum Viable Product
 - [ ] Architecture
 - [ ] Assumptions
-->

## Project plan

### Start-up phase

<!--
Covering the planning phase, this section should provide a relatively detailed plan of how work will start on the project. This section is important because projects need to get up and running quickly.


 - [ ] Setting up collaboration platform inc. code for contributors etc.
 - [ ] Licence decisions
 - [ ] Reporting framework
-->

### Technical delivery

<!--
Covering the actual delivery of the project this section should provide at least a high-level the implementation. 

Including target dates is really important as you need to be committed and the ISC need to have a means of tracking delivery
-->

1. Replace {knitr} with {quarto} to achieve polyglot capabilities
2. Harness pyenv to create non-invasive versioning system for python documents
3. Create lua filters to replace XPath manipulation currently in {sandpaper}
4. Replace Mustache templates with pandoc templates
5. Release varnish as a quarto theme


### Other aspects

<!--
Covering non-technical activities like on-going publicity, paper preparation, discussion groups etc. that might be required to facilitate successful delivery of the project.

 - [ ] Announcement post
 - [ ] Delivery blog post
 - [ ] Twitter
 - [ ] UseR!
 - [ ] ISC meetings
-->

## Requirements

<!-- 
An idea of what is required to make the project actually happen
-->

### People

<!--
Who needs to be involved, what's the proposed structure, what will it take to get their involvement?
-->

### Processes

<!-- 
What processes need to be put in place e.g. codes of conduct, regular ISC meetings, handover to the community at large?
-->

### Tools & Tech

<!--
What is going to be needed to deliver this project? 

Will cloud computing be used - if yes are there are necessary components that will be deciding factors between providers?

Are there tools or tech that don't exist that will be produced to facilitate the project?
-->

### Funding

<!-- 
[TO DO] THE GUIDANCE IS PRETTY UNCLEAR, ESP IN LIGHT OF GABOR'S PROPOSAL VS AWARD SIZE

-->

### Summary

<!--
A summary of the requirements that contextualises the costs
-->

## Success

<!-- 
Projects should have a definition of done that is measurable, and a thorough understanding going in of what the risks are to delivery 
-->

### Definition of done

<!-- 
What does success look like? 
-->

### Measuring success

<!-- 
How will we know when success is achieved, what markers can we use along the way 
-->

### Future work

<!-- 
How could this be extended / developed in the future by yourself and/or the community in general?
-->

### Key risks

<!-- 
What sort of things could come up that can delay or break the project?

 - [ ] People
 - [ ] Processes
 - [ ] Tooling & Technology
 - [ ] Costs

-->

People: Zhian is currently the sole developer of the workbench. His time is a bottleneck

Costs: none; only time.

