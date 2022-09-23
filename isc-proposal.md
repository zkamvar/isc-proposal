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

We host lessons in markdown and R Markdown. 

In The Carpentries workbench, we use {knitr} to render R Markdown followed by {pkgdown} with mustache templating to render the lessons into websites.

Lessons that do not teach R are written in Markdown and output is copy and pasted into the lessons, making them difficult to maintain.

We want to replace our {knitr} and {pkgdown} engines to use {quarto} so that people can develop lessons using any engine avaialable in a jupyter kernel, meeting people where they are. 

### Stakeholders

This will most immediately affect lesson maintainers and developers of non-R lessons by reducing the amount of manual validation needed. 
It will secondarily affect learners and instructors who will benefit from more up-to-date material. 

### Previous Attempts

The Learn To Discover project has implemented python running via the {reticulate} package: <https://learntodiscover.github.io/Basic_Python/>

### raison d'être

Access for all. 

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

